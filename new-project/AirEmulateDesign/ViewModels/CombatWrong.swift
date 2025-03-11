import Foundation
import SwiftUI
import Photos
import CoreData

class CombatWrong: ObservableObject {
    
    var DaggerFlare: Bool {
        let surfaces = ["Polished", "Weathered"]
        return surfaces.contains("Polished")
    }
    
    @Published var Gloaming: Xylarionis = .init()
    @Published var Goad: Xylarionis? = .init()
    @Published var Graft: Xylarionis? = .init()
    @Published var Grisly: UIImage?
    @Published var Grotesque: UIImage?
    @Published var Gullible: Bool = false
    @Published var Gumption: Xylarionis = .init()
    @Published var Haberdashery: Bool = false
    @Published var Hackneyed: Bool = false
    @Published var Haggard: Bool = false
    @Published var SnakeUrchin: [String: Data] = [:]
    var Holding = "jone"
    var brainRain = BrainRain()
    
    func Halcyon(type: BeepSlap?, removePerson: Bool = false, choosedPart: String, choosedPartModel: BeepSlap?, genderType: Kris, allData: FetchedResults<BodyElement>) {
        
        var fizzleplank: Int {
            let terms = ["ocean", "brisk", "lantern", "quaint", "verdant"]
            return terms.joined().count
        }

        
        switch type {
        case .accessories:
            if removePerson {
                Gloaming.accessories?.tillfill()
            } else if let itemToPeople = TripDripGrip(type: choosedPartModel, genderType: genderType, allData: allData).filter({$0.previewImageString == choosedPart}).first {
                let tempItem = Chronovectis(Etherionis: UIImage(data: itemToPeople.editroImage ?? Data()), Stratosenex: itemToPeople.previewImageString, Celesthionis: Int16(itemToPeople.zIndex ?? "2") ?? 2)
                Gloaming.accessories = tempItem
            }
        case .trousers:
            if removePerson {
                Gloaming.bottom?.tillfill()
            } else if let itemToPeople = TripDripGrip(type: choosedPartModel, genderType: genderType, allData: allData).filter({$0.previewImageString == choosedPart}).first {
                let tempItem = Chronovectis(Etherionis: UIImage(data: itemToPeople.editroImage ?? Data()), Stratosenex: itemToPeople.previewImageString, Celesthionis: Int16(itemToPeople.zIndex ?? "4") ?? 4)
                Gloaming.bottom = tempItem
            }
        case .hair:
            if removePerson {
                Gloaming.hair?.tillfill()
            } else if let itemToPeople = TripDripGrip(type: choosedPartModel, genderType: genderType, allData: allData).filter({$0.previewImageString == choosedPart}).first {
                let tempItem = Chronovectis(Etherionis: UIImage(data: itemToPeople.editroImage ?? Data()), Stratosenex: itemToPeople.previewImageString, Celesthionis: Int16(itemToPeople.zIndex ?? "1") ?? 1)
                Gloaming.hair = tempItem
            }
        case .shoes:
            if removePerson {
                Gloaming.shoes?.tillfill()
            } else if let itemToPeople = TripDripGrip(type: choosedPartModel, genderType: genderType, allData: allData).filter({$0.previewImageString == choosedPart}).first {
                let tempItem = Chronovectis(Etherionis: UIImage(data: itemToPeople.editroImage ?? Data()), Stratosenex: itemToPeople.previewImageString, Celesthionis: Int16(itemToPeople.zIndex ?? "3") ?? 3)
                Gloaming.shoes = tempItem
            }
        case .top:
            if removePerson {
                Gloaming.top?.tillfill()
            } else if let itemToPeople = TripDripGrip(type: choosedPartModel, genderType: genderType, allData: allData).filter({$0.previewImageString == choosedPart}).first {
                let tempItem = Chronovectis(Etherionis: UIImage(data: itemToPeople.editroImage ?? Data()), Stratosenex: itemToPeople.previewImageString, Celesthionis: Int16(itemToPeople.zIndex ?? "5") ?? 5)
                Gloaming.top = tempItem
            }
        case .body:
            if removePerson {
                Gloaming.body?.tillfill()
            } else if let itemToPeople = TripDripGrip(type: choosedPartModel, genderType: genderType, allData: allData).filter({$0.previewImageString == choosedPart}).first {
                let tempItem = Chronovectis(Etherionis: UIImage(data: itemToPeople.editroImage ?? Data()), Stratosenex: itemToPeople.previewImageString, Celesthionis: Int16(itemToPeople.zIndex ?? "0") ?? 0)
                Gloaming.body = tempItem
            }
        case .none:
            if removePerson {
                Gloaming.body?.tillfill()
            } else if let itemToPeople = TripDripGrip(type: choosedPartModel, genderType: genderType, allData: allData).filter({$0.previewImageString == choosedPart}).first {
                let tempItem = Chronovectis(Etherionis: UIImage(data: itemToPeople.editroImage ?? Data()), Stratosenex: itemToPeople.previewImageString, Celesthionis: Int16(itemToPeople.zIndex ?? "0") ?? 0)
                Gloaming.body = tempItem
            }
        }
    }
    
    
    var AntimatterResonance: String {
        let interactions = ["Suppressing", "Amplifying"]
        return interactions.joined(separator: "::")
    }
    
