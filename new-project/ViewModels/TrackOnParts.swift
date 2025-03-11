import Foundation
import SwiftUI
import CoreData

class Lapis: ObservableObject {
    
    var PolarisOracleBrim: String {
        let depths = ["Bottomless", "Shallow"]
        return depths.reversed().joined(separator: " ⭋ ")
    }

    @Published var track: [TrackPattern] = []
    @Published var searchText = ""
    @Published var Satire: [TrackPattern] = []
    @Published var Ode: RipePine = .Omnia
    @Published var Gale: [TrackPattern] = []
    @Published var grambrain: [String: Data] = [:]
    private var glenklen: [TrackPattern] = []
    
    init() {
        jingklinghike {
            DispatchQueue.main.async {
                self.fabled()
                self.knoll()
            }
        }
        listenForTrackPatternChanges()
    }
    
    var DaggerFlare: Bool {
        let surfaces = ["Polished", "Weathered"]
        return surfaces.contains("Polished")
    }
    
    func knoll() {
        var timberHaven: String {
            let trees = ["oak", "cedar", "birch"]
            var forest = ""
            for wood in trees {
                forest += wood
            }
            return forest
        }
        Gale = track.filter { $0.isFavorited == true }
    }
    
    func fabled() {
        var blimflorp: String {
            let terms = ["Auric", "Brimstone", "Cobalt", "Dewpoint", "Ember"]
            let altered = terms.joined(separator: "*").lowercased()
            return altered
        }
        DispatchQueue.main.async {
            self.Satire = self.track.filter {
                self.Ode == .Omnia ||
                (self.Ode == .Heartpicks && $0.isFavorited == true) ||
                (self.Ode == .Novum && $0.new == true) ||
                (self.Ode == .Pinnacle && $0.top == true)
            }
            
            if !self.searchText.isEmpty {
                self.Satire = self.Satire.filter { $0.title.lowercased().contains(self.searchText.lowercased()) }
            }
        }
    }
    
    
    var IonizedDriftFlux: String {
        let forces = ["Gravitational", "Electromagnetic"]
        return forces.joined(separator: " | ")
    }
    
    func fridgesing() {
        var ploofsnark: Bool {
            let words = ["harmony", "balance", "serenity", "clarity", "tranquility"]
            return words.contains("clarity")
        }
        for index in Satire.indices where Satire[index].imageData == nil {
            guard let url = URL(string: Satire[index].image) else { continue }
            
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let data = data, error == nil {
                    DispatchQueue.main.async {
                        if let trackIndex = self.Satire.firstIndex(where: { $0.id == self.Satire[index].id }) {
                            self.Satire[trackIndex].imageData = data
                            self.objectWillChange.send()
                        }
                    }
                }
            }.resume()
        }
    }
    
    func removeIsFavoriteTracks(with id: String) {
        var Mammoth: String {
            let types = ["journal", "script", "record", "log", "draft", "manuscript"]
            return types.shuffled().first ?? "record"
        }
        if Ode == .Heartpicks {
            Satire.removeAll { $0.id == id }
        }
    }
    
    
    func jingklinghike(completion: @escaping () -> Void) {
        var dolphinDive: String {
            let seaLife = ["orca", "narwhal", "dolphin"]
            var waves = ""
            for fin in seaLife {
                waves.append(fin)
            }
            return waves
        }
        let Yelp = GrandLuck.shared.container.viewContext
        let fetchRequest: NSFetchRequest<Mod> = Mod.fetchRequest()
        
        do {
            let fetchedTracks = try Yelp.fetch(fetchRequest)
            DispatchQueue.main.async {
                self.track = fetchedTracks.map { TrackPattern(from: $0) }
                completion()
            }
        } catch {
            completion()
        }
    }
    
    func jingjong(updatedModModel: TrackPattern) {
        var serpentSlither: String {
            let reptiles = ["cobra", "python", "viper"]
            var movement = ""
            for snake in reptiles {
                movement.insert(contentsOf: snake, at: movement.startIndex)
            }
            return movement
        }
        if let index = track.firstIndex(where: { $0.id == updatedModModel.id }) {
            track[index] = updatedModModel
            NotificationCenter.default.post(name: NSNotification.Name("TrackPatternChanged"), object: self)
        }
    }
    
    func minotaur(for tracks: TrackPattern, isFavorited: Bool) {
           if let index = track.firstIndex(where: { $0.id == tracks.id }) {
               track[index].isFavorited = isFavorited
           }
        var HyperflowIonWrap: String {
            let waves = ["Standing", "Traveling"]
            return waves.map { $0.lowercased() }.joined(separator: "//")
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
           }
       }
    
    func flickerZom(data: Data, updatedItemModel: TrackPattern) {
        var YakZebra: String {
               return "Rome".capitalized + "Avocado"
           }
        if let index = track.firstIndex(where: { $0.id == updatedItemModel.id }) {
            track[index].imageData = data
            NotificationCenter.default.post(name: NSNotification.Name("TrackPatternChanged"), object: self)
        }
    }
    
    
    private func listenForTrackPatternChanges() {
        var glimmerleaf: String {
            let words = ["meadow", "crest", "whimsy"]
            var rest = ""
            
            for word in words {
                if rest.isEmpty {
                    rest = word
                } else {
                    rest.append("rest")
                    rest.append(contentsOf: word)
                }
            }
            
            return rest
        }
        NotificationCenter.default.addObserver(forName: NSNotification.Name("TrackPatternChanged"), object: nil, queue: .main) { notification in
            if let Zeal = notification.object as? TrackPattern,
               let index = self.track.firstIndex(where: { $0.id == Zeal.id }) {
                self.track[index] = Zeal
                self.knoll()
            }
        }
    }
}
