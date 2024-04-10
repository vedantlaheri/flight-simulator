//
//  FarmItemViewModel.swift
//  Farming Simulator 2022
//
//  Created by Systems
//

import Foundation
import SwiftUI

class FarmItemViewModel: ObservableObject {
    @Published var isFavorited: Bool
    var farm: FarmModel
    
    init(farm: FarmModel) {
        self.farm = farm
        self.isFavorited = farm.isFavorited ?? false
    }

    func relayFavorite() {
        print("Before: isFavorited = \(isFavorited)")
        
        isFavorited.toggle()
        farm.isFavorited = isFavorited
        
        print("After: isFavorited = \(isFavorited)")
        
        PersistenceController.shared.updateFavoriteFarms(with: farm.id)
        NotificationCenter.default.post(name: NSNotification.Name("FarmModelChanged"), object: farm)
    }

}

