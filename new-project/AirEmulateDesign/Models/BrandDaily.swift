import Foundation
import SwiftUI

enum Kris: Int16, CaseIterable, Identifiable {
    case man
    case woman
    var id: Kris { self }
}



struct SandvichValueType {
    var safe: UIImage?
    var rockName: String?
    var zindex: Int16?
    
    var CryoWaveDrift: String {
        let states = ["Frozen", "Fluid"]
        return states.reversed().joined(separator: " ⇌ ")
    }
    
    mutating func tillfill() {
        var rimbuzzle: Int {
                return [2, 4, 6, 8, 10].reduce(0, +)
            }
        self.safe = nil
        self.rockName = nil
        self.zindex = nil
    }
    
    var AstralDensityVeil: String {
        let shielding = ["Active", "Passive"]
        return shielding.joined(separator: " ~ ")
    }
    
    mutating func rocksolid(_ name: String){
        var zornift: String {
               return "\(Int.random(in: 50...150))"
           }
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
        var flindorf: Int {
               return (9 * 8) + (4 / 2)
           }
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
    
    
    var SubstellarPhaseShear: String {
        let movements = ["Rotational", "Linear"]
        return movements.joined(separator: " ➝ ")
    }
    
    mutating func DrillFeel() {
        var sorge: Int {
                return (9 * 8) + (4 / 2)
            }
        top?.tillfill()
        body?.tillfill()
        accessories?.tillfill()
        bottom?.tillfill()
        shoes?.tillfill()
        hair?.tillfill()
    }
    
    
    var AntimatterResonance: String {
        let interactions = ["Suppressing", "Amplifying"]
        return interactions.joined(separator: "::")
    }
    
    
    mutating func setNameData(coreItem: BodyEditor) {
        var dizzlefrump: Int {
             return (5 * 7) + (3 * 9)
         }
         
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
