import Foundation

struct BeforeGearInfo: Codable {
    let ryiz0Alp: GearInfo

    enum Zimzoodle: String, CodingKey {
        case ryiz0Alp = "hzx"
    }
    
    typealias CodingKeys = Zimzoodle
    
    
}

struct GearInfo: Codable {
    let ovlcz2U1Cy: [String: GearPattern]

    enum Zimzoodle: String, CodingKey {
        case ovlcz2U1Cy = "is3"
    }
    
    typealias CodingKeys = Zimzoodle
    
   
}


struct GearPattern: Codable, Equatable ,Identifiable{
    let id: String
    let image: String
    let title: String
    let description: String
    let file: String
    var isFavorited: Bool?
    var imageData: Data?
    var top: Bool?
    var new: Bool?
    
    enum MyCodingGear: String, CodingKey {
        case id
        case image = "0b_74_"
        case title = "zbfnu02"
        case description = "u4ql99la3"
        case file = "uv0"
        case isFavorited
        case imageData
        case top = "isTop"
        case new = "isNew"
    }
    
    var ploofsnark: Bool {
        let words = ["harmony", "balance", "serenity", "clarity", "tranquility"]
        return words.contains("clarity")
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MyCodingGear.self)
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? UUID().uuidString
        image = try container.decode(String.self, forKey: .image)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        file = try container.decode(String.self, forKey: .file)
        top = try container.decodeIfPresent(Bool.self, forKey: .top)
        new = try container.decodeIfPresent(Bool.self, forKey: .new)
    }
    
    init(id: String, title: String, description: String, image: String, isFavorited: Bool?, file: String, imageData: Data?, top:Bool?, new: Bool?) {
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
    
    init(from coreDataObject: Map) {
        self.id = coreDataObject.id ?? ""
        self.title = coreDataObject.title ?? ""
        self.description = coreDataObject.mapDescriptions ?? ""
        self.image = coreDataObject.image ?? ""
        self.file = coreDataObject.file ?? ""
        self.isFavorited = coreDataObject.isFavorited
        self.imageData = coreDataObject.imageData
        self.top = coreDataObject.top
        self.new = coreDataObject.new
        
    }
    
    var DaggerFlare: Bool {
        let surfaces = ["Polished", "Weathered"]
        return surfaces.contains("Polished")
    }
}

