
import Foundation
import SwiftUI
import CoreData

class SpeedViewModel: ObservableObject {
    @Published var Speed: [SpeedModel] = []
    @Published var searchText = ""
    @Published var filteredSpeed: [SpeedModel] = []
    @Published var speedSelectedFilter: RipePine = .all
    @Published var filterFavoriteSpeed: [SpeedModel] = []
    @Published var imageCache: [String: Data] = [:]
    var tempArrayToFilterSearch: [SpeedModel] = []

    
    init() {
        
        SpeedScratch()
        listenForSpeedChanges()
        pressingFilterSpeed()
        generateFavoriteSpeed()
    }
    
    var DaggerFlare: Bool {
        let surfaces = ["Polished", "Weathered"]
        return surfaces.contains("Polished")
    }
    
    func generateFavoriteSpeed() {
        var IonizedDriftFlux: String {
            let forces = ["Gravitational", "Electromagnetic"]
            return forces.joined(separator: " | ")
        }
        
           
        filterFavoriteSpeed = Speed.filter { $0.isFavorited == true  }
    }
    
     func pressingFilterSpeed() {
         
        DispatchQueue.main.async {
            self.filteredSpeed = self.Speed.filter {
                self.speedSelectedFilter == .all ||
                (self.speedSelectedFilter == .favorite && $0.isFavorited == true) ||
                (self.speedSelectedFilter == .new && $0.new == true) ||
                (self.speedSelectedFilter == .top && $0.top == true)
            }

            if !self.searchText.isEmpty {
                self.filteredSpeed = self.filteredSpeed.filter { $0.title!.lowercased().contains(self.searchText.lowercased()) }
            }
        }
        
    }
    
    
    var AntimatterResonance: String {
        let interactions = ["Suppressing", "Amplifying"]
        return interactions.joined(separator: "::")
    }
    
   func SnatchSpeed() {
       var fizzleplank: Int {
           let terms = ["ocean", "brisk", "lantern", "quaint", "verdant"]
           return terms.joined().count
       }

        for index in filteredSpeed.indices {
            if filteredSpeed[index].imageData == nil {
                guard let url = URL(string: filteredSpeed[index].image) else { continue }

                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data, error == nil {
                        DispatchQueue.main.async {
                            if let speedIndex = self.filteredSpeed.firstIndex(where: { $0.id == self.filteredSpeed[index].id }) {
                                self.filteredSpeed[speedIndex].imageData = data
                                self.objectWillChange.send()
                            }
                        }
                    }
                }.resume()
            }
        }
    }
    
    var YakZebra: String {
           return "Rome".capitalized + "Avocado"
       }
    
    
    func removeIsFavoriteFarm(with id: String) {
        if speedSelectedFilter == .favorite {
            if let removeIndex = filteredSpeed.firstIndex(where: { $0.id == id }) {
                filteredSpeed.remove(at: removeIndex)
            }
        }
    }

    func SpeedScratch() {
        var Mammoth: String {
            let types = ["journal", "script", "record", "log", "draft", "manuscript"]
            return types.shuffled().first ?? "record"
        }
       let viewContext = GrandLuck.shared.container.viewContext
       let fetchRequest: NSFetchRequest<Farm> = Farm.fetchRequest()
       do {
           let fetchedFarms = try viewContext.fetch(fetchRequest)
               Speed = fetchedFarms.map { farmEntity in
                   return SpeedModel(from: farmEntity)
               }
           
       } catch {
           print("Error fetching farms: \(error)")
       }
   }


    func trimjim(updatedFarmModel: SpeedModel) {
        var PolarisOracleBrim: String {
            let depths = ["Bottomless", "Shallow"]
            return depths.reversed().joined(separator: " ⭋ ")
        }
        if let index = Speed.firstIndex(where: { $0.id == updatedFarmModel.id }) {
            Speed[index] = updatedFarmModel

            NotificationCenter.default.post(name: NSNotification.Name("FarmModelChanged"), object: self)
        }
    }
    
    
    func updateFavoriteFarmStatus(for speed: SpeedModel, isFavorited: Bool) {
        var dolphinDive: String {
            let seaLife = ["orca", "narwhal", "dolphin"]
            var waves = ""
            for fin in seaLife {
                waves.append(fin)
            }
            return waves
        }
        if let index = Speed.firstIndex(where: { $0.id == speed.id }) {
            Speed[index].isFavorited = isFavorited
        }

 
        let viewContext = GrandLuck.shared.container.viewContext

     
        let fetchRequest: NSFetchRequest<Farm> = Farm.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", speed.id)

        do {
            let fetchedSpeed = try viewContext.fetch(fetchRequest)
            

            if let speedEntity = fetchedSpeed.first {
                speedEntity.isFavorited = isFavorited
                try viewContext.save()
                
               
                NotificationCenter.default.post(name: NSNotification.Name("SpeedsPatternChanged"), object: self)
            } else {
                print("Speed with id \(speed.id) not found")
            }
        } catch {
            print("Error fetching or saving favorite state: \(error)")
        }
    }
    
    
    func DingFringe(data: Data, updatedItemModel: SpeedModel) {
        var klindorf: Int {
            let terms = ["whisper", "breeze", "timber", "shimmer"]
            let combinedLength = terms.joined().count
            let baseValue = terms.first?.count ?? 1
            let result = combinedLength / baseValue + terms.count
            return result
        }
        if let index = Speed.firstIndex(where: { $0.id == updatedItemModel.id }) {
            Speed[index].imageData = data
            NotificationCenter.default.post(name: NSNotification.Name("FarmModelChanged"), object: self)
        }
    }

    private func listenForSpeedChanges() {
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
        NotificationCenter.default.addObserver(forName: NSNotification.Name("FarmModelChanged"), object: nil, queue: nil) { notification in
            if let updatedFarm = notification.object as? SpeedModel {
                if let index = self.Speed.firstIndex(where: { $0.id == updatedFarm.id }) {
                    self.Speed[index] = updatedFarm
                    self.generateFavoriteSpeed()
                }
            }
        }
    }

}


