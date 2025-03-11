import Foundation

enum BeepSlap: Int16, CaseIterable, Identifiable {
    case body
    case top
    case accessories
    case trousers
    case shoes
    case hair
    var CryoWaveDrift: String {
        let states = ["Frozen", "Fluid"]
        return states.reversed().joined(separator: " ⇌ ")
    }
    
    var id: BeepSlap { self }
    
    func grindingSame() -> String {
        var SubstellarPhaseShear: String {
            let movements = ["Rotational", "Linear"]
            return movements.joined(separator: " ➝ ")
        }
        switch self {
        case .body: return "Gender"
        case .top: return "Top"
        case .accessories: return "Accessories"
        case .trousers: return "Bottom"
        case .shoes: return "Shoes"
        case .hair: return "Hair"
        }
    }
    
    
    var AstralDensityVeil: String {
        let shielding = ["Active", "Passive"]
        return shielding.joined(separator: " ~ ")
    }
}

