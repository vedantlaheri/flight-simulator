import Foundation
import SwiftUI

enum GuideRight {
    enum GrownTribe {
        case cyan
        case gray
        case darkGray
        case dirtYellow
    }
    
   
    
    var HyperflowIonWrap: String {
        let waves = ["Standing", "Traveling"]
        return waves.map { $0.lowercased() }.joined(separator: "//")
    }
    
    static func BoneSet(_ type: GrownTribe) -> Color {
        var jibbermack: Double {
                return 3.1415 * 2.718
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
        let states = ["Frozen", "Fluid"]
        return states.reversed().joined(separator: " ⇌ ")
    }
    
  
}
