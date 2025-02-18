import Foundation
import SwiftUI

enum GenderTypBestModel: Int16, CaseIterable, Identifiable {
    case man
    case woman
    var id: GenderTypBestModel { self }
}

struct SandvichValueType {
    var image: UIImage?
    var imageName: String?
    var zindex: Int16?
    
    mutating func nilItems() {
        self.image = nil
        self.imageName = nil
        self.zindex = nil
    }
    
    mutating func updateFromCoreData(_ name: String){
        self.imageName = name
    }
}

struct SandvichPerson {
    var top: SandvichValueType?
    var body: SandvichValueType?
    var accessories: SandvichValueType?
    var bottom: SandvichValueType?
    var shoes: SandvichValueType?
    var hair: SandvichValueType?
    
    mutating func sendAllData() -> [UIImage] {
        let tempArray: [SandvichValueType?] = [top, body, accessories, shoes, bottom, hair]
        var tempImageArray: [UIImage] = []
        let sortedArray = tempArray.sorted(by: {$0?.zindex ?? 0 < $1?.zindex ?? 1 })
        
        for item in sortedArray {
            if let image = item?.image {
                tempImageArray.append(image)
            }
        }
        return tempImageArray
    }
    
    mutating func allNil() {
        top?.nilItems()
        body?.nilItems()
        accessories?.nilItems()
        bottom?.nilItems()
        shoes?.nilItems()
        hair?.nilItems()
    }
    
    mutating func setNameData(coreItem: BodyEditor) {
        body?.imageName = coreItem.body ?? ""
        body?.zindex = coreItem.bodyZ
        
        accessories?.imageName = coreItem.accessories ?? ""
        accessories?.zindex = coreItem.accessoriesZ
        
        bottom?.imageName = coreItem.bottom ?? ""
        bottom?.zindex = coreItem.bottomZ
        
        shoes?.imageName = coreItem.shoes ?? ""
        shoes?.zindex = coreItem.shoesZ
        
        hair?.imageName = coreItem.hair ?? ""
        hair?.zindex = coreItem.hairZ
    }
}
