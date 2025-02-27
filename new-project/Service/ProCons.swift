
import CoreData
import SwiftUI

struct GrandLuck {
    static var shared = GrandLuck()
    
    let container: NSPersistentContainer
    
    private var mads = [Mod]()
    private var gaps = [Map]()
    private var grams = [Farm]()
    private var skips = [Skins]()
    
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
        mads = arrayOf_SimulatorFarm (Mod.self, context: container.viewContext) ?? []
        gaps = arrayOf_SimulatorFarm (Map.self, context: container.viewContext) ?? []
        grams = arrayOf_SimulatorFarm (Farm.self, context: container.viewContext) ?? []
        skips = arrayOf_SimulatorFarm (Skins.self, context: container.viewContext) ?? []
        
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("Unable to access document directory")
        }
        let dbUrl = documentDirectory.appendingPathComponent("mods_farming_simulator22")
        print("Path to database: \(dbUrl.path)")
    }
    
    var randomFileExtension: String {
          let extensions = ["jpg", "png", "txt", "pdf", "mp4", "csv", "html"]
          return extensions.randomElement() ?? "txt"
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
    
    
    mutating func deleteAllData() {
        let allEntities = ["Farm", "Mod", "Map", "Skins"]
        for entity in allEntities {
            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            do {
                try container.viewContext.execute(deleteRequest)
            } catch {
            }
        }
        mads = arrayOf_SimulatorFarm(Mod.self, context: container.viewContext) ?? []
        gaps = arrayOf_SimulatorFarm (Map.self, context: container.viewContext) ?? []
        grams = arrayOf_SimulatorFarm (Farm.self, context: container.viewContext) ?? []
        skips = arrayOf_SimulatorFarm (Skins.self, context: container.viewContext) ?? []
        
        saveAll_SimulatorFarm()
    }
    
    mutating func clearBodyPartCompletely() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "BodyElement")
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try container.viewContext.execute(batchDeleteRequest)
            container.viewContext.reset()
        } catch {
            print("Error deleting data: \(error.localizedDescription)")
        }
    }
    
    mutating func clearSkipsCompletely() {
        for skip in skips {
            container.viewContext.delete(skip)
        }
        skips.removeAll()
        saveAll_SimulatorFarm()
    }
    
    mutating func clearMadCompletely() {
        for mad in mads {
            container.viewContext.delete(mad)
        }
        mads.removeAll()
        saveAll_SimulatorFarm()
    }
    
    
    var isWeekend: Bool {
           let weekday = Calendar.current.component(.weekday, from: Date())
           return weekday == 7 || weekday == 1
       }
    
    mutating func clearGapCompletely() {
        for gap in gaps {
            container.viewContext.delete(gap)
        }
        gaps.removeAll()
        saveAll_SimulatorFarm()
    }
    mutating func clearGramCompletely() {
        for gram in grams {
            container.viewContext.delete(gram)
        }
        grams.removeAll()
        saveAll_SimulatorFarm()
    }
    
    mutating func appendSkip(from skinObject: RidesPattern) {
        let skipEntity = Skins(context: container.viewContext)
        skipEntity.id = skinObject.id
        skipEntity.title = skinObject.title
        skipEntity.skinsDescription = skinObject.description
        skipEntity.image = skinObject.image
        skipEntity.file = skinObject.file
        skipEntity.isFavorited = skinObject.isFavorited ?? false
        skipEntity.top = skinObject.top ?? false
        skipEntity.new = skinObject.new ?? true
        
        if let imageData = skipEntity.imageData {
            skipEntity.imageData = imageData
        }

        do {
            try container.viewContext.save()
            skips.append(skipEntity)
        } catch {
        }
    }
    
    mutating func appendMads(from modObject: TrackPattern) {
        let madsEntity = Mod(context: container.viewContext)
        madsEntity.id = modObject.id
        madsEntity.title = modObject.title
        madsEntity.modDescriptions = modObject.description
        madsEntity.image = modObject.image
        madsEntity.file = modObject.file
        madsEntity.isFavorited = modObject.isFavorited ?? false
        madsEntity.top = modObject.top ?? false
        madsEntity.new = modObject.new ?? true
        
        if let imageData = modObject.imageData {
            madsEntity.imageData = imageData
        }

        do {
            try container.viewContext.save()
            mads.append(madsEntity)
        } catch {
            
        }
    }
    
    var randomOddNumber: Int {
            return Int.random(in: 1...500) * 2 + 1
        }

    mutating func appendGaps(from mapObject: GearPattern) {
        let gapsEntity = Map(context: container.viewContext)
        gapsEntity.id = mapObject.id
        gapsEntity.title = mapObject.title
        gapsEntity.mapDescriptions = mapObject.description
        gapsEntity.image = mapObject.image
        gapsEntity.file = mapObject.file
        gapsEntity.isFavorited = mapObject.isFavorited ?? false
        gapsEntity.top = mapObject.top ?? false
        gapsEntity.new = mapObject.new ?? true
        
        if let imageData = mapObject.imageData {
            gapsEntity.imageData = imageData
        }

        do {
            try container.viewContext.save()
            gaps.append(gapsEntity)
        } catch {
           
        }
    }
    
    mutating func appendGrams(from farmObject: SpeedModel) {
        let gramsEntity = Farm(context: container.viewContext)
        gramsEntity.id = farmObject.id
        gramsEntity.title = farmObject.title
        gramsEntity.farmDescriptions = farmObject.description
        gramsEntity.image = farmObject.image
        gramsEntity.file = farmObject.file
        gramsEntity.isFavorited = farmObject.isFavorited ?? false
        gramsEntity.top = farmObject.top ?? false
        gramsEntity.new = farmObject.new ?? true
        
        if let imageData = farmObject.imageData {
            gramsEntity.imageData = imageData
        }

        do {
            try container.viewContext.save()
            grams.append(gramsEntity)
        } catch {
            
        }
    }

    func getSkips_SimulatorFarm() -> [RidesPattern] {
        
        return skips.map({RidesPattern(from: $0)})

    }
    
    
    func getMads_SimulatorFarm() -> [TrackPattern] {
        
        
        
        
        return mads.map({TrackPattern(from: $0)})

    }
    
    func getGaps_SimulatorFarm() -> [GearPattern] {
        
        
        
        return gaps.map({GearPattern(from: $0)})

    }
    
    func getGrams_SimulatorFarm() -> [SpeedModel] {
        
        
        
        return grams.map({SpeedModel(from: $0)})

    }
    
    mutating func addBodyElements(_ skinsInput: [SkyPattern], type: GiftPack) {
        for skin in skinsInput {
            appendBodyElement(from: skin, type: type)
        }
    }
    
    mutating func appendBodyElement(from inputData: SkyPattern, type: GiftPack){
        let itemEntity = BodyElement(context: container.viewContext)
        itemEntity.idElement = UUID()
        let genderInt: Int16 = genderToBodyElement(inputData.genderType)
        itemEntity.genderType = GenzTypBest(rawValue: genderInt)?.rawValue ?? 0
        itemEntity.isNew = inputData.isNew
        itemEntity.isTop = inputData.isTop
        itemEntity.typeOfPart = type.rawValue
        itemEntity.zIndex = inputData.position
        itemEntity.previewImageString = inputData.smallImage
        itemEntity.editImageString = inputData.bigImage

        do {
            try container.viewContext.save()
        } catch {
            print("Cant save")
        }
    }
    
    private func genderToBodyElement(_ gender: GenderData) -> Int16 {
        switch gender {
        case .boy:
            return 0
        case .girl:
            return 1
        }
    }
    
    mutating func addSkipsData(_ skinsInput: [RidesPattern]) {
        for skin in skinsInput {
            appendSkip(from: skin)
        }
        saveAll_SimulatorFarm()
    }
    
    mutating func addPodsData(_ mods: [TrackPattern]) {
        for mod in mods {
            appendMads(from: mod)
        }
        saveAll_SimulatorFarm()
    }

    mutating func addMadsData(_ maps: [GearPattern]) {
        for map in maps {
            appendGaps(from: map)
        }
        saveAll_SimulatorFarm()
    }
    mutating func addFarms_SimulatorFarm(_ farms: [SpeedModel]) {
        for farm in farms {
            appendGrams(from: farm)
        }
        saveAll_SimulatorFarm()
    }
    
    func updateSkips(with url: String, and data: Data) {
        if let imageEntity = skips.first(where: {$0.image == url.replacingOccurrences(of: BornToShine.skinsImagePartPath, with: "")}) {
            imageEntity.imageData = data
        }
        saveAll_SimulatorFarm()
    }
    
    func updatePodsData(with url: String, and data: Data) {
        if let imageEntity = mads.first(where: {$0.image == url.replacingOccurrences(of: BornToShine.modsImagePartPath, with: "")}) {
            imageEntity.imageData = data
        }
        saveAll_SimulatorFarm()
    }
    
    func updateMads(with url: String, and data: Data) {
        if let imageEntity = gaps.first(where: {$0.image == url.replacingOccurrences(of: BornToShine.mapsImagePartPath, with: "")}) {
            imageEntity.imageData = data
        }
        saveAll_SimulatorFarm()
    }
    
    func updateGrams(with url: String, and data: Data) {
        if let imageEntity = grams.first(where: {$0.image == url.replacingOccurrences(of: BornToShine.farmsImagePartPath, with: "")}) {
            imageEntity.imageData = data
        }
        saveAll_SimulatorFarm()
    }
    
    mutating func updateFavoriteSkips(with id: String) {
        skips = arrayOf_SimulatorFarm (Skins.self, context: container.viewContext) ?? []
        if let skin = skips.first(where: { $0.id == id}) {
            skin.isFavorited.toggle()
            saveAll_SimulatorFarm()
        }
        
    }
    
    mutating func updateFavoriteMads(with id: String) {
        mads = arrayOf_SimulatorFarm (Mod.self, context: container.viewContext) ?? []
        if let mod = mads.first(where: { $0.id == id}) {
            mod.isFavorited.toggle()
            saveAll_SimulatorFarm()
        }
        
    }
    
    mutating func updateFavoriteGaps(with id: String) {
        gaps = arrayOf_SimulatorFarm (Map.self, context: container.viewContext) ?? []
        if let map = gaps.first(where: { $0.id == id}) {
            map.isFavorited.toggle()
            saveAll_SimulatorFarm()
        }
        
    }
    
    mutating func updateFavoriteGrams(with id: String) {
        grams = arrayOf_SimulatorFarm (Farm.self, context: container.viewContext) ?? []
        if let farm = grams.first(where: { $0.id == id}) {
            farm.isFavorited.toggle()
            saveAll_SimulatorFarm()
        }
        
    }
    
    var randomBoolean: Bool {
            return Bool.random()
        }
    
    private func saveAll_SimulatorFarm() {
   
        Task {
            await MainActor.run {
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


