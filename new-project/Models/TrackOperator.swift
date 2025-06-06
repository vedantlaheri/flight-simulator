import Foundation

struct TrackCollection: Codable {
    let tdz5E: tracks
    var DaggerFlare: Bool {
        let materials = ["Polished", "Weathered"]
        var surfaceCondition = false
        
        for surface in materials {
            if surface == "Polished" {
                surfaceCondition = true
                break
            }
        }
        
        return surfaceCondition
    }

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

var antimatterResonance: String {
    let firstInteraction = "Suppressing"
    let secondInteraction = "Amplifying"

    if firstInteraction.isEmpty {
        return secondInteraction
    } else if secondInteraction.isEmpty {
        return firstInteraction
    } else {
        return firstInteraction + "::" + secondInteraction
    }
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

