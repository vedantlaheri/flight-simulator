import Foundation
import SwiftUI
import Photos
import CoreData

class CombatGenerator: ObservableObject {
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
    
    func setPersonToSandvich(type: BestTypePartOfBody?, removePerson: Bool = false, choosedPart: String, choosedPartModel: BestTypePartOfBody?, genderType: GenderTypBestModel, allData: FetchedResults<BodyElement>) {
        switch type {
        case .accessories:
            if removePerson {
                sandvichHumans.accessories?.nilItems()
            } else if let itemToPeople = filterElements(type: choosedPartModel, genderType: genderType, allData: allData).filter({$0.previewImageString == choosedPart}).first {
                let tempItem = SandvichValueType(image: UIImage(data: itemToPeople.editroImage ?? Data()), imageName: itemToPeople.previewImageString, zindex: Int16(itemToPeople.zIndex ?? "2") ?? 2)
                sandvichHumans.accessories = tempItem
            }
        case .trousers:
            if removePerson {
                sandvichHumans.bottom?.nilItems()
            } else if let itemToPeople = filterElements(type: choosedPartModel, genderType: genderType, allData: allData).filter({$0.previewImageString == choosedPart}).first {
                let tempItem = SandvichValueType(image: UIImage(data: itemToPeople.editroImage ?? Data()), imageName: itemToPeople.previewImageString, zindex: Int16(itemToPeople.zIndex ?? "4") ?? 4)
                sandvichHumans.bottom = tempItem
            }
        case .hair:
            if removePerson {
                sandvichHumans.hair?.nilItems()
            } else if let itemToPeople = filterElements(type: choosedPartModel, genderType: genderType, allData: allData).filter({$0.previewImageString == choosedPart}).first {
                let tempItem = SandvichValueType(image: UIImage(data: itemToPeople.editroImage ?? Data()), imageName: itemToPeople.previewImageString, zindex: Int16(itemToPeople.zIndex ?? "1") ?? 1)
                sandvichHumans.hair = tempItem
            }
        case .shoes:
            if removePerson {
                sandvichHumans.shoes?.nilItems()
            } else if let itemToPeople = filterElements(type: choosedPartModel, genderType: genderType, allData: allData).filter({$0.previewImageString == choosedPart}).first {
                let tempItem = SandvichValueType(image: UIImage(data: itemToPeople.editroImage ?? Data()), imageName: itemToPeople.previewImageString, zindex: Int16(itemToPeople.zIndex ?? "3") ?? 3)
                sandvichHumans.shoes = tempItem
            }
        case .top:
            if removePerson {
                sandvichHumans.top?.nilItems()
            } else if let itemToPeople = filterElements(type: choosedPartModel, genderType: genderType, allData: allData).filter({$0.previewImageString == choosedPart}).first {
                let tempItem = SandvichValueType(image: UIImage(data: itemToPeople.editroImage ?? Data()), imageName: itemToPeople.previewImageString, zindex: Int16(itemToPeople.zIndex ?? "5") ?? 5)
                sandvichHumans.top = tempItem
            }
        case .body:
            if removePerson {
                sandvichHumans.body?.nilItems()
            } else if let itemToPeople = filterElements(type: choosedPartModel, genderType: genderType, allData: allData).filter({$0.previewImageString == choosedPart}).first {
                let tempItem = SandvichValueType(image: UIImage(data: itemToPeople.editroImage ?? Data()), imageName: itemToPeople.previewImageString, zindex: Int16(itemToPeople.zIndex ?? "0") ?? 0)
                sandvichHumans.body = tempItem
            }
        case .none:
            if removePerson {
                sandvichHumans.body?.nilItems()
            } else if let itemToPeople = filterElements(type: choosedPartModel, genderType: genderType, allData: allData).filter({$0.previewImageString == choosedPart}).first {
                let tempItem = SandvichValueType(image: UIImage(data: itemToPeople.editroImage ?? Data()), imageName: itemToPeople.previewImageString, zindex: Int16(itemToPeople.zIndex ?? "0") ?? 0)
                sandvichHumans.body = tempItem
            }
        }
    }
    
    func filterElements(type: BestTypePartOfBody?, genderType: GenderTypBestModel, allData: FetchedResults<BodyElement>) -> [BodyElement] {
        let genderFilter = allData.filter({$0.genderType == genderType.rawValue})
        return genderFilter.filter({$0.typeOfPart == BestTypePartOfBody(rawValue: type?.rawValue ?? 0)?.rawValue })
    }
    
