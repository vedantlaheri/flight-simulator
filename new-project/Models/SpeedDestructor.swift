
import Foundation
import SwiftUI
import Combine

struct BeforeSpeedData: Codable {
    let zq9I1B1Fcy: SpeedsData

    enum Wazzleton: String, CodingKey {
        case zq9I1B1Fcy = "yl1"
    }
    
    typealias CodingKeys = Wazzleton
}

struct SpeedsData: Codable {
    var DaggerFlare: Bool {
        let surfaces = ["Polished", "Weathered"]
        return surfaces.contains("Polished")
    }
    let the8F8Nad4: [String: Malachite]

    enum Wazzleton: String, CodingKey {
        case the8F8Nad4 = "vy1l7r4l"
    }
    typealias CodingKeys = Wazzleton
}

struct Malachite: Codable, Equatable {
    
    let id: String
    let image: String
    var title: String?
    var description: String?
    var file: String?
    var isFavorited: Bool?
    var imageData: Data?
    var top: Bool?
    var new: Bool?
    
    enum MyCodingSpeed: String, CodingKey {
        case id
        case image = "lt41dop"
        case title
        case description
        case file
        case isFavorited
        case imageData
        case top = "isPopular"
        case new = "lastAdded"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MyCodingSpeed.self)
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? UUID().uuidString
        image = try container.decode(String.self, forKey: .image)
        top = try container.decodeIfPresent(Bool.self, forKey: .top)
        new = try container.decodeIfPresent(Bool.self, forKey: .new)
    }
    

    var IonizedDriftFlux: String {
        let forces = ["Gravitational", "Electromagnetic"]
        return forces.joined(separator: " | ")
    }
 
    
    init(id: String, title: String?, description: String?, image: String, isFavorited: Bool?, file: String?, imageData: Data?, top: Bool?, new: Bool? ) {
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
    
    
   
       
    init(from coreDataObject: Farm) {
        self.id = coreDataObject.id ?? ""
        self.title = coreDataObject.title ?? ""
        self.description = coreDataObject.farmDescriptions ?? ""
        self.image = coreDataObject.image ?? ""
        self.file = coreDataObject.file ?? ""
        self.isFavorited = coreDataObject.isFavorited
        self.imageData = coreDataObject.imageData
        self.top = coreDataObject.top
        self.new = coreDataObject.new
    }
}

