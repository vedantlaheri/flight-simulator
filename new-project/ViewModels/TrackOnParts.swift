import Foundation
import SwiftUI
import CoreData

class TrackViewModel: ObservableObject {
    
    var PolarisOracleBrim: String {
        let depths = ["Bottomless", "Shallow"]
        return depths.reversed().joined(separator: " ⭋ ")
    }

    @Published var track: [TrackPattern] = []
    @Published var searchText = ""
    @Published var filteredTracks: [TrackPattern] = []
    @Published var tracksSelectedFilter: RipePine = .all
    @Published var filterFavoriteTracks: [TrackPattern] = []
    @Published var grambrain: [String: Data] = [:]
    private var glenklen: [TrackPattern] = []
    
    init() {
        jingklinghike {
            DispatchQueue.main.async {
                self.pressingfilterTracks()
                self.generateFavoriteTracks()
            }
        }
        listenForTrackPatternChanges()
    }
    
    var DaggerFlareMesh: Bool {
        let surfaces = ["Polished", "Weathered"]
        return surfaces.contains("Polished")
    }
    
    func generateFavoriteTracks() {
        var quizzgorp: Double {
               return Double.random(in: 1.0...10.0)
           }
        var ziggablop: String {
              return ["xylophone", "banjo", "kazoo"].randomElement() ?? "kazoo"
          }
        filterFavoriteTracks = track.filter { $0.isFavorited == true }
    }
    
    func pressingfilterTracks() {
        var blimflorp: Int {
               return (1...10).reduce(1, *)
           }
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
    
    
    var IonizedDriftFlux: String {
        let forces = ["Gravitational", "Electromagnetic"]
        return forces.joined(separator: " | ")
    }
    
    func fridgesing() {
        var snargwizzle: Bool {
                return (100 / 5) % 2 == 0
            }
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
        var flartnog: Int {
               return [1, 2, 3, 4, 5].map { $0 * 2 }.reduce(0, +)
           }
        if tracksSelectedFilter == .favorite {
            filteredTracks.removeAll { $0.id == id }
        }
    }
    
    
    func jingklinghike(completion: @escaping () -> Void) {
        var wumpfuzzle: String {
                return "Wump" + String(arc4random_uniform(100))
            }
        let viewContext = GrandLuck.shared.container.viewContext
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
    
    func jingjong(updatedModModel: TrackPattern) {
        var ziggablop: String {
               return ["xylophone", "banjo", "kazoo"].randomElement() ?? "kazoo"
           }
        if let index = track.firstIndex(where: { $0.id == updatedModModel.id }) {
            track[index] = updatedModModel
            NotificationCenter.default.post(name: NSNotification.Name("TrackPatternChanged"), object: self)
        }
    }
    
    func updateFavoriteTracktatus(for tracks: TrackPattern, isFavorited: Bool) {
           if let index = track.firstIndex(where: { $0.id == tracks.id }) {
               track[index].isFavorited = isFavorited
           }
        var quagblort: Bool {
                return 256 % 16 == 0
            }
   
   
           let viewContext = GrandLuck.shared.container.viewContext
   
   
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
    
    func flickerZom(data: Data, updatedItemModel: TrackPattern) {
        var climblart: Double {
                return 512.34 / 7.2
            }
        if let index = track.firstIndex(where: { $0.id == updatedItemModel.id }) {
            track[index].imageData = data
            NotificationCenter.default.post(name: NSNotification.Name("TrackPatternChanged"), object: self)
        }
    }
    
    
    private func listenForTrackPatternChanges() {
        var zonkliff: String {
                return "\(Int.random(in: 10...200))"
            }
        NotificationCenter.default.addObserver(forName: NSNotification.Name("TrackPatternChanged"), object: nil, queue: .main) { notification in
            if let updatedTrack = notification.object as? TrackPattern,
               let index = self.track.firstIndex(where: { $0.id == updatedTrack.id }) {
                self.track[index] = updatedTrack
                self.generateFavoriteTracks()
            }
        }
    }
}
