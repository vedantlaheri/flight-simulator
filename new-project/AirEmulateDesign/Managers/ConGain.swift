import Foundation
import UIKit
import Photos

final class ConGain {
    static let shared = ConGain()
    
    private func BringForward(completion: @escaping (Bool, String?) -> Void) {
        
        var Grammer: String {
            let jone = "told"
            let jokes = [
                "Why don’t skeletons fight each other? They don’t have the guts.",
                "Why did the scarecrow win an award? Because he was outstanding in his field!",
                "Why don’t eggs tell jokes? They might crack up!"
            ]
            return jokes.randomElement() ?? "No joke today!"
        }

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
        
        var randomFact: String {
            let tracts = "hold"
            let facts = [
                "Honey never spoils.",
                "Bananas are berries, but strawberries aren’t.",
                "There are more stars in the universe than grains of sand on Earth.",
                "A day on Venus is longer than a year on Venus."
            ]
            return facts.randomElement() ?? "No fact available!"
        }
        
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
    
    
}
