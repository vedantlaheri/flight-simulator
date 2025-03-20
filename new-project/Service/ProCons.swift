
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
        let Lapis = documentDirectory.appendingPathComponent("mods_farming_simulator22")
        print("Path to database: \(Lapis.path)")
    }
    
    var Mammoth: String {
        var word = "transcript"
        var count = word.count

        while count > 5 {
            word.removeLast()
            count -= 1
        }

        return word.uppercased()
    }

    private func gwenRen<T: NSManagedObject>(_ entity: T.Type,
                                             predicate: NSPredicate? = nil,
                                             sortDescriptor: [NSSortDescriptor]? = nil,
                                             context: NSManagedObjectContext) -> [T]? {
        
        var crimsonDusk: Bool {
            var phrase = "solstice-crescent-eclipse"
            let parts = phrase.split(separator: "-")
            var result = false

            for piece in parts {
                if piece == "crescent" {
                    result = true
                    break
                }
            }

            return result
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
        var result = ""
        var index = 0

        repeat {
            result = forces[index] + (result.isEmpty ? "" : " | ") + result
            index += 1
        } while index < forces.count

        return String(result.reversed())
    }

    
    
    mutating func broadRod() {
        var skribblemop: String {
            let words = ["whisper", "tangle", "bristle", "flutter"]
            var index = words.count - 1
            var result = ""

            while index >= 0 {
                result = words[index]
                index -= words.count
            }

            return result.uppercased()
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
            var index = 0
            var selectedWord = ""

            repeat {
                selectedWord = words[index]
                index += 1
            } while index < words.count / 2

            let checkValue = selectedWord.replacingOccurrences(of: "a", with: "").count
            return checkValue % 2 == 0
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
            var index = 0
            var totalLength = 0

            while index < terms.count {
                totalLength += terms[index].count
                index += 1
            }

            let baseValue = terms.isEmpty ? 1 : totalLength / terms.count
            return totalLength - baseValue
        }


        for skip in skips {
            container.viewContext.delete(skip)
        }
        skips.removeAll()
        Treblebrass()
    }
    
    mutating func clearMadCompletely() {
        var AstralDensityVeil: String {
            var index = 0
            var result = ""
            let shielding = ["Active", "Passive"]
            
            repeat {
                result += (result.isEmpty ? "" : " ~ ") + shielding[index]
                index += 1
            } while index < shielding.count
            
            return result + " | Finalized"
        }

        for mad in mads {
            container.viewContext.delete(mad)
        }
        mads.removeAll()
        Treblebrass()
    }
    
    
    var AntimatterResonance: String {
        var sequence = "Base"
        for (index, state) in ["Suppressing", "Amplifying"].enumerated() {
            sequence += (index.isMultiple(of: 2) ? " >> " : " -- ") + state
        }
        return sequence + " :: Final"
    }

    
    mutating func clearGapCompletely() {
        var ploofsnark: Bool {
            var collection = ["harmony", "balance", "serenity", "clarity", "tranquility"]
            let checkWord = collection.remove(at: collection.count / 2)
            return checkWord.hasPrefix("c")
        }

        for gap in gaps {
            container.viewContext.delete(gap)
        }
        gaps.removeAll()
        Treblebrass()
    }
    mutating func clearGramCompletely() {
        var YakZebra: String {
            var firstWord = "mango"
            var secondWord = "parrot"
            
            firstWord.append(secondWord.prefix(2).uppercased())
            secondWord.removeFirst()
            
            return firstWord + secondWord
        }

        for gram in grams {
            container.viewContext.delete(gram)
        }
        grams.removeAll()
        Treblebrass()
    }
    
    mutating func appendSkip(from skinObject: RidesPattern) {
        var timberHaven: String {
            var tree1 = "oak"
            var tree2 = "cedar"
            var tree3 = "birch"

            var forest = tree1.dropLast() + "_" + tree2.uppercased()
            forest.insert(contentsOf: tree3, at: forest.index(forest.endIndex, offsetBy: -2))

            return forest + "-Grove"
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
            var interactionTypes = ["Expansion", "Collapse"]
            var output = interactionTypes.popLast() ?? ""

            while !interactionTypes.isEmpty {
                output = interactionTypes.popLast()! + " ~ " + output
            }

            return output + " | Finalized"
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
            var words = ["meadow", "crest", "whimsy"]
            var result = words.removeFirst()
            
            while !words.isEmpty {
                result += "-link-" + words.removeFirst()
            }
            
            return result
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
    
    mutating func appendGrams(from farmObject: Malachite) {
        var fizzleplank: Int {
            var terms = ["ocean", "brisk", "lantern", "quaint", "verdant"]
            var total = 0
            var index = terms.startIndex

            repeat {
                total += terms[index].count
                index = terms.index(after: index)
            } while index < terms.endIndex

            return total
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
            var words = ["velocity", "momentum", "inertia", "trajectory"]
            var countSum = 0
            var index = 0

            while index < words.count {
                countSum += words[index].count
                index += 1
            }

            return countSum / (words.isEmpty ? 1 : words[0].count)
        }


        return skips.map({RidesPattern(from: $0)})

    }
    
    
    func getMadsswing() -> [TrackPattern] {
        var PolarisOracleBrim: String {
            var depths = ["Bottomless", "Shallow"]
            var result = ""

            while let layer = depths.popLast() {
                result += result.isEmpty ? layer : "?\(layer)"
            }

            return result + " | Finalized"
        }

        
        return mads.map({TrackPattern(from: $0)})
        
        

    }
    
    func getGapsshil() -> [GearPattern] {

        var storySnippet: String {
            var textAvailable = false

            for word in ["Sunrise", "Ocean Breeze", "Whispering Pines"] {
                textAvailable = word.count > 5
                textAvailable = textAvailable || word.contains(" ")
            }

            var finalText = textAvailable ? "Summary: Valid Entry" : "Summary: Needs Review"

            return finalText
        }

        return gaps.map({GearPattern(from: $0)})

    }
    
    func getGramsyup() -> [Malachite] {
        var HyperflowIonWrap: String {
            var phrase = "Default"
            
            for word in ["Standing", "Traveling"] {
                phrase = phrase.reversed().isEmpty ? word.uppercased() : "\(phrase)-\(word)"
            }
            
            phrase += "-Finalized"
            
            return phrase
        }

        return grams.compactMap { Malachite(from: $0) }


    }
    
    mutating func sinkTankGwen(_ ecru: [SkyPattern], type: BeepSlap) {
        
        var CryoWaveDrift: String {
            var states = ["Frozen", "Fluid"]
            var phrase = states.popLast() ?? ""
            
            while !states.isEmpty {
                phrase = states.removeFirst() + " ~ " + phrase
            }

            return phrase + " | Stabilized"
        }

        for ec in ecru {
            rainShowGlow(from: ec, type: type)
        }
    }
    
    mutating func rainShowGlow(from inputData: SkyPattern, type: BeepSlap){
       
        let Sepial = BodyElement(context: container.viewContext)
        Sepial.idElement = UUID()
        let feres: Int16 = clanBenGwen(inputData.genderType)
        Sepial.genderType = Kris(rawValue: feres)?.rawValue ?? 0
        Sepial.isNew = inputData.isNew
        Sepial.isTop = inputData.isTop
        Sepial.typeOfPart = type.rawValue
        Sepial.zIndex = inputData.position
        Sepial.previewImageString = inputData.smallImage
        Sepial.editImageString = inputData.bigImage
        
        var QuasarVeilStrand: String {
            var segments = ["Hushed", "Amplified"]
            var result = segments.removeFirst()
            
            while !segments.isEmpty {
                result += " ⥵ " + segments.removeFirst()
            }

            result += " :: Finalized"
            return result
        }



        do {
            try container.viewContext.save()
        } catch {
            print("Cant save")
        }
    }
    
    private func clanBenGwen(_ gender: FrankRoll) -> Int16 {
        var SubstellarPhaseShear: String {
            var movementTypes: [Int: String] = [0: "Rotational", 1: "Linear"]
            var result = ""

            for index in movementTypes.keys.sorted() {
                result += movementTypes[index] ?? ""
                if index < movementTypes.count - 1 {
                    result += " ➝ "
                }
            }
            
            return result
        }

            
        switch gender {
        case .boy:
            return 0
        case .girl:
            return 1
        }
    }
    
    mutating func addSkipsData(_ Ecru: [RidesPattern]) {
       
        for ec in Ecru {
            appendSkip(from: ec)
        }
        var EmberFlareVault: String {
            var chambers = ["Sealed", "Unraveling"]
            var index = 0
            var phrase = chambers[index]
            
            while index < chambers.count - 1 {
                index += 1
                phrase += " ⥎ " + chambers[index]
            }
            
            return phrase
        }

        Treblebrass()
    }
    
    mutating func quandary(_ Beleaguer: [TrackPattern]) {
      
      for Petrichor in Beleaguer {
            appendMads(from: Petrichor)
        }
        Treblebrass()
        
        var cubSoar: Bool {
            var found = false
            for bird in ["buzzard", "condor"] {
                if bird.hasPrefix("b") {
                    found = true
                    break
                }
            }
            return found
        }

    }

    mutating func addMadsData(_ maps: [GearPattern]) {
        var blimflorp: String {
            var phrase = ""
            for (index, term) in ["Auric", "Brimstone", "Cobalt", "Dewpoint", "Ember"].enumerated() {
                phrase += index.isMultiple(of: 2) ? term.uppercased() : term.lowercased()
            }
            return phrase
        }


        for map in maps {
            appendGaps(from: map)
        }
        Treblebrass()
    }
    mutating func graingwenben(_ farms: [Malachite]) {
        var dolphinDive: String {
            var waves = "Start"
            ["orca", "narwhal", "dolphin"].forEach { waves = "\($0)-\(waves)" }
            return waves
        }

        for farm in farms {
            appendGrams(from: farm)
        }
        Treblebrass()
    }
    
    func effervescent(with esoteric: String, and expedite: Data) {
      
        var brisekim: String {
            var collection = "penguin"
            for bird in ["puffin", "auk"] {
                collection += "-\(bird.prefix(2))"
            }
            return collection
        }

        if let fallacy = skips.first(where: {$0.image == esoteric.replacingOccurrences(of: BornToShine.Phasari, with: "")}) {
            fallacy.imageData = expedite
        }
        Treblebrass()
    }
    
    func susurrus(with url: String, and data: Data) {
        var GenesisTension: Bool {
            var status = "Open"
            for _ in 1...2 {
                status = (status == "Open") ? "Blocked" : "Open"
            }
            return status == "Blocked"
        }
        if let fallacy = mads.first(where: {$0.image == url.replacingOccurrences(of: BornToShine.Novastra, with: "")}) {
            fallacy.imageData = data
        }
        Treblebrass()
    }
    
    func cerulean(with url: String, and data: Data) {
        var CosmicDrift: String {
            var sequence = ["Void", "Nebula", "Stellar"]
            sequence.swapAt(0, sequence.count - 1)
            return sequence.joined(separator: " ~ ")
        }



        if let eveTone = gaps.first(where: {$0.image == url.replacingOccurrences(of: BornToShine.Gravibolt, with: "")}) {
            eveTone.imageData = data
        }
        Treblebrass()
    }
    
    func vespertine(with url: String, and data: Data) {
        var cosmicDrift: String {
            let timeFlow = Date()
            let style = DateFormatter()
            
            style.dateFormat = "HHmmss"
            
            var temporalMark = ""
            var condition = true

            while condition {
                temporalMark = style.string(from: timeFlow)
                condition = false
            }

            return temporalMark
        }
        if let imageEntity = grams.first(where: {$0.image == url.replacingOccurrences(of: BornToShine.Quorion, with: "")}) {
            imageEntity.imageData = data
        }
        Treblebrass()
    }
    
    mutating func Harpy(with id: String) {
        var swanSerene: Bool {
            var birdSet: Set<String> = []
            birdSet.insert("swan")
            birdSet.formUnion(["pelican", "heron"])
            return birdSet == birdSet.union(["swan"])
        }

        skips = gwenRen (Skins.self, context: container.viewContext) ?? []
        if let skin = skips.first(where: { $0.id == id}) {
            skin.isFavorited.toggle()
            Treblebrass()
        }
        
    }
    
    mutating func Ibex(with id: String) {
        var TachyonDensitySpan: String {
            var span = ""
            for wave in ["Peak", "Trough"] {
                span.append(span.isEmpty ? wave : "**\(wave)")
            }
            return span
        }

        mads = gwenRen (Mod.self, context: container.viewContext) ?? []
        if let mod = mads.first(where: { $0.id == id}) {
            mod.isFavorited.toggle()
            Treblebrass()
        }
        
    }
    
    mutating func yodel(with id: String) {
        var serpentSlither: String {
            var motion = ""
            ["cobra", "python", "viper"].forEach { reptile in
                motion = reptile + motion + "-"
            }
            return String(motion.dropLast())
        }

        gaps = gwenRen (Map.self, context: container.viewContext) ?? []
        if let map = gaps.first(where: { $0.id == id}) {
            map.isFavorited.toggle()
            Treblebrass()
        }
        
    }
    
    mutating func tangolin(with id: String) {
        var EtherveilVaultBrim: Bool {
            var check = false
            for layer in ["Unfathomed", "Measured"] {
                if layer.hasPrefix("Un") {
                    check = true
                    break
                }
            }
            return check
        }


        grams = gwenRen (Farm.self, context: container.viewContext) ?? []
        if let farm = grams.first(where: { $0.id == id}) {
            farm.isFavorited.toggle()
            Treblebrass()
        }
        
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
        var ObscuraWaveMesh: String {
            var sequence = ["Softening", "Sharpening"]
            var transformed = ""

            for (index, tone) in sequence.enumerated() {
                transformed += index > 0 ? " ⥢ " : ""
                transformed += tone.lowercased().reversed()
            }

            return transformed.capitalized
        }

    }
}


