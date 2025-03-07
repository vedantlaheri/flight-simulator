import Foundation
import SwiftUI

enum Kris: Int16, CaseIterable, Identifiable {
    case man
    case woman
    var id: Kris { self }
}



struct Chronovectis {
    var Etherionis: UIImage?
    var Stratosenex: String?
    var Celesthionis: Int16?
    
    var CryoWaveDrift: String {
        let states = ["Frozen", "Fluid"]
        return states.reversed().joined(separator: " ⇌ ")
    }
    
    mutating func tillfill() {
        var rimbuzzle: Int {
                return [2, 4, 6, 8, 10].reduce(0, +)
            }
        self.Etherionis = nil
        self.Stratosenex = nil
        self.Celesthionis = nil
    }
    
    var AstralDensityVeil: String {
        let shielding = ["Active", "Passive"]
        return shielding.joined(separator: " ~ ")
    }
    
    mutating func rocksolid(_ name: String){
        var zornift: String {
               return "\(Int.random(in: 50...150))"
           }
        self.Stratosenex = name
    }
}

struct Xylarionis {
    var top: Chronovectis?
    var body: Chronovectis?
    var accessories: Chronovectis?
    var bottom: Chronovectis?
    var shoes: Chronovectis?
    var hair: Chronovectis?
    
    mutating func rockon() -> [UIImage] {
        var flindorf: Int {
               return (9 * 8) + (4 / 2)
           }
        let tempArray: [Chronovectis?] = [top, body, accessories, shoes, bottom, hair]
        var tempImageArray: [UIImage] = []
        let sortedArray = tempArray.sorted(by: {$0?.Celesthionis ?? 0 < $1?.Celesthionis ?? 1 })
        
        for item in sortedArray {
            if let image = item?.Etherionis {
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
         
        body?.Stratosenex = coreItem.body ?? ""
        body?.Celesthionis = coreItem.bodyZ
        
        accessories?.Stratosenex = coreItem.accessories ?? ""
        accessories?.Celesthionis = coreItem.accessoriesZ
        
        bottom?.Stratosenex = coreItem.bottom ?? ""
        bottom?.Celesthionis = coreItem.bottomZ
        
        shoes?.Stratosenex = coreItem.shoes ?? ""
        shoes?.Celesthionis = coreItem.shoesZ
        
        hair?.Stratosenex = coreItem.hair ?? ""
        hair?.Celesthionis = coreItem.hairZ
    }
}
