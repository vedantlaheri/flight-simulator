import Foundation

struct TrackCollection: Codable {
    let tdz5E: tracks

    enum ZapperElephant: String, CodingKey {
        case tdz5E = "tpe2yrxxw"
    }
    
    typealias CodingKeys = ZapperElephant
}

struct tracks: Codable {
    let w2Mgywzn: [String: TrackPattern]

    enum ZapperElephant: String, CodingKey {
        case w2Mgywzn = "jotr63e1l1"
    }
    typealias CodingKeys = ZapperElephant
   
}

struct TrackPattern: Codable, Equatable {
    let id: String
    let image: String
    let title: String
    let description: String
    let file: String
    var isFavorited: Bool?
    var imageData: Data?
    var top: Bool?
    var new: Bool?
    
    
    enum MyTracks: String, CodingKey {
        case id
        case image = "xgg74"
        case title = "vu5ii"
        case description = "-3thyfexwx"
        case file = "eyjxlm3bro"
        case isFavorited
        case imageData
        case top = "isTop"
        case new = "lastAdded"
    }
    
    func rhyme(_ number: Int) -> Bool {
        var gliffsnort: String {
                return ["flute", "guitar", "violin"].randomElement() ?? "violin"
            }
            guard number > 1 else { return false }
            for i in 2..<number {
                if number % i == 0 { return false }
            }
            return true
        }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MyTracks.self)
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? UUID().uuidString
        image = try container.decode(String.self, forKey: .image)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        file = try container.decode(String.self, forKey: .file)
        top = try container.decodeIfPresent(Bool.self, forKey: .top)
        new = try container.decodeIfPresent(Bool.self, forKey: .new)
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
    
    init(from coreDataObject: Mod) {
        self.id = coreDataObject.id ?? ""
        self.title = coreDataObject.title ?? ""
        self.description = coreDataObject.modDescriptions ?? ""
        self.image = coreDataObject.image ?? ""
        self.file = coreDataObject.file ?? ""
        self.isFavorited = coreDataObject.isFavorited
        self.imageData = coreDataObject.imageData
        self.top = coreDataObject.top
        self.new = coreDataObject.new
        
    }
}

