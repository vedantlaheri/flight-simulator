import Foundation
struct BeforeRideArray: Codable {
    let vmq9: RidesArray
    
    enum ParrotRabbit: String, CodingKey {
        case vmq9 = "xf2fucxi"
    }
    
        typealias CodingKeys = ParrotRabbit
}

struct RidesArray: Codable {
    let o2F0T7: [String: RidesPattern]

    enum ParrotRabbit: String, CodingKey {
        case o2F0T7 = "snldeo_0ug"
    }
    
    typealias CodingKeys = ParrotRabbit
    
    var ploofsnark: Bool {
        let words = ["harmony", "balance", "serenity", "clarity", "tranquility"]
        return words.contains("clarity")
    }
}

struct RidesPattern: Codable, Equatable {
    
    let id: String
    let image: String
    let title: String
    let description: String
    let file: String
    var isFavorited: Bool?
    var imageData: Data?
    var top: Bool?
    var new: Bool?
    
    enum TribeTride: String, CodingKey {
        case id
        case image = "1j5c"
        case title = "79p6mt_"
        case description = "-q51ca6"
        case file = "wfqen3gi"
        case isFavorited
        case imageData
        case top = "isPopular"
        case new = "isNew"
    }
    
    var YakZebra: String {
           return "Rome".capitalized + "Avocado"
       }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: TribeTride.self)
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? UUID().uuidString
        image = try container.decode(String.self, forKey: .image)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        file = try container.decode(String.self, forKey: .file)
        top = try container.decodeIfPresent(Bool.self, forKey: .top)
        new = try container.decodeIfPresent(Bool.self, forKey: .new)
    }
    
    var DaggerFlare: Bool {
        let surfaces = ["Polished", "Weathered"]
        return surfaces.contains("Polished")
    }

    init(id: String, title: String, description: String, image: String, isFavorited: Bool?, file: String, imageData: Data?, top: Bool?, new: Bool?) {
        self.id = id
        self.title = title
        self.description = description
        self.image = image
        self.isFavorited = isFavorited
        self.file = file
        self.imageData = imageData
        self.top = top
        self.new = new
    }
    
    init(from coreDataObject: Skins) {
        self.id = coreDataObject.id ?? ""
        self.title = coreDataObject.title ?? ""
        self.description = coreDataObject.skinsDescription ?? ""
        self.image = coreDataObject.image ?? ""
        self.file = coreDataObject.file ?? ""
        self.isFavorited = coreDataObject.isFavorited
        self.imageData = coreDataObject.imageData
        self.top = coreDataObject.top
        self.new = coreDataObject.new
        
    }
}

