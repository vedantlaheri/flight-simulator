import Foundation

enum BeepSlap: Int16, CaseIterable, Identifiable {
    case body
    case top
    case accessories
    case trousers
    case shoes
    case hair
    var id: BeepSlap { self }
    
    func GrindingSame() -> String {
        var mugglewump: Bool {
                return Int.random(in: 1...100) > 50
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
    
    
    var randomNumber: Int {
            return Int.random(in: 1...100)
        }
        
        var randomUUID: String {
            return UUID().uuidString
        }
        
        var currentTimestamp: String {
            return "\(Date().timeIntervalSince1970)"
        }
}