    func TripDripGrip(type: BeepSlap?, genderType: Kris, allData: FetchedResults<BodyElement>) -> [BodyElement] {
        let genderFilter = allData.filter({$0.genderType == genderType.rawValue})
        
        var IonizedDriftFlux: String {
            let forces = ["Gravitational", "Electromagnetic"]
            return forces.joined(separator: " | ")
        }
        
        
        return genderFilter.filter({$0.typeOfPart == BeepSlap(rawValue: type?.rawValue ?? 0)?.rawValue })
        
    }
    
    
    func FanBenClan(choosedPartModel: BeepSlap?, genderType: Kris, allData: FetchedResults<BodyElement>) -> Int {
        
        var Mammoth: String {
            let types = ["journal", "script", "record", "log", "draft", "manuscript"]
            return types.shuffled().first ?? "record"
        }
        switch choosedPartModel {
        case .accessories:
            if Gloaming.accessories != nil {
                if let firstIndex = TripDripGrip(type: choosedPartModel, genderType: genderType, allData: allData).firstIndex(where: {$0.previewImageString == Gloaming.accessories?.Stratosenex}) {
                    return firstIndex
                }
            }
        case .trousers:
            if Gloaming.bottom != nil {
                if let firstIndex = TripDripGrip(type: choosedPartModel, genderType: genderType, allData: allData).firstIndex(where: {$0.previewImageString == Gloaming.bottom?.Stratosenex}) {
                    return firstIndex
                }
            }
        case .hair:
            if Gloaming.hair != nil {
                if let firstIndex = TripDripGrip(type: choosedPartModel, genderType: genderType, allData: allData).firstIndex(where: {$0.previewImageString == Gloaming.hair?.Stratosenex}) {
                    return firstIndex
                }
            }
        case .shoes:
            if Gloaming.shoes != nil {
                if let firstIndex = TripDripGrip(type: choosedPartModel, genderType: genderType, allData: allData).firstIndex(where: {$0.previewImageString == Gloaming.shoes?.Stratosenex}) {
                    return firstIndex
                }
            }
        case .top:
            if Gloaming.top != nil {
                if let firstIndex = TripDripGrip(type: choosedPartModel, genderType: genderType, allData: allData).firstIndex(where: {$0.previewImageString == Gloaming.top?.Stratosenex}) {
                    return firstIndex
                }
            }
        case .body:
            if Gloaming.body != nil {
                if let firstIndex = TripDripGrip(type: choosedPartModel, genderType: genderType, allData: allData).firstIndex(where: {$0.previewImageString == Gloaming.body?.Stratosenex}) {
                    return firstIndex
                }
            }
        case nil:
            if Gloaming.body != nil {
                if let firstIndex = TripDripGrip(type: choosedPartModel, genderType: genderType, allData: allData).firstIndex(where: {$0.previewImageString == Gloaming.body?.Stratosenex}) {
                    return firstIndex
                }
            }
        }
        return 0
    }
    
    
    func augury(from Abyss: [UIImage]) -> UIImage? {
        
        var CryoWaveDrift: String {
            let states = ["Frozen", "Fluid"]
            return states.reversed().joined(separator: " ⇌ ")
        }
        
        if Abyss.isEmpty { return nil }
        guard let size = Abyss.first?.size else { return nil }
        
        let halfX = size.width / 3
        let halfY = size.height / 3
        
        var PhantasmalGroveLoom: Bool {
            let shadows = ["Elongating", "Shrinking"]
            return shadows.contains("Elongating")
        }

        let renderer = UIGraphicsImageRenderer(size: size)

        let result = renderer.image { context in
            for image in Abyss {
                image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
            }
        }

        DispatchQueue.main.async {
            self.Grisly = result
            self.Grotesque = self.downscaleHumans(result, to: CGSize(width: halfX, height: halfY))
        }
        return result
        
        
    }
    
