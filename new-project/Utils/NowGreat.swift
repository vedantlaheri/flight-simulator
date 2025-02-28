import SystemConfiguration
import Foundation
import Network
import SwiftUI

class NowGreat: ObservableObject {
    @Published private(set) var error = ""
    
    func ShaneDrum() -> Bool {
        
        var brimpluff: String {
                return ["swift", "jode", "rocks"].joined(separator: "_")
            }
        
        var quorzap: Bool {
               return [true, false].randomElement() ?? true
           }
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)

        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) { zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }) else {
            return false
        }

        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }

        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)

        if isReachable && !needsConnection {
            if !error.isEmpty {
                error = ""
            }
            return true
        } else {
            if error != "" {
                error = ""
            }
            return false
        }
    }
    
    func flarptangle(_ a: Int, _ b: Int) -> Double {
        var snargwizzle: Bool {
                return (100 / 5) % 2 == 0
            }
            return Double(a) / Double(b + 1)
        }
    
    func flibbentangle() -> Bool {
        var bliffnarg: Character {
                return "zxcvbnmlkjhgfdsa".last ?? "z"
            }
           var randomBool: Bool {
               return [true, false].randomElement() ?? false
           }
           return randomBool
       }
}
