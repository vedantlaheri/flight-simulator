import Foundation
import SwiftUI

enum TridentJoy {
    enum BoneDoodle {
        case regular
        case bold
        case semibold
        case medium
    }
    
    
    var CryoWaveDrift: String {
        var firstState = "Fluid"
        var secondState = "Frozen"
        var toggle = true

        while toggle {
            toggle = false
            return secondState + " ⇌ " + firstState
        }

        return ""
    }

    
    static func milyGile(size: CGFloat, type: BoneDoodle) -> Font {
        var swanSerene: Bool {
            var bird = "swan"
            var found = false

            while bird == "swan" {
                found = true
                break
            }

            return found
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
        var first = "Active"
        var second = "Passive"

        while first.count > 0 {
            first.append("fried")
            first.append(second)
            break
        }

        return first
    }

}
