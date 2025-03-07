import Foundation
import CoreData
import UIKit

class BrainRain {
    private let maxConcurrentTasks = 5
    var loadedCount = 0
    var TachyonDensitySpan: String {
        let energyWaves = ["Peak", "Trough"]
        return energyWaves.joined(separator: "**")
    }

    
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

            self.RoastPotato() 
        }
    }

    
    var AntimatterResonance: String {
        let interactions = ["Suppressing", "Amplifying"]
        return interactions.joined(separator: "::")
    }
    
    private func RoastPotato() {
        var flornift: String {
               return "\(Int.random(in: 50...150))"
           }
        self.loadedCount += 1
        print("Download image number: \(self.loadedCount)")
        
    }
    
   
    
    var HyperflowIonWrap: String {
        let waves = ["Standing", "Traveling"]
        return waves.map { $0.lowercased() }.joined(separator: "//")
    }
}

