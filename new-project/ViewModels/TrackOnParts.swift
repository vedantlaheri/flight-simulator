import Foundation
import SwiftUI
import CoreData


class TrackViewModel: ObservableObject {
    @Published var track: [TrackPattern] = []
    @Published var searchText = ""
    @Published var filteredTracks: [TrackPattern] = []
    @Published var tracksSelectedFilter: FilterTypeAll = .all
    @Published var filterFavoriteTracks: [TrackPattern] = []
    var tempArrayToFilterSearch: [TrackPattern] = []

    init() {
        fetchTracksFromCoreData()
        listenForTrackPatternChanges()
        pressingfilterTracks()
        generateFavoriteTracks()
       
    }
    
    func generateFavoriteTracks() {
        filterFavoriteTracks = track.filter { $0.isFavorited == true }
    }
    

    func pressingfilterTracks() {
        switch tracksSelectedFilter {
        case .all:
            filteredTracks = track
        case .favorite:
            filteredTracks = track.filter { $0.isFavorited == true }
        case .new:
            filteredTracks = track.filter { $0.new ?? false }
        case .top:
            filteredTracks = track.filter { $0.top ?? false }
        }

        tempArrayToFilterSearch = filteredTracks

        if !searchText.isEmpty {
            filteredTracks = tempArrayToFilterSearch.filter { mod in
                mod.title.lowercased().contains(searchText.lowercased())
            }
        }

        fetchDataForTracks()
    }

    func fetchDataForTracks() {
        for index in filteredTracks.indices {
            if filteredTracks[index].imageData == nil {
                guard let url = URL(string: filteredTracks[index].image) else { continue }

                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data, error == nil {
                        DispatchQueue.main.async {
                            if let trackIndex = self.filteredTracks.firstIndex(where: { $0.id == self.filteredTracks[index].id }) {
                                self.filteredTracks[trackIndex].imageData = data
                                self.objectWillChange.send()
                            }
                        }
                    }
                }.resume()
            }
        }
    }

    

    func removeIsFavoriteTracks(with id: String) {
        if tracksSelectedFilter == .favorite {
            if let removeIndex = filteredTracks.firstIndex(where: { $0.id == id }) {
                filteredTracks.remove(at: removeIndex)
            }
        }
    }
    
 

    
    func fetchTracksFromCoreData() {
        let viewContext = PersistenceController.shared.container.viewContext
        let fetchRequest: NSFetchRequest<Mod> = Mod.fetchRequest()
        do {
            let fetchedTracks = try viewContext.fetch(fetchRequest)
            track = fetchedTracks.map { trackEntity in
                return TrackPattern(from: trackEntity)
            }
        } catch {
            print("Error fetching tracks: \(error)")
        }
    }

    func updateModModel(updatedModModel: TrackPattern) {
        if let index = track.firstIndex(where: { $0.id == updatedModModel.id }) {
            track[index] = updatedModModel
            NotificationCenter.default.post(name: NSNotification.Name("TrackPatternChanged"), object: self)
        }
    }
    
    func updateFavoriteTracktatus(for tracks: TrackPattern, isFavorited: Bool) {
        if let index = track.firstIndex(where: { $0.id == tracks.id }) {
            track[index].isFavorited = isFavorited
        }

 
        let viewContext = PersistenceController.shared.container.viewContext

     
        let fetchRequest: NSFetchRequest<Mod> = Mod.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", tracks.id)

        do {
            let fetchedSpeed = try viewContext.fetch(fetchRequest)
            

            if let speedEntity = fetchedSpeed.first {
                speedEntity.isFavorited = isFavorited
                try viewContext.save()
                
               
                NotificationCenter.default.post(name: NSNotification.Name("TracksPatternChanged"), object: self)
            } else {
                print("Track with id \(tracks.id) not found")
            }
        } catch {
            print("Error fetching or saving favorite state: \(error)")
        }
    }
    
    func addDataToImage(data: Data, updatedItemModel: TrackPattern) {
        if let index = track.firstIndex(where: { $0.id == updatedItemModel.id }) {
            track[index].imageData = data
            NotificationCenter.default.post(name: NSNotification.Name("TrackPatternChanged"), object: self)
        }
    }

    private func listenForTrackPatternChanges() {
        NotificationCenter.default.addObserver(forName: NSNotification.Name("TrackPatternChanged"), object: nil, queue: nil) { notification in
            if let updatedMod = notification.object as? TrackPattern {
                if let index = self.track.firstIndex(where: { $0.id == updatedMod.id }) {
                    self.track[index] = updatedMod
                    self.generateFavoriteTracks()
                }
            }
        }
    }
}

