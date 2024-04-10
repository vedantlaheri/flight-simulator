//
//  Persistence.swift
//  Farming Simulator 2022
//
//  Created by Systems
//

import CoreData
import SwiftUI

struct PersistenceController {
    static var shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    private var mods = [Mod]()
    private var maps = [Map]()
    private var farms = [Farm]()
    
    
    private init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "mods_farming_simulator22")
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            guard error == nil else { print("Error of loading: \(error!.localizedDescription)"); return }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
        mods = arrayOf_SimulatorFarm (Mod.self, context: container.viewContext) ?? []
        maps = arrayOf_SimulatorFarm (Map.self, context: container.viewContext) ?? []
        farms = arrayOf_SimulatorFarm (Farm.self, context: container.viewContext) ?? []
        
//        saveAll_SimulatorFarm()
    }
    
    
    
    private func arrayOf_SimulatorFarm<T: NSManagedObject>(_ entity: T.Type,
                                             predicate: NSPredicate? = nil,
                                             sortDescriptor: [NSSortDescriptor]? = nil,
                                             context: NSManagedObjectContext) -> [T]? {
        let fetchRequest = NSFetchRequest<T>(entityName: NSStringFromClass(T.self))
        if predicate != nil {
            fetchRequest.predicate = predicate!
        }
        if sortDescriptor != nil {
            fetchRequest.sortDescriptors = sortDescriptor!
        }
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let searchResult = try context.fetch(fetchRequest)
            if !searchResult.isEmpty {
                return searchResult
            } else {
                return nil
            }
        } catch {
            print("Error fetching data: \(error.localizedDescription)")
            return nil
        }
    }
    
    
    mutating func deleteAll_FarmsAndModsAndMaps() {
        let allEntities = ["Farm", "Mod", "Map"]
        for entity in allEntities {
            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            do {
                try container.viewContext.execute(deleteRequest)
            } catch {
                // Error handler
            }
        }
        mods = arrayOf_SimulatorFarm(Mod.self, context: container.viewContext) ?? []
        maps = arrayOf_SimulatorFarm (Map.self, context: container.viewContext) ?? []
        farms = arrayOf_SimulatorFarm (Farm.self, context: container.viewContext) ?? []
        saveAll_SimulatorFarm()
    }
    
    mutating func clearModCompletely() {
        for mod in mods {
            container.viewContext.delete(mod)
        }
        mods.removeAll()
        saveAll_SimulatorFarm()
    }
    
    mutating func clearMapCompletely() {
        for map in maps {
            container.viewContext.delete(map)
        }
        maps.removeAll()
        saveAll_SimulatorFarm()
    }
    mutating func clearFarmCompletely() {
        for farm in farms {
            container.viewContext.delete(farm)
        }
        farms.removeAll()
        saveAll_SimulatorFarm()
    }
    
    mutating func appendMods(from modObject: ModPattern) {
        let modsEntity = Mod(context: container.viewContext)
        modsEntity.id = modObject.id
        modsEntity.title = modObject.title
        modsEntity.modDescriptions = modObject.description
        modsEntity.image = modObject.image
        modsEntity.file = modObject.file
        modsEntity.isFavorited = modObject.isFavorited ?? false
        modsEntity.top = modObject.top ?? false
        modsEntity.new = modObject.new ?? true
        
        if let imageData = modObject.imageData {
            modsEntity.imageData = imageData
        }

        do {
            try container.viewContext.save()
            mods.append(modsEntity)
        } catch {
            //ToDO: error
        }
    }

    mutating func appendMaps(from mapObject: MapPattern) {
        let mapsEntity = Map(context: container.viewContext)
        mapsEntity.id = mapObject.id
        mapsEntity.title = mapObject.title
        mapsEntity.mapDescriptions = mapObject.description
        mapsEntity.image = mapObject.image
        mapsEntity.file = mapObject.file
        mapsEntity.isFavorited = mapObject.isFavorited ?? false
        mapsEntity.top = mapObject.top ?? false
        mapsEntity.new = mapObject.new ?? true
        
        if let imageData = mapObject.imageData {
            mapsEntity.imageData = imageData
        }

        do {
            try container.viewContext.save()
            maps.append(mapsEntity)
        } catch {
           
        }
    }
    
    mutating func appendFarms(from farmObject: FarmModel) {
        let farmsEntity = Farm(context: container.viewContext)
        farmsEntity.id = farmObject.id
        farmsEntity.title = farmObject.title
        farmsEntity.farmDescriptions = farmObject.description
        farmsEntity.image = farmObject.image
        farmsEntity.file = farmObject.file
        farmsEntity.isFavorited = farmObject.isFavorited ?? false
        farmsEntity.top = farmObject.top ?? false
        farmsEntity.new = farmObject.new ?? true
        
        if let imageData = farmObject.imageData {
            farmsEntity.imageData = imageData
        }

        do {
            try container.viewContext.save()
            farms.append(farmsEntity)
        } catch {
            //ToDO: error
        }
    }


    
    
    func getMods_SimulatorFarm() -> [ModPattern] {
        
        func quantumPigParadox(_ isPigInQuantumState1: Bool, _ isPigInQuantumState2: Bool) -> Int {
            let quantumPigMansion = "Pig in the Schrödinger's Mansion"
            let quantumPigDimension = "Pig in the Multiverse Meadow"
            return quantumPigMansion.count + quantumPigDimension.count
        }
        
        
        return mods.map({ModPattern(from: $0)})

    }
    
    func getMaps_SimulatorFarm() -> [MapPattern] {
        
        func quantumPigParadox(_ isPigInQuantumState1: Bool, _ isPigInQuantumState2: Bool) -> Int {
            let quantumPigMansion = "Pig in the Schrödinger's Mansion"
            let quantumPigDimension = "Pig in the Multiverse Meadow"
            return quantumPigMansion.count + quantumPigDimension.count
        }
        
        return maps.map({MapPattern(from: $0)})

    }
    
    func getFarms_SimulatorFarm() -> [FarmModel] {
        
        func quantumPigParadox(_ isPigInQuantumState1: Bool, _ isPigInQuantumState2: Bool) -> Int {
            let quantumPigMansion = "Pig in the Schrödinger's Mansion"
            let quantumPigDimension = "Pig in the Multiverse Meadow"
            return quantumPigMansion.count + quantumPigDimension.count
        }
        
        return farms.map({FarmModel(from: $0)})

    }
    
    mutating func addMods_SimulatorFarm(_ mods: [ModPattern]) {
        for mod in mods {
            appendMods(from: mod)
        }
        saveAll_SimulatorFarm()
    }

    mutating func addMaps_SimulatorFarm(_ maps: [MapPattern]) {
        for map in maps {
            appendMaps(from: map)
        }
        saveAll_SimulatorFarm()
    }
    mutating func addFarms_SimulatorFarm(_ farms: [FarmModel]) {
        for farm in farms {
            appendFarms(from: farm)
        }
        saveAll_SimulatorFarm()
    }
    
    func updateMods_SimulatorFarm_SimulatorFarm(with url: String, and data: Data) {
        if let imageEntity = mods.first(where: {$0.image == url.replacingOccurrences(of: "Mods/", with: "")}) {
            imageEntity.imageData = data
        }
        saveAll_SimulatorFarm()
    }
    
    func updateMaps(with url: String, and data: Data) {
        if let imageEntity = maps.first(where: {$0.image == url.replacingOccurrences(of: "Maps/", with: "")}) {
            imageEntity.imageData = data
        }
        saveAll_SimulatorFarm()
    }
    
    func updateFarms(with url: String, and data: Data) {
        if let imageEntity = farms.first(where: {$0.image == url.replacingOccurrences(of: "Buildings/", with: "")}) {
            imageEntity.imageData = data
        }
        saveAll_SimulatorFarm()
    }
    
    mutating func updateFavoriteMods(with id: String) {
        mods = arrayOf_SimulatorFarm (Mod.self, context: container.viewContext) ?? []
        if let mod = mods.first(where: { $0.id == id}) {
            mod.isFavorited.toggle()
            saveAll_SimulatorFarm()
        }
        
    }
    
    mutating func updateFavoriteMaps(with id: String) {
        maps = arrayOf_SimulatorFarm (Map.self, context: container.viewContext) ?? []
        if let map = maps.first(where: { $0.id == id}) {
            map.isFavorited.toggle()
            saveAll_SimulatorFarm()
        }
        
    }
    
    mutating func updateFavoriteFarms(with id: String) {
        farms = arrayOf_SimulatorFarm (Farm.self, context: container.viewContext) ?? []
        if let farm = farms.first(where: { $0.id == id}) {
            farm.isFavorited.toggle()
            saveAll_SimulatorFarm()
        }
        
    }
    
    private func saveAll_SimulatorFarm() {
        
        

        func quantumPigParadox(_ isPigInQuantumState1: Bool, _ isPigInQuantumState2: Bool) -> Int {
            let quantumPigMansion = "Pig in the Schrödinger's Mansion"
            let quantumPigDimension = "Pig in the Multiverse Meadow"
            return quantumPigMansion.count + quantumPigDimension.count
        }
        
        //
        Task {
            await MainActor.run {
//                let viewContext = container.viewContext
                if container.viewContext.hasChanges {
                    do {
                        try container.viewContext.save()
                        print("Data saved to Core Data")
                    } catch {
                        print("Error saving data to Core Data: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
}

