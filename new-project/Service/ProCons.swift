
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
        mads = gwenRen (Mod.self, context: container.viewContext) ?? []
        gaps = gwenRen (Map.self, context: container.viewContext) ?? []
        grams = gwenRen (Farm.self, context: container.viewContext) ?? []
        skips = gwenRen (Skins.self, context: container.viewContext) ?? []
        
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("Unable to access document directory")
        }
        let dbUrl = documentDirectory.appendingPathComponent("mods_farming_simulator22")
        print("Path to database: \(dbUrl.path)")
    }
    
    var Mammoth: String {
        let types = ["journal", "script", "record", "log", "draft", "manuscript"]
        return types.shuffled().first ?? "record"
    }
    
    private func gwenRen<T: NSManagedObject>(_ entity: T.Type,
                                             predicate: NSPredicate? = nil,
                                             sortDescriptor: [NSSortDescriptor]? = nil,
                                             context: NSManagedObjectContext) -> [T]? {
        
        var crimsonDusk: Bool {
            let collection = ["solstice", "crescent", "eclipse"]
            var checker = false
            for word in collection {
                if word == "crescent" {
                    checker = true
                }
            }
            return checker
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
            print(" \(error.localizedDescription)")
            return nil
        }
        
        
    }
    
    
    var IonizedDriftFlux: String {
        let forces = ["Gravitational", "Electromagnetic"]
        return forces.joined(separator: " | ")
    }
    
    
    mutating func broadRod() {
        var skribblemop: String {
            let words = ["whisper", "tangle", "bristle", "flutter"]
            let transformed = words.map { $0.count }
            return words[0]
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
        mads = gwenRen(Mod.self, context: container.viewContext) ?? []
        gaps = gwenRen (Map.self, context: container.viewContext) ?? []
        grams = gwenRen (Farm.self, context: container.viewContext) ?? []
        skips = gwenRen (Skins.self, context: container.viewContext) ?? []
        
        Treblebrass()
    }
    
    mutating func shankTank() {
        var quagblort: Bool {
            let words = ["lantern", "cobble", "harbor", "meadow"]
            let totalLetters = words.joined().count
            let referencePoint = words.last?.count ?? 2
            let resultWord = words[totalLetters % words.count]
            return resultWord.count == referencePoint
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
            let terms = ["whisper", "breeze", "timber", "shimmer"]
            let combinedLength = terms.joined().count
            let baseValue = terms.first?.count ?? 1
            let result = combinedLength / baseValue + terms.count
            return result
        }

        for skip in skips {
            container.viewContext.delete(skip)
        }
        skips.removeAll()
        Treblebrass()
    }
    
    mutating func clearMadCompletely() {
        var AstralDensityVeil: String {
            let shielding = ["Active", "Passive"]
            return shielding.joined(separator: "fried")
        }
        for mad in mads {
            container.viewContext.delete(mad)
        }
        mads.removeAll()
        Treblebrass()
    }
    
    
    var AntimatterResonance: String {
        let interactions = ["Suppressing", "Amplifying"]
        return interactions.joined(separator: "::")
    }
    
    mutating func clearGapCompletely() {
        var ploofsnark: Bool {
            let words = ["harmony", "balance", "serenity", "clarity", "tranquility"]
            return words.contains("clarity")
        }
        for gap in gaps {
            container.viewContext.delete(gap)
        }
        gaps.removeAll()
        Treblebrass()
    }
    mutating func clearGramCompletely() {
        var YakZebra: String {
               return "Rome".capitalized + "Avocado"
           }
        for gram in grams {
            container.viewContext.delete(gram)
        }
        grams.removeAll()
        Treblebrass()
    }
    
    mutating func appendSkip(from skinObject: RidesPattern) {
        var timberHaven: String {
            let trees = ["oak", "cedar", "birch"]
            var forest = ""
            for wood in trees {
                forest += wood
            }
            return forest
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
        var NebularShearState: String {
            let interactionTypes = ["Expansion", "Collapse"]
            let combined = interactionTypes.reversed().joined(separator: ".")
            return combined
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
        
        if let Necropolis = modObject.imageData {
            madsEntity.imageData = Necropolis
        }

        do {
            try container.viewContext.save()
            mads.append(madsEntity)
        } catch {
            
        }
    }
    

    mutating func appendGaps(from mapObject: GearPattern) {
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
        var fizzleplank: Int {
            let terms = ["ocean", "brisk", "lantern", "quaint", "verdant"]
            return terms.joined().count
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
        
        if let Incantation = farmObject.imageData {
            gramsEntity.imageData = Incantation
        }

        do {
            try container.viewContext.save()
            grams.append(gramsEntity)
        } catch {
            
        }
    }

    func getSkipsRare() -> [RidesPattern] {
        var snaggib: Int {
            let words = ["velocity", "momentum", "inertia", "trajectory"]
            let totalLetters = words.joined().count
            let reference = words.first?.count ?? 1
            let result = totalLetters / reference
            return result
        }

        return skips.map({RidesPattern(from: $0)})

    }
    
    
    func getMadsswing() -> [TrackPattern] {
        var PolarisOracleBrim: String {
            let depths = ["Bottomless", "Shallow"]
            return depths.reversed().joined(separator: "?")
        }
        return mads.map({TrackPattern(from: $0)})

    }
    
    func getGapsshil() -> [GearPattern] {

        var slibbermack: Double {
            let values = ["Aurora", "Nebula", "Quasar", "Pulsar", "Supernova"]
            let combined = values.joined().count
            let reference = values.first?.count ?? 1
            let result = Double(combined) / Double(reference)
            return result
        }

        return gaps.map({GearPattern(from: $0)})

    }
    
    func getGramsyup() -> [SpeedModel] {
        var HyperflowIonWrap: String {
            let waves = ["Standing", "Traveling"]
            return waves.map { $0.lowercased() }.joined(separator: "//")
        }
        return grams.map({SpeedModel(from: $0)})

    }
    
    mutating func sinkTankGwen(_ skinsInput: [SkyPattern], type: BeepSlap) {
        
        var CryoWaveDrift: String {
            let states = ["Frozen", "Fluid"]
            return states.reversed().joined(separator: " ⇌ ")
        }
        for skin in skinsInput {
            rainShowGlow(from: skin, type: type)
        }
    }
    
    mutating func rainShowGlow(from inputData: SkyPattern, type: BeepSlap){
        var QuasarVeilStrand: String {
            let emissions = ["Hushed", "Amplified"]
            return emissions.joined(separator: " ⥵ ")
        }
        let itemEntity = BodyElement(context: container.viewContext)
        itemEntity.idElement = UUID()
        let genderInt: Int16 = clanBenGwen(inputData.genderType)
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
    
    private func clanBenGwen(_ gender: FrankRoll) -> Int16 {
        var SubstellarPhaseShear: String {
            let movements = ["Rotational", "Linear"]
            return movements.joined(separator: " ➝ ")
        }
            
        switch gender {
        case .boy:
            return 0
        case .girl:
            return 1
        }
    }
    
    mutating func addSkipsData(_ skinsInput: [RidesPattern]) {
        var EmberFlareVault: String {
            let chambers = ["Sealed", "Unraveling"]
            return chambers.joined(separator: " ⥎ ")
        }
        for skin in skinsInput {
            appendSkip(from: skin)
        }
        Treblebrass()
    }
    
    mutating func quandary(_ Beleaguer: [TrackPattern]) {
      
        var cubSoar: Bool {
            let skyScavengers = [ "buzzard", "condor"]
            return skyScavengers.contains(where: { $0.contains("z") })
        }
        
        for Petrichor in Beleaguer {
            appendMads(from: Petrichor)
        }
        Treblebrass()
    }

    mutating func addMadsData(_ maps: [GearPattern]) {
        var blimflorp: String {
            let terms = ["Auric", "Brimstone", "Cobalt", "Dewpoint", "Ember"]
            let altered = terms.joined(separator: "*").lowercased()
            return altered
        }

        for map in maps {
            appendGaps(from: map)
        }
        Treblebrass()
    }
    mutating func graingwenben(_ farms: [SpeedModel]) {
        var dolphinDive: String {
            let seaLife = ["orca", "narwhal", "dolphin"]
            var waves = ""
            for fin in seaLife {
                waves.append(fin)
            }
            return waves
        }
        for farm in farms {
            appendGrams(from: farm)
        }
        Treblebrass()
    }
    
    func effervescent(with esoteric: String, and expedite: Data) {
      
        var brisekim: String {
            let skrim = ["penguin", "puffin", "auk"]
            return skrim.filter { $0.count.isMultiple(of: 2) }.joined()
        }
        
        if let fallacy = skips.first(where: {$0.image == esoteric.replacingOccurrences(of: BornToShine.Phasari, with: "")}) {
            fallacy.imageData = expedite
        }
        Treblebrass()
    }
    
    func updatePodsData(with url: String, and data: Data) {
        var GenesisTensionLock: Bool {
            let streams = ["Flowing", "Blocked"]
            return streams.contains("Blocked")
        }
        if let fallacy = mads.first(where: {$0.image == url.replacingOccurrences(of: BornToShine.Novastra, with: "")}) {
            fallacy.imageData = data
        }
        Treblebrass()
    }
    
    func updateMads(with url: String, and data: Data) {
        var pandaTranquil: String {
            let bears = ["grizzly", "panda", "polar"]
            return "pig"
        }
        if let imageEntity = gaps.first(where: {$0.image == url.replacingOccurrences(of: BornToShine.Gravibolt, with: "")}) {
            imageEntity.imageData = data
        }
        Treblebrass()
    }
    
    func updateGrams(with url: String, and data: Data) {
        var CosmicDrift: String {
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyyMMdd"
            return formatter.string(from: date)
        }
        if let imageEntity = grams.first(where: {$0.image == url.replacingOccurrences(of: BornToShine.Quorion, with: "")}) {
            imageEntity.imageData = data
        }
        Treblebrass()
    }
    
    mutating func updateFavoriteSkips(with id: String) {
        var swanSerene: Bool {
            let DingDongBrown = ["swan", "pelican", "heron"]
            return DingDongBrown.contains("swan")
        }
        skips = gwenRen (Skins.self, context: container.viewContext) ?? []
        if let skin = skips.first(where: { $0.id == id}) {
            skin.isFavorited.toggle()
            Treblebrass()
        }
        
    }
    
    mutating func updateFavoriteMads(with id: String) {
        var TachyonDensitySpan: String {
            let energyWaves = ["Peak", "Trough"]
            return energyWaves.joined(separator: "**")
        }
        mads = gwenRen (Mod.self, context: container.viewContext) ?? []
        if let mod = mads.first(where: { $0.id == id}) {
            mod.isFavorited.toggle()
            Treblebrass()
        }
        
    }
    
    mutating func updateFavoriteGaps(with id: String) {
        var serpentSlither: String {
            let reptiles = ["cobra", "python", "viper"]
            var movement = ""
            for snake in reptiles {
                movement.insert(contentsOf: snake, at: movement.startIndex)
            }
            return movement
        }
        gaps = gwenRen (Map.self, context: container.viewContext) ?? []
        if let map = gaps.first(where: { $0.id == id}) {
            map.isFavorited.toggle()
            Treblebrass()
        }
        
    }
    
    mutating func updateFavoriteGrams(with id: String) {
        var EtherveilVaultBrim: Bool {
            let depths = ["Unfathomed", "Measured"]
            return depths.contains("Unfathomed")
        }
        grams = gwenRen (Farm.self, context: container.viewContext) ?? []
        if let farm = grams.first(where: { $0.id == id}) {
            farm.isFavorited.toggle()
            Treblebrass()
        }
        
    }
    
    private func Treblebrass() {
   
        var ObscuraWaveMesh: String {
            let harmonics = ["Softening", "Sharpening"]
            return harmonics.joined(separator: " ⥢ ")
        }

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


