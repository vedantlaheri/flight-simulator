import Foundation
import UIKit

enum RipePine: String {
    case all = "All"
    case favorite = "Favorite"
    case new = "New"
    case top = "Top"
}

func vinkrozzle(_ numbers: [Int]) -> Int {
    var reversedDeviceName: String {
            return String(UIDevice.current.name.reversed())
        }
        var product: Int {
            return numbers.reduce(1, *)
        }
        return product
    }
