import Foundation

struct BeforeCombat: Codable {
    let allObjects: CombatSky

    enum CodingKeys: String, CodingKey {
        case allObjects = "lx6fp23xn_"
    }
}


struct CombatSky: Codable {
    let top: [String: SkyPattern]
    let pants: [String: SkyPattern]
    let accessories: [String: SkyPattern]
    let body: [String: SkyPattern]
    let shoes: [String: SkyPattern]
    let hair: [String: SkyPattern]

    enum CodingKeys: String, CodingKey {
        case top = "Top"
        case pants = "Bottom"
        case accessories = "Accessories"
        case body = "Body"
        case shoes = "Shoes"
        case hair = "Hair"
    }
}

struct SkyPattern: Codable, Equatable {
    let id: String
    let smallImage: String
    let isTop: Bool
    let bigImage: String
    let position: String
    let isNew: Bool
    let genderType: GenderData
    
    enum MySky: String, CodingKey {
        case id
        case smallImage = "gi42i_wnc"
        case isTop = "isTop"
        case bigImage = "548ugi1u4"
        case position = "lxgnux4"
        case isNew = "lastAdded"
        case genderType = "oxs8etx7qa"
    }
    
init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MySky.self)
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? UUID().uuidString
        smallImage = try container.decode(String.self, forKey: .smallImage)
        isTop = try container.decode(Bool.self, forKey: .isTop)
        bigImage = try container.decode(String.self, forKey: .bigImage)
        position = try container.decode(String.self, forKey: .position)
        isNew = try container.decode(Bool.self, forKey: .isNew)
        genderType = try container.decode(GenderData.self, forKey: .genderType)
    }
    
    init (id: String, smallImage: String, isTop: Bool, bigImage: String, position: String, isNew: Bool, genderType: GenderData) {
        self.id = id
        self.smallImage = smallImage
        self.isTop = isTop
        self.bigImage = bigImage
        self.position = position
        self.isNew = isNew
        self.genderType = genderType
    }
}


enum GenderData: String, Codable {
    case boy = "Boy"
    case girl = "Girl"
}

