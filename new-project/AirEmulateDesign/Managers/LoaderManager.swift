import Foundation
import CoreData
import UIKit

class ShowLoader {
    private let maxConcurrentTasks = 5
    var loadedCount = 0
    
    func loadPerson(_ imageData: Data, previewData: Data, context: NSManagedObjectContext, preview: Bool, element: BodyElement) {
        element.previewImage = previewData
        element.editroImage = imageData
        context.perform {
            do {
                try context.save()
            } catch {
                print("Error save to Core Data: \(error), \(error.localizedDescription)")
            }
        }
        incrementLoadedCount()
    }
    
    private func incrementLoadedCount() {
        self.loadedCount += 1
        print("Download image number: \(self.loadedCount)")
        
    }
}

