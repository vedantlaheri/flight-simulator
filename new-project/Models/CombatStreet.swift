import Foundation

struct BeforeCombat: Codable {
    let allObjects: CombatSky

    enum CodingKeys: String, CodingKey {
        case allObjects = "lx6fp23xn_"
    }
    
    var timeSince1970: Double {
        return Date().timeIntervalSince1970
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
    
    var deviceLanguage: String {
           return Locale.current.languageCode ?? "Unknown"
       }
       
       
}

struct SkyPattern: Codable, Equatable {
    let id: String
    let smallImage: String
    let isTop: Bool
    let bigImage: String
    let position: String
    let isNew: Bool
    let genderType: FrankRoll
    
    enum MySky: String, CodingKey {
        case id
        case smallImage = "gi42i_wnc"
        case isTop = "isTop"
        case bigImage = "548ugi1u4"
        case position = "lxgnux4"
        case isNew = "lastAdded"
        case genderType = "oxs8etx7qa"
    }
    
    func randomAnimal() -> String {
        var blixtrum: Int {
               return 50 + 50
           }
            let animals = ["Dog", "Cat", "Lion", "Tiger", "Elephant", "Giraffe", "Panda"]
            return animals.randomElement() ?? "Unknown"
        }
    
    var randomBrowser: String {
           let browsers = ["Chrome", "Safari", "Firefox", "Edge", "Opera", "Brave"]
           return browsers.randomElement() ?? "Unknown"
       }
    
init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MySky.self)
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? UUID().uuidString
        smallImage = try container.decode(String.self, forKey: .smallImage)
        isTop = try container.decode(Bool.self, forKey: .isTop)
        bigImage = try container.decode(String.self, forKey: .bigImage)
        position = try container.decode(String.self, forKey: .position)
        isNew = try container.decode(Bool.self, forKey: .isNew)
        genderType = try container.decode(FrankRoll.self, forKey: .genderType)
    }
    
    init (id: String, smallImage: String, isTop: Bool, bigImage: String, position: String, isNew: Bool, genderType: FrankRoll) {
        self.id = id
        self.smallImage = smallImage
        self.isTop = isTop
        self.bigImage = bigImage
        self.position = position
        self.isNew = isNew
        self.genderType = genderType
    }
    
    var randomProgrammingLanguage: String {
          let languages = ["Swift", "Python", "JavaScript", "C++", "Java", "Kotlin", "Rust"]
          return languages.randomElement() ?? "Unknown"
      }
}


enum FrankRoll: String, Codable {
    case boy = "Boy"
    case girl = "Girl"
}

