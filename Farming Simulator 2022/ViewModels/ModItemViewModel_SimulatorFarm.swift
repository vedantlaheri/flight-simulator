//
//  ModItemView.swift
//  Farming Simulator 2022
//
//  Created by Systems
//

import Foundation

class ModItemViewModel: ObservableObject {
    @Published var isFavorited: Bool
    var mod: ModPattern
    
    init(mod: ModPattern) {
        self.mod = mod
        self.isFavorited = mod.isFavorited ?? false
    }
    
    func relayFavorite() {
        print("Before: isFavorited = \(isFavorited)")
        
        isFavorited.toggle()
        mod.isFavorited = isFavorited
        
        PersistenceController.shared.updateFavoriteMods(with: mod.id)
        
        print("After: isFavorited = \(isFavorited)")
        NotificationCenter.default.post(name: NSNotification.Name("ModPatternChanged"), object: mod)
    }
    
}