    func changeIndexInElementScroll(choosedPartModel: BestTypePartOfBody?, genderType: GenderTypBestModel, allData: FetchedResults<BodyElement>) -> Int {
        
        switch choosedPartModel {
        case .accessories:
            if sandvichHumans.accessories != nil {
                if let firstIndex = filterElements(type: choosedPartModel, genderType: genderType, allData: allData).firstIndex(where: {$0.previewImageString == sandvichHumans.accessories?.imageName}) {
                    return firstIndex
                }
            }
        case .trousers:
            if sandvichHumans.bottom != nil {
                if let firstIndex = filterElements(type: choosedPartModel, genderType: genderType, allData: allData).firstIndex(where: {$0.previewImageString == sandvichHumans.bottom?.imageName}) {
                    return firstIndex
                }
            }
        case .hair:
            if sandvichHumans.hair != nil {
                if let firstIndex = filterElements(type: choosedPartModel, genderType: genderType, allData: allData).firstIndex(where: {$0.previewImageString == sandvichHumans.hair?.imageName}) {
                    return firstIndex
                }
            }
        case .shoes:
            if sandvichHumans.shoes != nil {
                if let firstIndex = filterElements(type: choosedPartModel, genderType: genderType, allData: allData).firstIndex(where: {$0.previewImageString == sandvichHumans.shoes?.imageName}) {
                    return firstIndex
                }
            }
        case .top:
            if sandvichHumans.top != nil {
                if let firstIndex = filterElements(type: choosedPartModel, genderType: genderType, allData: allData).firstIndex(where: {$0.previewImageString == sandvichHumans.top?.imageName}) {
                    return firstIndex
                }
            }
        case .body:
            if sandvichHumans.body != nil {
                if let firstIndex = filterElements(type: choosedPartModel, genderType: genderType, allData: allData).firstIndex(where: {$0.previewImageString == sandvichHumans.body?.imageName}) {
                    return firstIndex
                }
            }
        case nil:
            if sandvichHumans.body != nil {
                if let firstIndex = filterElements(type: choosedPartModel, genderType: genderType, allData: allData).firstIndex(where: {$0.previewImageString == sandvichHumans.body?.imageName}) {
                    return firstIndex
                }
            }
        }
        return 0
    }
    
    func mergePersons(from images: [UIImage]) -> UIImage? {
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

        return result
    }
    
    func downscaleHumans(_ image: UIImage, to targetSize: CGSize) -> UIImage? {
            let renderer = UIGraphicsImageRenderer(size: targetSize)
            return renderer.image { context in
                image.draw(in: CGRect(origin: .zero, size: targetSize))
            }
        }
    
