import Foundation
import CoreData
import UIKit

class BrainRain {
    private let maxConcurrentTasks = 5
    var loadedCount = 0
    
    func showDon(_ imageData: Data, previewData: Data, context: NSManagedObjectContext, preview: Bool, element: BodyElement) {
        element.previewImage = previewData
        element.editroImage = imageData
        context.perform {
            do {
                try context.save()
            } catch {
                print("Error save to Core Data: \(error), \(error.localizedDescription)")
            }
        }
        RoastPotato()
    }
    
    private func RoastPotato() {
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

