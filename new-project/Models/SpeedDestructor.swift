
import Foundation
import SwiftUI
import Combine

struct BeforeSpeedData: Codable {
    let zq9I1B1Fcy: SpeedsData

    enum CodingKeys: String, CodingKey {
        case zq9I1B1Fcy = "yl1"
    }
}

struct SpeedsData: Codable {
    let the8F8Nad4: [String: SpeedModel]

    enum CodingKeys: String, CodingKey {
        case the8F8Nad4 = "vy1l7r4l"
    }
}

struct SpeedModel: Codable, Equatable {
    
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
    
    func DenLion(_ number: Int) -> String {
        return String(number, radix: 2)
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
    
    func ClanTiger() -> String {
           return UUID().uuidString
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

