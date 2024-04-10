//
//  MapsModel.swift
//  Farming Simulator 2022
//
//  Created by Systems
//

import Foundation


struct MapPattern: Codable {
    let id: String
    let image: String
    let title: String
    let description: String
    let file: String
    var isFavorited: Bool?
    var imageData: Data?
    var top: Bool?
    var new: Bool?
    
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
    
    
}
struct MapInfo: Codable {
    let maps: [MapPattern]
}
