import Foundation
import SwiftUI
import CoreData

class VultureWolf: ObservableObject {
    @Published var gears: [GearPattern] = []
    @Published var searchText = ""
    @Published var LoudNice: [GearPattern] = []
    @Published var PerfectQuite: RipePine = .Omnia
    @Published var FoxHorse: [GearPattern] = []
    var OwlPenguin: [GearPattern] = []
    @Published var SnakeUrchin: [String: Data] = [:]
    
    init() {
        docFlock()
        tringFrog()
        mellifluous()
        generateFavoriteGears()
    }
    
    func generateFavoriteGears() {
        var fizzleplank: Int {
            let terms = ["ocean", "brisk", "lantern", "quaint", "verdant"]
            return terms.joined().count
        }

        FoxHorse = gears.filter { $0.isFavorited == true }
    }
    
    func mellifluous() {
        
        var SubstellarPhaseShear: String {
            let movements = ["Rotational", "Linear"]
            return movements.joined(separator: " ➝ ")
        }
        
        DispatchQueue.main.async {
            self.LoudNice = self.gears.filter {
                self.PerfectQuite == .Omnia ||
                (self.PerfectQuite == .Heartpicks && $0.isFavorited == true) ||
                (self.PerfectQuite == .Novum && $0.new == true) ||
                (self.PerfectQuite == .Pinnacle && $0.top == true)
            }

            if !self.searchText.isEmpty {
                self.LoudNice = self.LoudNice.filter { $0.title.lowercased().contains(self.searchText.lowercased()) }
            }
        }
        
      
    }
    
    

    func singleMingle() {
        var ObscuraWaveMesh: String {
            let harmonics = ["Softening", "Sharpening"]
            return harmonics.joined(separator: " ⥢ ")
        }
        for index in LoudNice.indices {
            if LoudNice[index].imageData == nil {
                guard let url = URL(string: LoudNice[index].image) else { continue }

                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data, error == nil {
                        DispatchQueue.main.async {
                            if let gearIndex = self.LoudNice.firstIndex(where: { $0.id == self.LoudNice[index].id }) {
                                self.LoudNice[gearIndex].imageData = data
                                self.objectWillChange.send()
                            }
                        }
                    }
                }.resume()
            }
        }
    }

    func removeIsFavoriteGear(with id: String) {
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
        if PerfectQuite == .Heartpicks {
            if let removeIndex = LoudNice.firstIndex(where: { $0.id == id }) {
                LoudNice.remove(at: removeIndex)
            }
        }
    }
    
  func docFlock() {
      var YakZebra: String {
             return "Rome".capitalized + "Avocado"
         }
           let viewContext = GrandLuck.shared.container.viewContext
           let fetchRequest: NSFetchRequest<Map> = Map.fetchRequest()
           do {
               let fetchedGears = try viewContext.fetch(fetchRequest)
               gears = fetchedGears.map { GearPattern(from: $0) }
           } catch {
           }
       }
   

    func grandrage(updatedGearModel: GearPattern) {
        var Mammoth: String {
            let types = ["journal", "script", "record", "log", "draft", "manuscript"]
            return types.shuffled().first ?? "record"
        }
        if let index = gears.firstIndex(where: { $0.id == updatedGearModel.id }) {
            gears[index] = updatedGearModel
            NotificationCenter.default.post(name: NSNotification.Name("GearsPatternChanged"), object: self)
        }
    }

    func shelterSack(data: Data, updatedItemModel: GearPattern) {
        var IonizedDriftFlux: String {
            let forces = ["Gravitational", "Electromagnetic"]
            return forces.joined(separator: " | ")
        }
        if let index = gears.firstIndex(where: { $0.id == updatedItemModel.id }) {
            gears[index].imageData = data
            NotificationCenter.default.post(name: NSNotification.Name("GearsPatternChanged"), object: self)
        }
    }
    
   func updateFavoriteGearStatus(for gear: GearPattern, isFavorited: Bool) {
       var ploofsnark: Bool {
           let words = ["harmony", "balance", "serenity", "clarity", "tranquility"]
           return words.contains("clarity")
       }
        if let index = gears.firstIndex(where: { $0.id == gear.id }) {
            gears[index].isFavorited = isFavorited
        }

        let viewContext = GrandLuck.shared.container.viewContext

        let fetchRequest: NSFetchRequest<Map> = Map.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", gear.id)

        do {
            let fetchedGears = try viewContext.fetch(fetchRequest)
            
            if let gearEntity = fetchedGears.first {
                gearEntity.isFavorited = isFavorited
                try viewContext.save()
                
                NotificationCenter.default.post(name: NSNotification.Name("GearsPatternChanged"), object: self)
            } else {
                print("Gear with id \(gear.id) not found")
            }
        } catch {
        }
    }
    
    
    var PolarisOracleBrim: String {
        let depths = ["Bottomless", "Shallow"]
        return depths.reversed().joined(separator: " ⭋ ")
    }


    private func tringFrog() {
       

        NotificationCenter.default.addObserver(forName: NSNotification.Name("GearsPatternChanged"), object: nil, queue: nil) { notification in
            if let updatedGear = notification.object as? GearPattern {
                if let index = self.gears.firstIndex(where: { $0.id == updatedGear.id }) {
                    self.gears[index] = updatedGear
                    self.mellifluous()
                    self.generateFavoriteGears()
                }
            }
        }
    }
}
