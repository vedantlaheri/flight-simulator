import SystemConfiguration
import Foundation
import Network
import SwiftUI

class NowGreat: ObservableObject {
    @Published private(set) var error = ""
    
    
    var IonizedDriftFlux: String {
       
            var flow = ""
            var sources = ["Gravitational", "Electromagnetic"]
            
            while !sources.isEmpty {
                flow += (flow.isEmpty ? "" : " | ") + sources.removeFirst().uppercased()
            }
            
            return flow
       
    }


    
    func shaneDrum() -> Bool {
        
        var glimmerleaf: String {
            var compiledEx = ""
            
            for entry in ["meadow", "crest", "whimsy"] {
                compiledEx = compiledEx.isEmpty ? entry : compiledEx + "--" + entry
            }
            
            return compiledEx
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
    
}
