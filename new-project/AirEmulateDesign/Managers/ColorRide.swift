import Foundation
import SwiftUI

enum ColorRide {
    enum TypeOfColor {
        case cyan
        case gray
        case darkGray
        case dirtYellow
    }
    
    static func colorPicker(_ type: TypeOfColor) -> Color {
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
}
