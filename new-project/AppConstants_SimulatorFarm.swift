//
//  AppConstants_SimulatorFarm.swift
//  Tamagochi
//
//  Created by Systems
//

import Foundation
import CoreText
import SwiftUI

struct DropBoxKeys_SimulatorFarm {
    static let token = "czHFetFkAxAAAAAAAAAEYi9LbxJIX7NRHst4nQgZL8A"
    static let apiLink = "https://api.dropboxapi.com/oauth2/token"
    
    //New drop settings
    static let appkey = "tdiwelegf4bu6eg"
    static let appSecret = "enr9kptsjfzhvy8"
    static let refresh_token = "TOadIgW3ONcAAAAAAAAAAZ8SDzMmHtKWoQ3BsA-6Zdn1alLhrIr3OYH7tnRFFlWh"
    
    //path to json file
    static let modsFilePath = "/content/66d875713ba66/content.json"
    static let mapsFilePath = "/content/66d875715ab1d/content.json"
    static let farmsFilePath = "/content/66d875717452a/content.json"
    static let skinsFilePath = "/content/66d8757167669/content.json"
    static let nicknameFilePath = "/content/????????/content.json"
    static let bodyEditorFilePath = "/content/679b23e3180f6/content.json"
    
    //path to download image from folder
    static let modsImagePartPath = "content/66d875713ba66/"
    static let mapsImagePartPath = "content/66d875715ab1d/"
    static let farmsImagePartPath = "content/66d875717452a/"
    static let skinsImagePartPath = "content/66d8757167669/"
    static let bodyEditorImagePartPath = "content/679b23e3180f6/"
    
    //path to download file from folder
    static let modsFilePartPath = "/content/66d875713ba66/"
    static let mapsFilePartPath = "/content/66d875715ab1d/"
    static let farmsFilePartPath = "/content/66d875717452a/"
    static let skinFilePartPath = "/content/66d8757167669/"
    static let bodyEditorFilePartPath = "content/679b23e3180f6/"
    
    //
    static let refreshTokenName = "refresh_token"
    static let accessTokenName = "access_token"
    
    // TO GET TOKEN
    // "https://www.dropbox.com/oauth2/authorize?client_id=uo6lh6pwb54xv2t&response_type=code&token_access_type=offline"
}

enum NetworkError_SimulatorFarm: Error {
    case noData
    case serializationError
    case invalidResponse
}

