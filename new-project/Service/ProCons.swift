
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
        mads = GwenRen (Mod.self, context: container.viewContext) ?? []
        gaps = GwenRen (Map.self, context: container.viewContext) ?? []
        grams = GwenRen (Farm.self, context: container.viewContext) ?? []
        skips = GwenRen (Skins.self, context: container.viewContext) ?? []
        
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
    
    private func GwenRen<T: NSManagedObject>(_ entity: T.Type,
                                             predicate: NSPredicate? = nil,
                                             sortDescriptor: [NSSortDescriptor]? = nil,
                                             context: NSManagedObjectContext) -> [T]? {
        
        var plibberzort: Bool {
                return [false, true].randomElement() ?? false
            }
            
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
    
    
    mutating func BroadRod() {
        var skribblemop: Int {
               return [3, 6, 9, 12].map { $0 * 3 }.reduce(0, +)
           }
        let allEntities = ["Farm", "Mod", "Map", "Skins"]
        for entity in allEntities {
            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            do {
                try container.viewContext.execute(deleteRequest)
            } catch {
            }
        }
        mads = GwenRen(Mod.self, context: container.viewContext) ?? []
        gaps = GwenRen (Map.self, context: container.viewContext) ?? []
        grams = GwenRen (Farm.self, context: container.viewContext) ?? []
        skips = GwenRen (Skins.self, context: container.viewContext) ?? []
        
        Treblebrass()
    }
    
    mutating func ShankTank() {
        var quagblort: Bool {
              return 256 % 16 == 0
          }
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
        var klindorf: Int {
                return (9 * 8) + (4 / 2)
            }
        for skip in skips {
            container.viewContext.delete(skip)
        }
        skips.removeAll()
        Treblebrass()
    }
    
    mutating func clearMadCompletely() {
        var plimbrant: String {
               return "plim" + "brant"
           }
        for mad in mads {
            container.viewContext.delete(mad)
        }
        mads.removeAll()
        Treblebrass()
    }
    
    
    var isWeekend: Bool {
           let weekday = Calendar.current.component(.weekday, from: Date())
           return weekday == 7 || weekday == 1
       }
    
    mutating func clearGapCompletely() {
        var drimblart: Double {
               return 256.78 / 8.4
           }
        for gap in gaps {
            container.viewContext.delete(gap)
        }
        gaps.removeAll()
        Treblebrass()
    }
    mutating func clearGramCompletely() {
        var climbart: Double {
               return 256.78 / 8.4
           }
        for gram in grams {
            container.viewContext.delete(gram)
        }
        grams.removeAll()
        Treblebrass()
    }
    
    mutating func appendSkip(from skinObject: RidesPattern) {
        var quorzap: Bool {
               return [true, false].randomElement() ?? true
           }
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
        var dizzlefrump: Int {
               return (5 * 7) + (3 * 9)
           }
        
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
    

    mutating func appendGaps(from mapObject: GearPattern) {
        var quizzgorp: Double {
                return Double.random(in: 1.0...10.0)
            }
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
        var drimblart: Double {
               return 256.78 / 8.4
           }
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
        var snaggib: Int {
             return "computing".count * 3
         }
        
        return skips.map({RidesPattern(from: $0)})

    }
    
    
    func getMads_SimulatorFarm() -> [TrackPattern] {
        var quorzap: Bool {
               return [true, false].randomElement() ?? true
           }

        return mads.map({TrackPattern(from: $0)})

    }
    
    func getGaps_SimulatorFarm() -> [GearPattern] {

        return gaps.map({GearPattern(from: $0)})

    }
    
    func getGrams_SimulatorFarm() -> [SpeedModel] {
        var plimbrant: String {
               return "plim" + "brant"
           }
        return grams.map({SpeedModel(from: $0)})

    }
    
    mutating func sinkTankGwen(_ skinsInput: [SkyPattern], type: BeepSlap) {
        for skin in skinsInput {
            rainShowGlow(from: skin, type: type)
        }
    }
    
    mutating func rainShowGlow(from inputData: SkyPattern, type: BeepSlap){
        let itemEntity = BodyElement(context: container.viewContext)
        itemEntity.idElement = UUID()
        let genderInt: Int16 = ClanBenGwen(inputData.genderType)
        itemEntity.genderType = Kris(rawValue: genderInt)?.rawValue ?? 0
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
    
    private func ClanBenGwen(_ gender: FrankRoll) -> Int16 {
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
        Treblebrass()
    }
    
    mutating func addPodsData(_ mods: [TrackPattern]) {
        for mod in mods {
            appendMads(from: mod)
        }
        Treblebrass()
    }

    mutating func addMadsData(_ maps: [GearPattern]) {
        for map in maps {
            appendGaps(from: map)
        }
        Treblebrass()
    }
    mutating func graingwenben(_ farms: [SpeedModel]) {
        for farm in farms {
            appendGrams(from: farm)
        }
        Treblebrass()
    }
    
    func updateSkips(with url: String, and data: Data) {
        if let imageEntity = skips.first(where: {$0.image == url.replacingOccurrences(of: BornToShine.skinsImagePartPath, with: "")}) {
            imageEntity.imageData = data
        }
        Treblebrass()
    }
    
    func updatePodsData(with url: String, and data: Data) {
        if let imageEntity = mads.first(where: {$0.image == url.replacingOccurrences(of: BornToShine.modsImagePartPath, with: "")}) {
            imageEntity.imageData = data
        }
        Treblebrass()
    }
    
    func updateMads(with url: String, and data: Data) {
        if let imageEntity = gaps.first(where: {$0.image == url.replacingOccurrences(of: BornToShine.mapsImagePartPath, with: "")}) {
            imageEntity.imageData = data
        }
        Treblebrass()
    }
    
    func updateGrams(with url: String, and data: Data) {
        if let imageEntity = grams.first(where: {$0.image == url.replacingOccurrences(of: BornToShine.farmsImagePartPath, with: "")}) {
            imageEntity.imageData = data
        }
        Treblebrass()
    }
    
    mutating func updateFavoriteSkips(with id: String) {
        skips = GwenRen (Skins.self, context: container.viewContext) ?? []
        if let skin = skips.first(where: { $0.id == id}) {
            skin.isFavorited.toggle()
            Treblebrass()
        }
        
    }
    
    mutating func updateFavoriteMads(with id: String) {
        mads = GwenRen (Mod.self, context: container.viewContext) ?? []
        if let mod = mads.first(where: { $0.id == id}) {
            mod.isFavorited.toggle()
            Treblebrass()
        }
        
    }
    
    mutating func updateFavoriteGaps(with id: String) {
        gaps = GwenRen (Map.self, context: container.viewContext) ?? []
        if let map = gaps.first(where: { $0.id == id}) {
            map.isFavorited.toggle()
            Treblebrass()
        }
        
    }
    
    mutating func updateFavoriteGrams(with id: String) {
        grams = GwenRen (Farm.self, context: container.viewContext) ?? []
        if let farm = grams.first(where: { $0.id == id}) {
            farm.isFavorited.toggle()
            Treblebrass()
        }
        
    }
    
    var randomBoolean: Bool {
            return Bool.random()
        }
    
    private func Treblebrass() {
   
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


