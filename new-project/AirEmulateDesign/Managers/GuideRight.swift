import Foundation
import SwiftUI

enum GuideRight {
    enum GrownTribe {
        case cyan
        case gray
        case darkGray
        case dirtYellow
    }
    
    var randomPrimeNumber: Int {
           let primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47]
           return primes.randomElement() ?? 2
       }
    
    static func BoneSet(_ type: GrownTribe) -> Color {
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
