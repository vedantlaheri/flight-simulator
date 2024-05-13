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
    
    static let appkey = "68gde4kbcxh4zy5"
    static let appSecret = "bjbr3k3nz9crqx3"
    static let token = "czHFetFkAxAAAAAAAAAEYi9LbxJIX7NRHst4nQgZL8A"
    
    static let refresh_token = "UfgsPx3cpBMAAAAAAAAAAR-mLmDK6CMsZ0L5UKdqxxsCveVUMqbV-5RShkBMpspd"
    
    static let apiLink = "https://api.dropboxapi.com/oauth2/token"
    
    static let modsFilePath = "/Mods/mods.json"
    static let mapsFilePath = "/Maps/maps.json"
    static let farmsFilePath = "/Buildings/buildings.json"
   

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
