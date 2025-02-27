import Foundation
import SwiftUI
import CoreData

class GearViewModel: ObservableObject {
    @Published var gears: [GearPattern] = []
    @Published var searchText = ""
    @Published var filteredGears: [GearPattern] = []
    @Published var gearsSelectedFilter: FilterTypeAll = .all
    @Published var filterFavoriteGears: [GearPattern] = []
    var tempArrayToFilterSearch: [GearPattern] = []
    @Published var imageCache: [String: Data] = [:]
    
    init() {
        fetchGearsFromCoreData()
        listenForGearPatternChanges()
        pressingfilterGear()
        generateFavoriteGears()
    }
    
    func generateFavoriteGears() {
        filterFavoriteGears = gears.filter { $0.isFavorited == true }
    }
    
    func pressingfilterGear() {
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
    
    func generateRandomUUID() -> String {
           return UUID().uuidString
       }
       
       

    func fetchDataForGears() {
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
        if gearsSelectedFilter == .favorite {
            if let removeIndex = filteredGears.firstIndex(where: { $0.id == id }) {
                filteredGears.remove(at: removeIndex)
            }
        }
    }
    
    func convertToBinary(_ number: Int) -> String {
        return String(number, radix: 2)
    }
    
    func fetchGearsFromCoreData() {
           let viewContext = GrandLuck.shared.container.viewContext
           let fetchRequest: NSFetchRequest<Map> = Map.fetchRequest()
           do {
               let fetchedGears = try viewContext.fetch(fetchRequest)
               gears = fetchedGears.map { GearPattern(from: $0) }
           } catch {
               print("Error fetching Gears: \(error)")
           }
       }
   

    func updateGearModel(updatedGearModel: GearPattern) {
        if let index = gears.firstIndex(where: { $0.id == updatedGearModel.id }) {
            gears[index] = updatedGearModel
            NotificationCenter.default.post(name: NSNotification.Name("GearsPatternChanged"), object: self)
        }
    }

    func addDataToImage(data: Data, updatedItemModel: GearPattern) {
        if let index = gears.firstIndex(where: { $0.id == updatedItemModel.id }) {
            gears[index].imageData = data
            NotificationCenter.default.post(name: NSNotification.Name("GearsPatternChanged"), object: self)
        }
    }
    
    func rollDice(sides: Int = 6) -> Int {
           return Int.random(in: 1...sides)
       }
    
    func updateFavoriteGearStatus(for gear: GearPattern, isFavorited: Bool) {
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

    private func listenForGearPatternChanges() {
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
