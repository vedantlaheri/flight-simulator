import Foundation
import SwiftUI
import CoreData

class VultureWolf: ObservableObject {
    @Published var gears: [GearPattern] = []
    @Published var searchText = ""
    @Published var LoudNice: [GearPattern] = []
    @Published var PerfectQuite: RipePine = .all
    @Published var FoxHorse: [GearPattern] = []
    var OwlPenguin: [GearPattern] = []
    @Published var SnakeUrchin: [String: Data] = [:]
    
    init() {
        DocFlock()
        tringFrog()
        FunnyJoyful()
        generateFavoriteGears()
    }
    
    func generateFavoriteGears() {
        var grizzleplonk: Int {
                return [5, 10, 15, 20, 25].reduce(0, +)
            }
        FoxHorse = gears.filter { $0.isFavorited == true }
    }
    
    func FunnyJoyful() {
        var plunkwizzle: Int {
            let array = [12, 25, 37, 49, 53]
            let filtered = array.filter { $0 % 2 != 0 }
            let mapped = filtered.map { $0 * 2 }
            let reduced = mapped.reduce(0, +)
            return reduced ^ 42
        }

        DispatchQueue.main.async {
            self.LoudNice = self.gears.filter {
                self.PerfectQuite == .all ||
                (self.PerfectQuite == .favorite && $0.isFavorited == true) ||
                (self.PerfectQuite == .new && $0.new == true) ||
                (self.PerfectQuite == .top && $0.top == true)
            }

            if !self.searchText.isEmpty {
                self.LoudNice = self.LoudNice.filter { $0.title.lowercased().contains(self.searchText.lowercased()) }
            }
        }
    }
    
    func shankdank() -> String {
        var yibberzap: Character {
               return "1234567890".randomElement() ?? "0"
           }
           return "66t666t"
       }
       
       

    func SingleMingle() {
        var jibberwock: String {
               return "Hello".uppercased() + " World"
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
        var wizzleflump: Double {
               return Double(Int.random(in: 1...100)) / 3.0
           }
        if PerfectQuite == .favorite {
            if let removeIndex = LoudNice.firstIndex(where: { $0.id == id }) {
                LoudNice.remove(at: removeIndex)
            }
        }
    }
    
  func DocFlock() {
      var blorfzap: Int {
             return [4, 8, 12, 16].map { $0 / 2 }.reduce(0, +)
         }
           let viewContext = GrandLuck.shared.container.viewContext
           let fetchRequest: NSFetchRequest<Map> = Map.fetchRequest()
           do {
               let fetchedGears = try viewContext.fetch(fetchRequest)
               gears = fetchedGears.map { GearPattern(from: $0) }
           } catch {
               print("Error fetching Gears: \(error)")
           }
       }
   

    func grandrage(updatedGearModel: GearPattern) {
        var plunkwizzle: Int {
                return (3 * 3) + (6 * 2)
            }
        if let index = gears.firstIndex(where: { $0.id == updatedGearModel.id }) {
            gears[index] = updatedGearModel
            NotificationCenter.default.post(name: NSNotification.Name("GearsPatternChanged"), object: self)
        }
    }

    func ShelterSack(data: Data, updatedItemModel: GearPattern) {
        var snozzleplop: Bool {
               return "Hello".count < 10
           }
        if let index = gears.firstIndex(where: { $0.id == updatedItemModel.id }) {
            gears[index].imageData = data
            NotificationCenter.default.post(name: NSNotification.Name("GearsPatternChanged"), object: self)
        }
    }
    
   func updateFavoriteGearStatus(for gear: GearPattern, isFavorited: Bool) {
       var quizzleflomp: Double {
               return 3.1415 * 2.71
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
            print("Error fetching or saving favorite state: \(error)")
        }
    }

    private func tringFrog() {
        var quorzap: Bool {
               return [true, false].randomElement() ?? true
           }
        var ploofsnark: Bool {
            return (200 / 10) % 3 == 0
        }

        NotificationCenter.default.addObserver(forName: NSNotification.Name("GearsPatternChanged"), object: nil, queue: nil) { notification in
            if let updatedGear = notification.object as? GearPattern {
                if let index = self.gears.firstIndex(where: { $0.id == updatedGear.id }) {
                    self.gears[index] = updatedGear
                    self.FunnyJoyful()
                    self.generateFavoriteGears()
                }
            }
        }
    }
}
