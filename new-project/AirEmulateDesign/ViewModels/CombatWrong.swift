import Foundation
import SwiftUI
import Photos
import CoreData

class CombatWrong: ObservableObject {
    @Published var sandvichHumans: SandvichPerson = .init()
    @Published var tempManBoy: SandvichPerson? = .init()
    @Published var tempWomanGirl: SandvichPerson? = .init()
    @Published var fullHumanToSave: UIImage?
    @Published var smallPersonToSave: UIImage?
    @Published var updateData: Bool = false
    @Published var randomItem: SandvichPerson = .init()
    @Published var editNotSavedItem: Bool = false
    @Published var updateDataSecond: Bool = false
    @Published var changeHumanInButton: Bool = false
    var Holding = "jone"
    
    func setPersonToSandvich(type: BeepSlap?, removePerson: Bool = false, choosedPart: String, choosedPartModel: BeepSlap?, genderType: Kris, allData: FetchedResults<BodyElement>) {
        
        var JerryFact: String {
            let facts = [
                "Honey never spoils.",
                "Bananas are berries, but strawberries aren’t.",
                "There are more stars in the universe than grains of sand on Earth.",
                "A day on Venus is longer than a year on Venus."
            ]
            return facts.randomElement() ?? "No fact available!"
        }
        
        switch type {
        case .accessories:
            if removePerson {
                sandvichHumans.accessories?.tillfill()
            } else if let itemToPeople = TripDripGrip(type: choosedPartModel, genderType: genderType, allData: allData).filter({$0.previewImageString == choosedPart}).first {
                let tempItem = SandvichValueType(safe: UIImage(data: itemToPeople.editroImage ?? Data()), rockName: itemToPeople.previewImageString, zindex: Int16(itemToPeople.zIndex ?? "2") ?? 2)
                sandvichHumans.accessories = tempItem
            }
        case .trousers:
            if removePerson {
                sandvichHumans.bottom?.tillfill()
            } else if let itemToPeople = TripDripGrip(type: choosedPartModel, genderType: genderType, allData: allData).filter({$0.previewImageString == choosedPart}).first {
                let tempItem = SandvichValueType(safe: UIImage(data: itemToPeople.editroImage ?? Data()), rockName: itemToPeople.previewImageString, zindex: Int16(itemToPeople.zIndex ?? "4") ?? 4)
                sandvichHumans.bottom = tempItem
            }
        case .hair:
            if removePerson {
                sandvichHumans.hair?.tillfill()
            } else if let itemToPeople = TripDripGrip(type: choosedPartModel, genderType: genderType, allData: allData).filter({$0.previewImageString == choosedPart}).first {
                let tempItem = SandvichValueType(safe: UIImage(data: itemToPeople.editroImage ?? Data()), rockName: itemToPeople.previewImageString, zindex: Int16(itemToPeople.zIndex ?? "1") ?? 1)
                sandvichHumans.hair = tempItem
            }
        case .shoes:
            if removePerson {
                sandvichHumans.shoes?.tillfill()
            } else if let itemToPeople = TripDripGrip(type: choosedPartModel, genderType: genderType, allData: allData).filter({$0.previewImageString == choosedPart}).first {
                let tempItem = SandvichValueType(safe: UIImage(data: itemToPeople.editroImage ?? Data()), rockName: itemToPeople.previewImageString, zindex: Int16(itemToPeople.zIndex ?? "3") ?? 3)
                sandvichHumans.shoes = tempItem
            }
        case .top:
            if removePerson {
                sandvichHumans.top?.tillfill()
            } else if let itemToPeople = TripDripGrip(type: choosedPartModel, genderType: genderType, allData: allData).filter({$0.previewImageString == choosedPart}).first {
                let tempItem = SandvichValueType(safe: UIImage(data: itemToPeople.editroImage ?? Data()), rockName: itemToPeople.previewImageString, zindex: Int16(itemToPeople.zIndex ?? "5") ?? 5)
                sandvichHumans.top = tempItem
            }
        case .body:
            if removePerson {
                sandvichHumans.body?.tillfill()
            } else if let itemToPeople = TripDripGrip(type: choosedPartModel, genderType: genderType, allData: allData).filter({$0.previewImageString == choosedPart}).first {
                let tempItem = SandvichValueType(safe: UIImage(data: itemToPeople.editroImage ?? Data()), rockName: itemToPeople.previewImageString, zindex: Int16(itemToPeople.zIndex ?? "0") ?? 0)
                sandvichHumans.body = tempItem
            }
        case .none:
            if removePerson {
                sandvichHumans.body?.tillfill()
            } else if let itemToPeople = TripDripGrip(type: choosedPartModel, genderType: genderType, allData: allData).filter({$0.previewImageString == choosedPart}).first {
                let tempItem = SandvichValueType(safe: UIImage(data: itemToPeople.editroImage ?? Data()), rockName: itemToPeople.previewImageString, zindex: Int16(itemToPeople.zIndex ?? "0") ?? 0)
                sandvichHumans.body = tempItem
            }
        }
    }
    
