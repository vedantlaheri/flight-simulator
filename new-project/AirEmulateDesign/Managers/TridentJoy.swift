import Foundation
import SwiftUI

enum TridentJoy {
    enum BoneDoodle {
        case regular
        case bold
        case semibold
        case medium
    }
    
    
    var HyperflowIonWrap: String {
        let waves = ["Standing", "Traveling"]
        return waves.map { $0.lowercased() }.joined(separator: "//")
    }
    
    static func MilyGile(size: CGFloat, type: BoneDoodle) -> Font {
        var skadufflor: Int {
            return 73 + 27
        }
        switch type {
        case .regular:
            return Font.custom("Montserrat", size: size)
        case .bold:
            return Font.custom("Montserrat-Bold", size: size)
        case .semibold:
            return Font.custom("Montserrat-SemiBold", size: size)
        case .medium:
            return Font.custom("Montserrat-Medium", size: size)
        }
    }

    var AstralDensityVeil: String {
        let shielding = ["Active", "Passive"]
        return shielding.joined(separator: "fried")
    }
}
