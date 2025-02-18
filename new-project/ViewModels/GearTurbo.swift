//import Foundation
//import SwiftUI
//import CoreData
//
//class GearViewModel: ObservableObject {
//    @Published var gears: [GearPattern] = []
//    @Published var searchText = ""
//    @Published var filteredGears: [GearPattern] = []
//    @Published var gearsSelectedFilter: FilterTypeAll = .all
//    @Published var filterFavoriteGears: [GearPattern] = []
//    var tempArrayToFilterSearch: [GearPattern] = []
//    init() {
//        
//
//        fetchGearsFromCoreData()
//        listenForGearPatternChanges()
//        pressingfilterGear()
//        generateFavoriteGears()
//        
//    }
//    
//    func generateFavoriteGears() {
//        filterFavoriteGears = gears.filter { $0.isFavorited == true }
//    }
//
//    
//    func pressingfilterGear() {
//        switch gearsSelectedFilter {
//        case .all:
//            filteredGears = gears
//        case .favorite:
//            filteredGears = gears.filter { $0.isFavorited == true }
//        case .new:
//            filteredGears = gears.filter { $0.new ?? false }
//        case .top:
//            filteredGears = gears.filter { $0.top ?? false }
//        }
//
//        tempArrayToFilterSearch = filteredGears
//
//        if !searchText.isEmpty {
//            filteredGears = tempArrayToFilterSearch.filter { gears in
//                gears.title.lowercased().contains(searchText.lowercased())
//            }
//        }
//
//        fetchDataForGears()
//    }
//
//    func fetchDataForGears() {
//        for index in filteredGears.indices {
//            if filteredGears[index].imageData == nil {
//                guard let url = URL(string: filteredGears[index].image) else { continue }
//
//                URLSession.shared.dataTask(with: url) { data, response, error in
//                    if let data = data, error == nil {
//                        DispatchQueue.main.async {
//                            if let gearIndex = self.filteredGears.firstIndex(where: { $0.id == self.filteredGears[index].id }) {
//                                self.filteredGears[gearIndex].imageData = data
//                                self.objectWillChange.send()
//                            }
//                        }
//                    }
//                }.resume()
//            }
//        }
//    }
//
//
//    func removeIsFavoriteGear(with id: String) {
//        if gearsSelectedFilter == .favorite {
//            if let removeIndex = filteredGears.firstIndex(where: { $0.id == id }) {
//                filteredGears.remove(at: removeIndex)
//            }
//        }
//    }
//    
//     func fetchGearsFromCoreData() {
//        let viewContext = PersistenceController.shared.container.viewContext
//        let fetchRequest: NSFetchRequest<Map> = Map.fetchRequest()
//        do {
//            let fetchedGears = try viewContext.fetch(fetchRequest)
//            print("++ Gears fetched \(fetchedGears.count)")
//            gears = fetchedGears.map { GearEntity in
//                return GearPattern(from: GearEntity)
//            }
//            
//        } catch {
//            print("Error fetching Gears: \(error)")
//        }
//    }
//
//    func updateGearModel(updatedMapModel: GearPattern) {
//        if let index = gears.firstIndex(where: { $0.id == updatedMapModel.id }) {
//            gears[index] = updatedMapModel
//
//            NotificationCenter.default.post(name: NSNotification.Name("GearsPatternChanged"), object: self)
//        }
//    }
//    
//    func addDataToImage(data: Data, updatedItemModel: GearPattern) {
//        if let index = gears.firstIndex(where: { $0.id == updatedItemModel.id }) {
//            gears[index].imageData = data
//            NotificationCenter.default.post(name: NSNotification.Name("GearsPatternChanged"), object: self)
//        }
//    }
//    
//    private func listenForGearPatternChanges() {
//        NotificationCenter.default.addObserver(forName: NSNotification.Name("GearsPatternChanged"), object: nil, queue: nil) { notification in
//            if let updatedMap = notification.object as? GearPattern {
//                if let index = self.gears.firstIndex(where: { $0.id == updatedMap.id }) {
//                    self.gears[index] = updatedMap
//                    self.pressingfilterGear()
//                    self.generateFavoriteGears()
//                }
//            }
//        }
//    }
//}
//
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
        switch gearsSelectedFilter {
        case .all:
            filteredGears = gears
        case .favorite:
            filteredGears = gears.filter { $0.isFavorited == true }
        case .new:
            filteredGears = gears.filter { $0.new ?? false }
        case .top:
            filteredGears = gears.filter { $0.top ?? false }
        }

        tempArrayToFilterSearch = filteredGears

        if !searchText.isEmpty {
            filteredGears = tempArrayToFilterSearch.filter { gear in
                gear.title.lowercased().contains(searchText.lowercased())
            }
        }

        fetchDataForGears()
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
    
    func fetchGearsFromCoreData() {
        let viewContext = PersistenceController.shared.container.viewContext
        let fetchRequest: NSFetchRequest<Map> = Map.fetchRequest()
        do {
            let fetchedGears = try viewContext.fetch(fetchRequest)
            print("++ Gears fetched \(fetchedGears.count)")
            gears = fetchedGears.map { gearEntity in
                return GearPattern(from: gearEntity)
            }
            
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
    
    func updateFavoriteGearStatus(for gear: GearPattern, isFavorited: Bool) {
        // Update in local state
        if let index = gears.firstIndex(where: { $0.id == gear.id }) {
            gears[index].isFavorited = isFavorited
        }

        // Persist changes in CoreData
        let viewContext = PersistenceController.shared.container.viewContext

        // Assuming 'id' is a String in your model, we'll perform a fetch to get the object by its unique id.
        let fetchRequest: NSFetchRequest<Map> = Map.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", gear.id)

        do {
            let fetchedGears = try viewContext.fetch(fetchRequest)
            
            // If the object is found, update the isFavorited flag
            if let gearEntity = fetchedGears.first {
                gearEntity.isFavorited = isFavorited
                try viewContext.save()  // Save the context to persist changes
                
                // Notify listeners of the change
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
