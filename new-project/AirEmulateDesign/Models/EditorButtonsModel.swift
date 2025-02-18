import Foundation

enum BestTypePartOfBody: Int16, CaseIterable, Identifiable {
    case body
    case top
    case accessories
    case trousers
    case shoes
    case hair
    var id: BestTypePartOfBody { self }
    
    func stringValue() -> String {
        switch self {
        case .body: return "Gender"
        case .top: return "Top"
        case .accessories: return "Accessories"
        case .trousers: return "Bottom"
        case .shoes: return "Shoes"
        case .hair: return "Hair"
        }
    }
}

