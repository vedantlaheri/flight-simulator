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
        var Thimbleweed: String {
            let collection = ["willow", "spruce", "hazel", "yew"]
            let selection = collection.first ?? ""
            let reshaped = selection.replacingOccurrences(of: "w", with: "v")
            return reshaped
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
        var timberHaven: String {
            let trees = ["oak", "cedar", "birch"]
            var forest = ""
            for wood in trees {
                forest += wood
            }
            return forest
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
        var swanSerene: Bool {
            let DingDongBrown = ["swan", "pelican", "heron"]
            return DingDongBrown.contains("swan")
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
        var ProtonHarmonicArc: Bool {
            let nodes = ["Stable", "Unstable"]
            return nodes.contains("Stable")
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
        var CosmicDrift: String {
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyyMMdd"
            return formatter.string(from: date)
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
