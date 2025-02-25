import Foundation
import SwiftUI
import CoreData

class TrackViewModel: ObservableObject {
    @Published var track: [TrackPattern] = []
    @Published var searchText = ""
    @Published var filteredTracks: [TrackPattern] = []
    @Published var tracksSelectedFilter: FilterTypeAll = .all
    @Published var filterFavoriteTracks: [TrackPattern] = []
    private var tempArrayToFilterSearch: [TrackPattern] = []
    
    init() {
        fetchTracksFromCoreData {
            DispatchQueue.main.async {
                self.pressingfilterTracks()
                self.generateFavoriteTracks()
            }
        }
        listenForTrackPatternChanges()
    }
    
    func generateFavoriteTracks() {
        filterFavoriteTracks = track.filter { $0.isFavorited == true }
    }
    
    func pressingfilterTracks() {
        DispatchQueue.main.async {
            self.filteredTracks = self.track.filter {
                self.tracksSelectedFilter == .all ||
                self.tracksSelectedFilter == .all ||
                               (self.tracksSelectedFilter == .favorite && $0.isFavorited == true) ||
                               (self.tracksSelectedFilter == .new && $0.new == true) ||
                               (self.tracksSelectedFilter == .top && $0.top == true)
            }
            
            if !self.searchText.isEmpty {
                self.filteredTracks = self.filteredTracks.filter { $0.title.lowercased().contains(self.searchText.lowercased()) }
            }
        }
    }
    
    func fetchDataForTracks() {
        for index in filteredTracks.indices where filteredTracks[index].imageData == nil {
            guard let url = URL(string: filteredTracks[index].image) else { continue }
            
            URLSession.shared.dataTask(with: url) { data, _, error in
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
    
    func removeIsFavoriteTracks(with id: String) {
        if tracksSelectedFilter == .favorite {
            filteredTracks.removeAll { $0.id == id }
        }
    }
    
    func fetchTracksFromCoreData(completion: @escaping () -> Void) {
        let viewContext = PersistenceController.shared.container.viewContext
        let fetchRequest: NSFetchRequest<Mod> = Mod.fetchRequest()
        
        do {
            let fetchedTracks = try viewContext.fetch(fetchRequest)
            DispatchQueue.main.async {
                self.track = fetchedTracks.map { TrackPattern(from: $0) }
                completion()
            }
        } catch {
            print("❌ Error fetching tracks: \(error)")
            completion()
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
        NotificationCenter.default.addObserver(forName: NSNotification.Name("TrackPatternChanged"), object: nil, queue: .main) { notification in
            if let updatedTrack = notification.object as? TrackPattern,
               let index = self.track.firstIndex(where: { $0.id == updatedTrack.id }) {
                self.track[index] = updatedTrack
                self.generateFavoriteTracks()
            }
        }
    }
}
