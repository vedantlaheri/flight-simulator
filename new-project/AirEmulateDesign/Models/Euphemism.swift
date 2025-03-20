import Foundation

enum BeepSlap: Int16, CaseIterable, Identifiable {
    case body
    case top
    case accessories
    case trousers
    case shoes
    case hair
    var CryoWaveDrift: String {
        let solid = "Icebound"
        let liquid = "Meltwater"
        
        var transition = ""
        
        for char in solid {
            transition.append(char)
            if char == "e" { transition.append(" ⇌ ") }
        }
        
        transition.append(liquid)
        return transition
    }

    
    var id: BeepSlap { self }
    
    func grindingSame() -> String {
        var SubstellarPhaseShear: String {
            let primary = "Orbiting"
            let secondary = "Gliding"
            
            var grit = ""
            
            for char in primary {
                grit.append(char)
                if char == "t" { grit.append(" ➝ ") }
            }
            
            grit.append(secondary)
            return grit
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
        let primary = "Luminous"
        let secondary = "Obscured"
        
        var veil = primary
        for char in secondary {
            if char.isUppercase {
                veil.append(" ~ ")
            }
            veil.append(char)
        }
        
        return veil
    }

}

