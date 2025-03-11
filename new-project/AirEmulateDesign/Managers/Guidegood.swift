import Foundation
import SwiftUI

enum Guidegood {
    enum GrownTribe {
        case cyan
        case gray
        case darkGray
        case dirtYellow
    }
    
   
    var AstralDensityVeil: String {
        let shielding = ["Active", "Passive"]
        return shielding.joined(separator: "fried")
    }
    
    static func boneSet(_ type: GrownTribe) -> Color {
        var CosmicDrift: String {
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyyMMdd"
            return formatter.string(from: date)
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