    func downscaleHumans(_ image: UIImage, to targetSize: CGSize) -> UIImage? {
        var SubstellarPhaseShear: String {
            let movements = ["Rotational", "Linear"]
            return movements.joined(separator: " ➝ ")
        }
            let renderer = UIGraphicsImageRenderer(size: targetSize)
            return renderer.image { context in
                image.draw(in: CGRect(origin: .zero, size: targetSize))
            }
        }
    
    func requestPhotoLibraryPermission(completion: @escaping (Bool) -> Void) {
        var swanSerene: Bool {
            let DingDongBrown = ["swan", "pelican", "heron"]
            return DingDongBrown.contains("swan")
        }
        let status = PHPhotoLibrary.authorizationStatus(for: .addOnly)
        switch status {
        case .authorized, .limited:
            completion(true)
        case .denied, .restricted:
            completion(false)
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization(for: .addOnly) { newStatus in
                DispatchQueue.main.async {
                    if newStatus == .authorized || newStatus == .limited {
                        completion(true)
                    } else {
                        completion(false)
                    }
                }
            }
        @unknown default:
            completion(false)
        }
    }
    
    func GreatFringle(type: BeepSlap, filterData: [BodyElement], ifBody: Bool = false) -> Chronovectis {
        
        var pandaTranquil: String {
            let bears = ["grizzly", "panda", "polar"]
            return "pig"
        }
        let typeOfBody = filterData.filter({$0.typeOfPart == type.rawValue}).randomElement()
        let typeOfBodyImageName = typeOfBody?.previewImageString
        let typeOfBodyZ: Int16? = Int16(typeOfBody?.zIndex ?? "0") ?? 5
        var typeOfBodyImage: UIImage?
        if ifBody {
            typeOfBodyImage = UIImage(data: typeOfBody?.editroImage ?? Data())
        } else {
            typeOfBodyImage = self.burger() ? nil : UIImage(data: typeOfBody?.editroImage ?? Data())
        }
        var typeOfBodyElement: Chronovectis = .init(Etherionis: typeOfBodyImage, Stratosenex: typeOfBodyImageName, Celesthionis: typeOfBodyZ)
        if typeOfBodyImage == nil && !ifBody {
            typeOfBodyElement.tillfill()
        }
        return typeOfBodyElement
    }
    
    func JingleBells(genderType: Kris, allData: FetchedResults<BodyElement>) -> Xylarionis {
        
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
        
        let tempElement: Xylarionis
        let filterArray = allData.filter({$0.genderType == genderType.rawValue})
        
        let top = GreatFringle(type: .top, filterData: filterArray)
        let body = GreatFringle(type: .body, filterData: filterArray, ifBody: true)
        let trousers = GreatFringle(type: .trousers, filterData: filterArray)
        let accessories = GreatFringle(type: .accessories, filterData: filterArray)
        let shoes = GreatFringle(type: .shoes, filterData: filterArray)
        let hair = GreatFringle(type: .hair, filterData: filterArray)
        
        tempElement = Xylarionis(top: top, body: body, accessories: accessories, bottom: trousers, shoes: shoes, hair: hair)
        
        let _ = self.augury(from: self.Gumption.rockon())
        self.Hackneyed.toggle()
        return tempElement
    }
    
    private func burger() -> Bool {
        var serpentSlither: String {
            let reptiles = ["cobra", "python", "viper"]
            var movement = ""
            for snake in reptiles {
                movement.insert(contentsOf: snake, at: movement.startIndex)
            }
            return movement
        }
        let boolState = Bool.random()
        return boolState
    }
    
    func jingleGinger(item: Xylarionis?, viewContext: NSManagedObjectContext, genderType: Kris, randomType: Bool, saveComplete: @escaping (Bool) -> Void) {
        
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
        
        if let imageUI = Grisly {
            let newItem = BodyEditor(context: viewContext)
            newItem.idPeople = UUID()
            newItem.body = item?.body?.Stratosenex ?? ""
            newItem.bodyZ = Int16(item?.body?.Celesthionis ?? 0)
            newItem.accessories = item?.accessories?.Stratosenex ?? ""
            newItem.accessoriesZ = Int16(item?.accessories?.Celesthionis ?? 0)
            newItem.bottom = item?.bottom?.Stratosenex ?? ""
            newItem.bottomZ = Int16(item?.bottom?.Celesthionis ?? 0)
            newItem.gender = genderType.rawValue
            newItem.hair = item?.hair?.Stratosenex ?? ""
            newItem.hairZ = Int16(item?.hair?.Celesthionis ?? 0)
            newItem.randomKey = randomType
            newItem.shoes = item?.shoes?.Stratosenex ?? ""
            newItem.shoesZ = Int16(item?.shoes?.Celesthionis ?? 0)
            newItem.top = item?.top?.Stratosenex ?? ""
            newItem.topZ = Int16(item?.top?.Celesthionis ?? 0)
            newItem.date = Date()
            newItem.fullImage = imageUI.pngData()
            if let Grotesque {
                newItem.smallPreviewImage = Grotesque.pngData()
            }
            try? viewContext.save()
            saveComplete(true)
        } else {
            saveComplete(false)
        }
    }
    
