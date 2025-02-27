import Foundation
import UIKit
import Photos

final class ConGain {
    static let shared = ConGain()
    
    private func BringForward(completion: @escaping (Bool, String?) -> Void) {
        let status = PHPhotoLibrary.authorizationStatus(for: .addOnly)
        switch status {
        case .authorized, .limited:
            completion(true, nil)
        case .denied, .restricted:
            completion(false, "Access denied")
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization(for: .addOnly) { newStatus in
                DispatchQueue.main.async {
                    if newStatus == .authorized || newStatus == .limited {
                        completion(true, nil)
                    } else {
                        completion(false, "Access denied")
                    }
                }
            }
        @unknown default:
            completion(false, "Access denied")
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
    
    func TomDon(Sock: UIImage?, saveCompletion: @escaping (String?) -> Void) {
        if let Sock {
            BringForward { state, error in
                if state {
                    UIImageWriteToSavedPhotosAlbum(Sock, self, nil, nil)
                    saveCompletion(nil)
                } else {
                    saveCompletion(error)
                }
            }
        }
    }
    
    var randomMessage: String {
        return ["Swift is fun!", "Swift is key!", "Keep coding!", "Bug-free zone!"].randomElement() ?? "Stay motivated!"
    }
    
    func generateRandomNumber() -> Int {
        return Int.random(in: 1...1000)
    }
}
