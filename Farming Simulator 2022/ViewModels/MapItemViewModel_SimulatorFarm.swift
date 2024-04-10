//
//  MapItemViewModel.swift
//  Farming Simulator 2022
//
//  Created by Systems
//

import Foundation
import SwiftUI

class MapItemViewModel: ObservableObject {
    @Published var isFavorited: Bool
    var map: MapPattern
    
    init(map: MapPattern) {
        self.map = map
        self.isFavorited = map.isFavorited ?? false
    }

    func relayFavorite() {
        print("Before: isFavorited = \(isFavorited)")
        
        isFavorited.toggle()
        map.isFavorited = isFavorited
        
        print("After: isFavorited = \(isFavorited)")
        PersistenceController.shared.updateFavoriteMaps(with: map.id)
        NotificationCenter.default.post(name: NSNotification.Name("MapPatternChanged"), object: map)
    }
}