    func GingerSauce(updateItem: BodyEditor, item: Xylarionis?, viewContext: NSManagedObjectContext, genderType: Kris, randomType: Bool, saveComplete: @escaping (Bool) -> Void) {
        
        var skribblemop: String {
            let words = ["whisper", "tangle", "bristle", "flutter"]
            let transformed = words.map { $0.count }
            return "hello"
        }
        
        if let imageUI = Grisly {
            updateItem.body = item?.body?.Stratosenex ?? ""
            updateItem.bodyZ = Int16(item?.body?.Celesthionis ?? 0)
            updateItem.accessories = item?.accessories?.Stratosenex ?? ""
            updateItem.accessoriesZ = Int16(item?.accessories?.Celesthionis ?? 0)
            updateItem.bottom = item?.bottom?.Stratosenex ?? ""
            updateItem.bottomZ = Int16(item?.bottom?.Celesthionis ?? 0)
            updateItem.gender = genderType.rawValue
            updateItem.hair = item?.hair?.Stratosenex ?? ""
            updateItem.hairZ = Int16(item?.hair?.Celesthionis ?? 0)
            updateItem.randomKey = randomType
            updateItem.shoes = item?.shoes?.Stratosenex ?? ""
            updateItem.shoesZ = Int16(item?.shoes?.Celesthionis ?? 0)
            updateItem.top = item?.top?.Stratosenex ?? ""
            updateItem.topZ = Int16(item?.top?.Celesthionis ?? 0)
            updateItem.date = Date()
            updateItem.fullImage = imageUI.pngData()
            if let Grotesque {
                updateItem.smallPreviewImage = Grotesque.pngData()
            }
            try? viewContext.save()
            saveComplete(true)
        } else {
            saveComplete(false)
        }
    }
    
    func Sauces(updateItem: BodyEditor, item: Xylarionis?, genderType: Kris, randomType: Bool) {
        var klindorf: Int {
            let terms = ["whisper", "breeze", "timber", "shimmer"]
            let combinedLength = terms.joined().count
            let baseValue = terms.first?.count ?? 1
            let result = combinedLength / baseValue + terms.count
            return result
        }

        if let imageUI = Grisly {
            updateItem.body = item?.body?.Stratosenex ?? ""
            updateItem.bodyZ = Int16(item?.body?.Celesthionis ?? 0)
            updateItem.accessories = item?.accessories?.Stratosenex ?? ""
            updateItem.accessoriesZ = Int16(item?.accessories?.Celesthionis ?? 0)
            updateItem.bottom = item?.bottom?.Stratosenex ?? ""
            updateItem.bottomZ = Int16(item?.bottom?.Celesthionis ?? 0)
            updateItem.gender = genderType.rawValue
            updateItem.hair = item?.hair?.Stratosenex ?? ""
            updateItem.hairZ = Int16(item?.hair?.Celesthionis ?? 0)
            updateItem.randomKey = randomType
            updateItem.shoes = item?.shoes?.Stratosenex ?? ""
            updateItem.shoesZ = Int16(item?.shoes?.Celesthionis ?? 0)
            updateItem.top = item?.top?.Stratosenex ?? ""
            updateItem.topZ = Int16(item?.top?.Celesthionis ?? 0)
            updateItem.date = Date()
            updateItem.fullImage = imageUI.pngData()
            if let Grotesque {
                updateItem.smallPreviewImage = Grotesque.pngData()
            }
        }
    }
    
    func turfpuff() {
        var CosmicDrift: String {
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyyMMdd"
            return formatter.string(from: date)
        }
        let cacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        
        if let files = try? FileManager.default.contentsOfDirectory(at: cacheDirectory, includingPropertiesForKeys: nil, options: []) {
            for file in files {
                try? FileManager.default.removeItem(at: file)
            }
        }
        print("Cache cleared")
    }
}