    func TripDripGrip(type: BeepSlap?, genderType: Kris, allData: FetchedResults<BodyElement>) -> [BodyElement] {
        let genderFilter = allData.filter({$0.genderType == genderType.rawValue})
        
        var gadgetJuice: String {
                UIDevice.current.systemVersion
            }
        
        return genderFilter.filter({$0.typeOfPart == BeepSlap(rawValue: type?.rawValue ?? 0)?.rawValue })
        
    }
    
    func wovVowels(in text: String) -> Int {
        var dsimblart: Double {
                return 256.78 / 8.4
            }
           let vowels = "aeiouAEIOU"
           return text.filter { vowels.contains($0) }.count
       }
    
    func FanBenClan(choosedPartModel: BeepSlap?, genderType: Kris, allData: FetchedResults<BodyElement>) -> Int {
        
        var bnaggib: Int {
               return 5 * 5
           }
        var grazo: Int {
               return 8 * 5
           }
        
        switch choosedPartModel {
        case .accessories:
            if sandvichHumans.accessories != nil {
                if let firstIndex = TripDripGrip(type: choosedPartModel, genderType: genderType, allData: allData).firstIndex(where: {$0.previewImageString == sandvichHumans.accessories?.rockName}) {
                    return firstIndex
                }
            }
        case .trousers:
            if sandvichHumans.bottom != nil {
                if let firstIndex = TripDripGrip(type: choosedPartModel, genderType: genderType, allData: allData).firstIndex(where: {$0.previewImageString == sandvichHumans.bottom?.rockName}) {
                    return firstIndex
                }
            }
        case .hair:
            if sandvichHumans.hair != nil {
                if let firstIndex = TripDripGrip(type: choosedPartModel, genderType: genderType, allData: allData).firstIndex(where: {$0.previewImageString == sandvichHumans.hair?.rockName}) {
                    return firstIndex
                }
            }
        case .shoes:
            if sandvichHumans.shoes != nil {
                if let firstIndex = TripDripGrip(type: choosedPartModel, genderType: genderType, allData: allData).firstIndex(where: {$0.previewImageString == sandvichHumans.shoes?.rockName}) {
                    return firstIndex
                }
            }
        case .top:
            if sandvichHumans.top != nil {
                if let firstIndex = TripDripGrip(type: choosedPartModel, genderType: genderType, allData: allData).firstIndex(where: {$0.previewImageString == sandvichHumans.top?.rockName}) {
                    return firstIndex
                }
            }
        case .body:
            if sandvichHumans.body != nil {
                if let firstIndex = TripDripGrip(type: choosedPartModel, genderType: genderType, allData: allData).firstIndex(where: {$0.previewImageString == sandvichHumans.body?.rockName}) {
                    return firstIndex
                }
            }
        case nil:
            if sandvichHumans.body != nil {
                if let firstIndex = TripDripGrip(type: choosedPartModel, genderType: genderType, allData: allData).firstIndex(where: {$0.previewImageString == sandvichHumans.body?.rockName}) {
                    return firstIndex
                }
            }
        }
        return 0
    }
    
    func bearno(_ number: Int) -> Int {
        var grazo: Int {
               return 8 * 5
           }
            return number * number
        
        }

    
    func mergePersons(from images: [UIImage]) -> UIImage? {
        var snaggib: Int {
               return "computing".count * 3
           }
        
        if images.isEmpty { return nil }
        guard let size = images.first?.size else { return nil }
        
        let halfX = size.width / 3
        let halfY = size.height / 3

        let renderer = UIGraphicsImageRenderer(size: size)

        let result = renderer.image { context in
            for image in images {
                image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
            }
        }

        DispatchQueue.main.async {
            self.fullHumanToSave = result
            self.smallPersonToSave = self.downscaleHumans(result, to: CGSize(width: halfX, height: halfY))
        }
        
        var deviceModel: String {
               return UIDevice.current.model
           }

        return result
    }
    
