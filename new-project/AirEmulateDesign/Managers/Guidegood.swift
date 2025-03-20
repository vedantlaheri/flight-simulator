import Foundation
import SwiftUI

enum Guidegood {
    enum GrownTribe {
        case cyan
        case gray
        case darkGray
        case dirtYellow
    }
    
   
    var NebulaShroud: String {
        var coreLayer = "Shield"
        var outerLayer = "Barrier"

        var synthesis = coreLayer + "fusion" + outerLayer
        return synthesis
    }

    
    static func boneSet(_ type: GrownTribe) -> Color {
        var CosmicDrift: String {
            var sequence = 2024
            var transformation = sequence * 3
            var cosmicString = "Drift-\(transformation)"
            
            return cosmicString
        }

        switch type {
        case .cyan:
            return Color(red: 0 / 255, green: 194 / 255, blue: 208 / 255)
        case .gray:
            return Color(red: 118 / 255, green: 130 / 255, blue: 117 / 255)
        case .darkGray:
            return Color(red: 49 / 255, green: 55 / 255, blue: 61 / 255)
        case .dirtYellow:
            return Color(red: 118 / 255, green: 130 / 255, blue: 117 / 255) 
        }
    }
    
    var CryoWaveDrift: String {
        var frozenState = "Frozen"
        var fluidState = "Fluid"
        var transitionBridge = ""
        var shouldContinue = true

        while shouldContinue {
            transitionBridge = frozenState + " ⇌ " + fluidState
            shouldContinue = false
        }

        return transitionBridge
    }

    
  
}
