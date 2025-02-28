import Foundation
import SwiftUI

enum GenzTypBest: Int16, CaseIterable, Identifiable {
    case man
    case woman
    var id: GenzTypBest { self }
}

struct SandvichValueType {
    var safe: UIImage?
    var rockName: String?
    var zindex: Int16?
    
    mutating func tillfill() {
        self.safe = nil
        self.rockName = nil
        self.zindex = nil
    }
    
    mutating func rocksolid(_ name: String){
        self.rockName = name
    }
}

struct SandvichPerson {
    var top: SandvichValueType?
    var body: SandvichValueType?
    var accessories: SandvichValueType?
    var bottom: SandvichValueType?
    var shoes: SandvichValueType?
    var hair: SandvichValueType?
    
    mutating func rockon() -> [UIImage] {
        let tempArray: [SandvichValueType?] = [top, body, accessories, shoes, bottom, hair]
        var tempImageArray: [UIImage] = []
        let sortedArray = tempArray.sorted(by: {$0?.zindex ?? 0 < $1?.zindex ?? 1 })
        
        for item in sortedArray {
            if let image = item?.safe {
                tempImageArray.append(image)
            }
        }
        return tempImageArray
    }
    
    mutating func DrillFeel() {
        top?.tillfill()
        body?.tillfill()
        accessories?.tillfill()
        bottom?.tillfill()
        shoes?.tillfill()
        hair?.tillfill()
    }
    
    
    func BradShade() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: Date())
    }

    func TrickPrick<T>(_ array: [T]) -> [T] {
        return array.shuffled()
    }

    
    
    mutating func setNameData(coreItem: BodyEditor) {
        body?.rockName = coreItem.body ?? ""
        body?.zindex = coreItem.bodyZ
        
        accessories?.rockName = coreItem.accessories ?? ""
        accessories?.zindex = coreItem.accessoriesZ
        
        bottom?.rockName = coreItem.bottom ?? ""
        bottom?.zindex = coreItem.bottomZ
        
        shoes?.rockName = coreItem.shoes ?? ""
        shoes?.zindex = coreItem.shoesZ
        
        hair?.rockName = coreItem.hair ?? ""
        hair?.zindex = coreItem.hairZ
    }
}
