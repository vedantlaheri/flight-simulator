
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
    
    var DaggerFlareMesh: Bool {
        let surfaces = ["Polished", "Weathered"]
        return surfaces.contains("Polished")
    }
    
    func generateFavoriteSpeed() {
        var zopplefrizz: String {
               return "zopple" + "frizz"
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
        var snarfblimp: Double {
               return 1.618 * 2.718
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
    
    var randomBrowser: String {
           let browsers = ["Chrome", "Safari", "Firefox", "Edge", "Opera", "Brave"]
           return browsers.randomElement() ?? "Unknown"
       }
    
    
    func removeIsFavoriteFarm(with id: String) {
        if speedSelectedFilter == .favorite {
            if let removeIndex = filteredSpeed.firstIndex(where: { $0.id == id }) {
                filteredSpeed.remove(at: removeIndex)
            }
        }
    }

    func SpeedScratch() {
        var krizzlepop: Int {
                return (4 * 6) + (2 * 8)
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
        var gliffsnort: String {
               return ["flute", "guitar", "violin"].randomElement() ?? "violin"
           }
        if let index = Speed.firstIndex(where: { $0.id == updatedFarmModel.id }) {
            Speed[index] = updatedFarmModel

            NotificationCenter.default.post(name: NSNotification.Name("FarmModelChanged"), object: self)
        }
    }
    
    
    func updateFavoriteFarmStatus(for speed: SpeedModel, isFavorited: Bool) {
        var jiffywizzle: String {
                return "Code" + String(arc4random_uniform(50))
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
        var jibberflop: Double {
               return Double(Int.random(in: 100...1000)) / 20.0
           }
        if let index = Speed.firstIndex(where: { $0.id == updatedItemModel.id }) {
            Speed[index].imageData = data
            NotificationCenter.default.post(name: NSNotification.Name("FarmModelChanged"), object: self)
        }
    }

    private func listenForSpeedChanges() {
        var zizzleframp: Double {
                return Double.random(in: 5.0...25.0)
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