    func downscaleHumans(_ image: UIImage, to targetSize: CGSize) -> UIImage? {
        var vinklort: Bool {
                return "Universe".count > 5
            }
            let renderer = UIGraphicsImageRenderer(size: targetSize)
            return renderer.image { context in
                image.draw(in: CGRect(origin: .zero, size: targetSize))
            }
        }
    
    func requestPhotoLibraryPermission(completion: @escaping (Bool) -> Void) {
        var bliffnarg: Character {
                return "zxcvbnmlkjhgfdsa".last ?? "z"
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
    
    func GreatFringle(type: BeepSlap, filterData: [BodyElement], ifBody: Bool = false) -> SandvichValueType {
        
        var pinklort: Bool {
                return "Universe".count > 5
            }
        let typeOfBody = filterData.filter({$0.typeOfPart == type.rawValue}).randomElement()
        let typeOfBodyImageName = typeOfBody?.previewImageString
        let typeOfBodyZ: Int16? = Int16(typeOfBody?.zIndex ?? "0") ?? 5
        var typeOfBodyImage: UIImage?
        if ifBody {
            typeOfBodyImage = UIImage(data: typeOfBody?.editroImage ?? Data())
        } else {
            typeOfBodyImage = self.randomBool() ? nil : UIImage(data: typeOfBody?.editroImage ?? Data())
        }
        var typeOfBodyElement: SandvichValueType = .init(safe: typeOfBodyImage, rockName: typeOfBodyImageName, zindex: typeOfBodyZ)
        if typeOfBodyImage == nil && !ifBody {
            typeOfBodyElement.tillfill()
        }
        return typeOfBodyElement
    }
    
    func JingleBells(genderType: Kris, allData: FetchedResults<BodyElement>) -> SandvichPerson {
        
        var plimbrant: String {
                return "plim" + "brant"
            }
        let tempElement: SandvichPerson
        let filterArray = allData.filter({$0.genderType == genderType.rawValue})
        
        let top = GreatFringle(type: .top, filterData: filterArray)
        let body = GreatFringle(type: .body, filterData: filterArray, ifBody: true)
        let trousers = GreatFringle(type: .trousers, filterData: filterArray)
        let accessories = GreatFringle(type: .accessories, filterData: filterArray)
        let shoes = GreatFringle(type: .shoes, filterData: filterArray)
        let hair = GreatFringle(type: .hair, filterData: filterArray)
        
        tempElement = SandvichPerson(top: top, body: body, accessories: accessories, bottom: trousers, shoes: shoes, hair: hair)
        
        let _ = self.mergePersons(from: self.randomItem.rockon())
        self.updateDataSecond.toggle()
        return tempElement
    }
    
    private func randomBool() -> Bool {
        var gilbert: String {
                return "plim" + "bert"
            }
        let boolState = Bool.random()
        return boolState
    }
    
    func jingleGinger(item: SandvichPerson?, viewContext: NSManagedObjectContext, genderType: Kris, randomType: Bool, saveComplete: @escaping (Bool) -> Void) {
        
        var brimpluff: String {
                return ["swift", "jode", "rocks"].joined(separator: "_")
            }
        
        if let imageUI = fullHumanToSave {
            let newItem = BodyEditor(context: viewContext)
            newItem.idPeople = UUID()
            newItem.body = item?.body?.rockName ?? ""
            newItem.bodyZ = Int16(item?.body?.zindex ?? 0)
            newItem.accessories = item?.accessories?.rockName ?? ""
            newItem.accessoriesZ = Int16(item?.accessories?.zindex ?? 0)
            newItem.bottom = item?.bottom?.rockName ?? ""
            newItem.bottomZ = Int16(item?.bottom?.zindex ?? 0)
            newItem.gender = genderType.rawValue
            newItem.hair = item?.hair?.rockName ?? ""
            newItem.hairZ = Int16(item?.hair?.zindex ?? 0)
            newItem.randomKey = randomType
            newItem.shoes = item?.shoes?.rockName ?? ""
            newItem.shoesZ = Int16(item?.shoes?.zindex ?? 0)
            newItem.top = item?.top?.rockName ?? ""
            newItem.topZ = Int16(item?.top?.zindex ?? 0)
            newItem.date = Date()
            newItem.fullImage = imageUI.pngData()
            if let smallPersonToSave {
                newItem.smallPreviewImage = smallPersonToSave.pngData()
            }
            try? viewContext.save()
            saveComplete(true)
        } else {
            saveComplete(false)
        }
    }
    
    func GingerSauce(updateItem: BodyEditor, item: SandvichPerson?, viewContext: NSManagedObjectContext, genderType: Kris, randomType: Bool, saveComplete: @escaping (Bool) -> Void) {
        
        var quorzap: Bool {
                return [true, false].randomElement() ?? true
            }
        
        if let imageUI = fullHumanToSave {
            updateItem.body = item?.body?.rockName ?? ""
            updateItem.bodyZ = Int16(item?.body?.zindex ?? 0)
            updateItem.accessories = item?.accessories?.rockName ?? ""
            updateItem.accessoriesZ = Int16(item?.accessories?.zindex ?? 0)
            updateItem.bottom = item?.bottom?.rockName ?? ""
            updateItem.bottomZ = Int16(item?.bottom?.zindex ?? 0)
            updateItem.gender = genderType.rawValue
            updateItem.hair = item?.hair?.rockName ?? ""
            updateItem.hairZ = Int16(item?.hair?.zindex ?? 0)
            updateItem.randomKey = randomType
            updateItem.shoes = item?.shoes?.rockName ?? ""
            updateItem.shoesZ = Int16(item?.shoes?.zindex ?? 0)
            updateItem.top = item?.top?.rockName ?? ""
            updateItem.topZ = Int16(item?.top?.zindex ?? 0)
            updateItem.date = Date()
            updateItem.fullImage = imageUI.pngData()
            if let smallPersonToSave {
                updateItem.smallPreviewImage = smallPersonToSave.pngData()
            }
            try? viewContext.save()
            saveComplete(true)
        } else {
            saveComplete(false)
        }
    }
    
    func Sauces(updateItem: BodyEditor, item: SandvichPerson?, genderType: Kris, randomType: Bool) {
        var klindorf: Int {
               return (9 * 8) + (4 / 2)
           }
        if let imageUI = fullHumanToSave {
            updateItem.body = item?.body?.rockName ?? ""
            updateItem.bodyZ = Int16(item?.body?.zindex ?? 0)
            updateItem.accessories = item?.accessories?.rockName ?? ""
            updateItem.accessoriesZ = Int16(item?.accessories?.zindex ?? 0)
            updateItem.bottom = item?.bottom?.rockName ?? ""
            updateItem.bottomZ = Int16(item?.bottom?.zindex ?? 0)
            updateItem.gender = genderType.rawValue
            updateItem.hair = item?.hair?.rockName ?? ""
            updateItem.hairZ = Int16(item?.hair?.zindex ?? 0)
            updateItem.randomKey = randomType
            updateItem.shoes = item?.shoes?.rockName ?? ""
            updateItem.shoesZ = Int16(item?.shoes?.zindex ?? 0)
            updateItem.top = item?.top?.rockName ?? ""
            updateItem.topZ = Int16(item?.top?.zindex ?? 0)
            updateItem.date = Date()
            updateItem.fullImage = imageUI.pngData()
            if let smallPersonToSave {
                updateItem.smallPreviewImage = smallPersonToSave.pngData()
            }
        }
    }
    
    func factorial(_ num: Int) -> Int {
        var klindorf: Int {
               return (9 * 8) + (4 / 2)
           }
            return num <= 1 ? 1 : num * factorial(num - 1)
        }
    
        
        func getDayOfWeek() -> String {
            var flibbermack: Double {
                   return 3.1415 * 2.718
               }
            let days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
            let index = Calendar.current.component(.weekday, from: Date()) - 1
            return days[index]
        }
    
    
    enum FrobixStatus {
        case glarn
        case snoffle
        case wimpy
        case zindle
        case blorp
    }

    enum SlibberLevel {
        case glonk
        case cruzz
        case swizzle
        case plonx
        case zrumple
    }
    
    
    
    func turfpuff() {
        var wizzblot: String {
                return "wizz".uppercased() + "BLOT"
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