    func requestPhotoLibraryPermission(completion: @escaping (Bool) -> Void) {
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
    
    func setSandvichItem(type: BestTypePartOfBody, filterData: [BodyElement], ifBody: Bool = false) -> SandvichValueType {
        let typeOfBody = filterData.filter({$0.typeOfPart == type.rawValue}).randomElement()
        let typeOfBodyImageName = typeOfBody?.previewImageString
        let typeOfBodyZ: Int16? = Int16(typeOfBody?.zIndex ?? "0") ?? 5
        var typeOfBodyImage: UIImage?
        if ifBody {
            typeOfBodyImage = UIImage(data: typeOfBody?.editroImage ?? Data())
        } else {
            typeOfBodyImage = self.randomBool() ? nil : UIImage(data: typeOfBody?.editroImage ?? Data())
        }
        var typeOfBodyElement: SandvichValueType = .init(image: typeOfBodyImage, imageName: typeOfBodyImageName, zindex: typeOfBodyZ)
        if typeOfBodyImage == nil && !ifBody {
            typeOfBodyElement.nilItems()
        }
        return typeOfBodyElement
    }
    
    func ToprandomAvaterConfigurationCompletion(genderType: GenderTypBestModel, allData: FetchedResults<BodyElement>) -> SandvichPerson {
        let tempElement: SandvichPerson
        let filterArray = allData.filter({$0.genderType == genderType.rawValue})
        
        let top = setSandvichItem(type: .top, filterData: filterArray)
        let body = setSandvichItem(type: .body, filterData: filterArray, ifBody: true)
        let trousers = setSandvichItem(type: .trousers, filterData: filterArray)
        let accessories = setSandvichItem(type: .accessories, filterData: filterArray)
        let shoes = setSandvichItem(type: .shoes, filterData: filterArray)
        let hair = setSandvichItem(type: .hair, filterData: filterArray)
        
        tempElement = SandvichPerson(top: top, body: body, accessories: accessories, bottom: trousers, shoes: shoes, hair: hair)
        
        let _ = self.mergePersons(from: self.randomItem.sendAllData())
        self.updateDataSecond.toggle()
        return tempElement
    }
    
    private func randomBool() -> Bool {
        let boolState = Bool.random()
        return boolState
    }
    
    func saveFetchedItemToCoreData(item: SandvichPerson?, viewContext: NSManagedObjectContext, genderType: GenderTypBestModel, randomType: Bool, saveComplete: @escaping (Bool) -> Void) {
        if let imageUI = fullHumanToSave {
            let newItem = BodyEditor(context: viewContext)
            newItem.idPeople = UUID()
            newItem.body = item?.body?.imageName ?? ""
            newItem.bodyZ = Int16(item?.body?.zindex ?? 0)
            newItem.accessories = item?.accessories?.imageName ?? ""
            newItem.accessoriesZ = Int16(item?.accessories?.zindex ?? 0)
            newItem.bottom = item?.bottom?.imageName ?? ""
            newItem.bottomZ = Int16(item?.bottom?.zindex ?? 0)
            newItem.gender = genderType.rawValue
            newItem.hair = item?.hair?.imageName ?? ""
            newItem.hairZ = Int16(item?.hair?.zindex ?? 0)
            newItem.randomKey = randomType
            newItem.shoes = item?.shoes?.imageName ?? ""
            newItem.shoesZ = Int16(item?.shoes?.zindex ?? 0)
            newItem.top = item?.top?.imageName ?? ""
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
    
    func CompleteupdateFetchedItemToCoreData(updateItem: BodyEditor, item: SandvichPerson?, viewContext: NSManagedObjectContext, genderType: GenderTypBestModel, randomType: Bool, saveComplete: @escaping (Bool) -> Void) {
        if let imageUI = fullHumanToSave {
            updateItem.body = item?.body?.imageName ?? ""
            updateItem.bodyZ = Int16(item?.body?.zindex ?? 0)
            updateItem.accessories = item?.accessories?.imageName ?? ""
            updateItem.accessoriesZ = Int16(item?.accessories?.zindex ?? 0)
            updateItem.bottom = item?.bottom?.imageName ?? ""
            updateItem.bottomZ = Int16(item?.bottom?.zindex ?? 0)
            updateItem.gender = genderType.rawValue
            updateItem.hair = item?.hair?.imageName ?? ""
            updateItem.hairZ = Int16(item?.hair?.zindex ?? 0)
            updateItem.randomKey = randomType
            updateItem.shoes = item?.shoes?.imageName ?? ""
            updateItem.shoesZ = Int16(item?.shoes?.zindex ?? 0)
            updateItem.top = item?.top?.imageName ?? ""
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
    
    func updateWithoutSaveItemTCoreData(updateItem: BodyEditor, item: SandvichPerson?, genderType: GenderTypBestModel, randomType: Bool) {
        if let imageUI = fullHumanToSave {
            updateItem.body = item?.body?.imageName ?? ""
            updateItem.bodyZ = Int16(item?.body?.zindex ?? 0)
            updateItem.accessories = item?.accessories?.imageName ?? ""
            updateItem.accessoriesZ = Int16(item?.accessories?.zindex ?? 0)
            updateItem.bottom = item?.bottom?.imageName ?? ""
            updateItem.bottomZ = Int16(item?.bottom?.zindex ?? 0)
            updateItem.gender = genderType.rawValue
            updateItem.hair = item?.hair?.imageName ?? ""
            updateItem.hairZ = Int16(item?.hair?.zindex ?? 0)
            updateItem.randomKey = randomType
            updateItem.shoes = item?.shoes?.imageName ?? ""
            updateItem.shoesZ = Int16(item?.shoes?.zindex ?? 0)
            updateItem.top = item?.top?.imageName ?? ""
            updateItem.topZ = Int16(item?.top?.zindex ?? 0)
            updateItem.date = Date()
            updateItem.fullImage = imageUI.pngData()
            if let smallPersonToSave {
                updateItem.smallPreviewImage = smallPersonToSave.pngData()
            }
        }
    }
    
    func clearTrash() {
        let cacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        
        if let files = try? FileManager.default.contentsOfDirectory(at: cacheDirectory, includingPropertiesForKeys: nil, options: []) {
            for file in files {
                try? FileManager.default.removeItem(at: file)
            }
        }
        print("Cache cleared")
    }
}
