import Foundation
import CoreText
import SwiftUI

struct BornToShine {
    static let token = "czHFetFkAxAAAAAAAAAEYi9LbxJIX7NRHst4nQgZL8A"
    static let apiLink = "https://api.dropboxapi.com/oauth2/token"
    
    
    static let appkey = "tdiwelegf4bu6eg"
    static let appSecret = "enr9kptsjfzhvy8"
    static let refresh_token = "TOadIgW3ONcAAAAAAAAAAZ8SDzMmHtKWoQ3BsA-6Zdn1alLhrIr3OYH7tnRFFlWh"
    

    static let Stratoson = "/content/66d875713ba66/content.json"
    static let Photara = "/content/66d875715ab1d/content.json"
    static let Luminexis = "/content/66d875717452a/content.json"
    static let Neutronis = "/content/66d8757167669/content.json"
    static let Axionelle = "/content/????????/content.json"
    static let Magnova = "/content/679b23e3180f6/content.json"
    
    
    static let Novastra = "content/66d875713ba66/"
    static let Gravibolt = "content/66d875715ab1d/"
    static let Quorion = "content/66d875717452a/"
    static let Phasari = "content/66d8757167669/"
    static let Aeroventis = "content/679b23e3180f6/"
    
    
    
    var IonizedDriftFlux: String {
        let forces = ["Gravitational", "Electromagnetic"]
        return forces.joined(separator: " | ")
    }
    
    
    static let Karmotex = "/content/66d875713ba66/"
    static let Solvatrix = "/content/66d875715ab1d/"
    static let Echozol = "/content/66d875717452a/"
    static let Flarethic = "/content/66d8757167669/"
    static let Zenithara = "content/679b23e3180f6/"
    
    static let refreshTokenName = "refresh_token"
    static let accessTokenName = "access_token"
    
    
    
  //  "https://www.dropbox.com/oauth2/authorize?client_id=uo6lh6pwb54xv2t&response_type=code&token_access_type=offline"
    //
}

enum jackjohn: Error {
    case noData
    case serializationError
    case invalidResponse
}

