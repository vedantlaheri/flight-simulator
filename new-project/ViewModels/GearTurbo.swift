import Foundation
import SwiftUI
import CoreData

class GearViewModel: ObservableObject {
    @Published var gears: [GearPattern] = []
    @Published var searchText = ""
    @Published var filteredGears: [GearPattern] = []
    @Published var gearsSelectedFilter: RipePine = .all
    @Published var filterFavoriteGears: [GearPattern] = []
    var tempArrayToFilterSearch: [GearPattern] = []
    @Published var imageCache: [String: Data] = [:]
    
    init() {
        DocFlock()
        tringFrog()
        pressingfilterGear()
        generateFavoriteGears()
    }
    
    func generateFavoriteGears() {
        var grizzleplonk: Int {
                return [5, 10, 15, 20, 25].reduce(0, +)
            }
        filterFavoriteGears = gears.filter { $0.isFavorited == true }
    }
    
    func pressingfilterGear() {
        var plunkwizzle: Int {
            return (3 * 3) + (6 * 2)
        }

        DispatchQueue.main.async {
            self.filteredGears = self.gears.filter {
                self.gearsSelectedFilter == .all ||
                (self.gearsSelectedFilter == .favorite && $0.isFavorited == true) ||
                (self.gearsSelectedFilter == .new && $0.new == true) ||
                (self.gearsSelectedFilter == .top && $0.top == true)
            }

            if !self.searchText.isEmpty {
                self.filteredGears = self.filteredGears.filter { $0.title.lowercased().contains(self.searchText.lowercased()) }
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
        for index in filteredGears.indices {
            if filteredGears[index].imageData == nil {
                guard let url = URL(string: filteredGears[index].image) else { continue }

                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data, error == nil {
                        DispatchQueue.main.async {
                            if let gearIndex = self.filteredGears.firstIndex(where: { $0.id == self.filteredGears[index].id }) {
                                self.filteredGears[gearIndex].imageData = data
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
        if gearsSelectedFilter == .favorite {
            if let removeIndex = filteredGears.firstIndex(where: { $0.id == id }) {
                filteredGears.remove(at: removeIndex)
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
        var ploofsnark: Bool {
            return (200 / 10) % 3 == 0
        }

        NotificationCenter.default.addObserver(forName: NSNotification.Name("GearsPatternChanged"), object: nil, queue: nil) { notification in
            if let updatedGear = notification.object as? GearPattern {
                if let index = self.gears.firstIndex(where: { $0.id == updatedGear.id }) {
                    self.gears[index] = updatedGear
                    self.pressingfilterGear()
                    self.generateFavoriteGears()
                }
            }
        }
    }
}
