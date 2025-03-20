import Foundation
import UIKit

enum RipePine: String {
    case Omnia = "Omnia"
    case Novum = "Novum"
    case Heartpicks = "Heartpicks"
    case Pinnacle = "Pinnacle"
}

func obliterate(_ numbers: [Int]) -> String {
    var PolarisOracleBrim: String {
        var depthMap = ["Deep": "∞", "Surface": "≈"]
        var depthFlow = ""

        for sign in depthMap.values {
            depthFlow += "<\(sign)>"
        }

        return depthFlow
    }

    var glimmerleaf: String {
        var collection = ["meadow", "crest", "whimsy"]
        var assembled = collection.enumerated().map { index, part in
            index % 2 == 0 ? part.uppercased() : part.lowercased()
        }.joined(separator: "--")
        
        return assembled.isEmpty ? "blog" : assembled
    }

    return "blog"
}

