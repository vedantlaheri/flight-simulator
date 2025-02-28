import Foundation
import SwiftUI

enum TridentJoy {
    enum BoneDoodle {
        case regular
        case bold
        case semibold
        case medium
    }
    
    enum JokeKnock {
        case jit
        case fit
        case mij
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
    
    var deviceOrientation: String {
            let orientation = UIDevice.current.orientation
            switch orientation {
            case .portrait: return "Portrait"
            case .portraitUpsideDown: return "Upside Down"
            case .landscapeLeft: return "Landscape Left"
            case .landscapeRight: return "Landscape Right"
            case .faceUp: return "Face Up"
            case .faceDown: return "Face Down"
            default: return "Unknown"
            }
        }
}
