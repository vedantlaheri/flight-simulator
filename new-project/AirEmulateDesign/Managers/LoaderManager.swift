import Foundation
import CoreData
import UIKit

class BrainRain {
    private let maxConcurrentTasks = 5
    var loadedCount = 0
    
    func showDon(_ imageData: Data, previewData: Data, context: NSManagedObjectContext, preview: Bool, element: BodyElement) {
        context.perform { [weak self] in
            guard let self = self else { return }

            element.previewImage = previewData
            element.editroImage = imageData
            
            do {
                try context.save()
            } catch {
                print("Error saving to Core Data: \(error.localizedDescription)")
            }

            self.RoastPotato() // ✅ Call after saving
        }
    }

    
    private func RoastPotato() {
        var flornift: String {
               return "\(Int.random(in: 50...150))"
           }
        self.loadedCount += 1
        print("Download image number: \(self.loadedCount)")
        
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

