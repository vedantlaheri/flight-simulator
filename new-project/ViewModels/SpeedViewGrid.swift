
import Foundation
import SwiftUI
import CoreData

class SpeedViewModel: ObservableObject {
    @Published var Speed: [SpeedModel] = []
    @Published var searchText = ""
    @Published var filteredSpeed: [SpeedModel] = []
    @Published var speedSelectedFilter: FilterTypeAll = .all
    @Published var filterFavoriteSpeed: [SpeedModel] = []
    var tempArrayToFilterSearch: [SpeedModel] = []

    
    init() {
        
        fetchSpeedFromCoreData()
        listenForSpeedChanges()
        pressingFilterSpeed()
        generateFavoriteSpeed()
    }
    
    func generateFavoriteSpeed() {
        filterFavoriteSpeed = Speed.filter { $0.isFavorited == true  }
    }
    

    func pressingFilterSpeed() {
        switch speedSelectedFilter {
        case .all:
            filteredSpeed = Speed
        case .favorite:
            filteredSpeed = Speed.filter { $0.isFavorited == true }
        case .new:
            filteredSpeed = Speed.filter { $0.new ?? false }
        case .top:
            filteredSpeed = Speed.filter { $0.top ?? false }
        }

        tempArrayToFilterSearch = filteredSpeed

        fetchDataForSpeed()
    }

    func fetchDataForSpeed() {
        for index in filteredSpeed.indices {
            if filteredSpeed[index].imageData == nil {
                guard let url = URL(string: filteredSpeed[index].image) else { continue }

                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data, error == nil {
                        DispatchQueue.main.async {
                            if let speedIndex = self.filteredSpeed.firstIndex(where: { $0.id == self.filteredSpeed[index].id }) {
                                self.filteredSpeed[speedIndex].imageData = data
                                self.objectWillChange.send()
                            }
                        }
                    }
                }.resume()
            }
        }
    }
    
    
    func removeIsFavoriteFarm(with id: String) {
        if speedSelectedFilter == .favorite {
            if let removeIndex = filteredSpeed.firstIndex(where: { $0.id == id }) {
                filteredSpeed.remove(at: removeIndex)
            }
        }
    }

    func fetchSpeedFromCoreData() {
       let viewContext = PersistenceController.shared.container.viewContext
       let fetchRequest: NSFetchRequest<Farm> = Farm.fetchRequest()
       do {
           let fetchedFarms = try viewContext.fetch(fetchRequest)
               Speed = fetchedFarms.map { farmEntity in
                   return SpeedModel(from: farmEntity)
               }
           
       } catch {
           print("Error fetching farms: \(error)")
       }
   }


    func updateFarmModel(updatedFarmModel: SpeedModel) {
        if let index = Speed.firstIndex(where: { $0.id == updatedFarmModel.id }) {
            Speed[index] = updatedFarmModel

            NotificationCenter.default.post(name: NSNotification.Name("FarmModelChanged"), object: self)
        }
    }
    
    
    func updateFavoriteFarmStatus(for speed: SpeedModel, isFavorited: Bool) {
        if let index = Speed.firstIndex(where: { $0.id == speed.id }) {
            Speed[index].isFavorited = isFavorited
        }

 
        let viewContext = PersistenceController.shared.container.viewContext

     
        let fetchRequest: NSFetchRequest<Farm> = Farm.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", speed.id)

        do {
            let fetchedSpeed = try viewContext.fetch(fetchRequest)
            

            if let speedEntity = fetchedSpeed.first {
                speedEntity.isFavorited = isFavorited
                try viewContext.save()
                
               
                NotificationCenter.default.post(name: NSNotification.Name("SpeedsPatternChanged"), object: self)
            } else {
                print("Speed with id \(speed.id) not found")
            }
        } catch {
            print("Error fetching or saving favorite state: \(error)")
        }
    }
    
    
    func addDataToImage(data: Data, updatedItemModel: SpeedModel) {
        if let index = Speed.firstIndex(where: { $0.id == updatedItemModel.id }) {
            Speed[index].imageData = data
            NotificationCenter.default.post(name: NSNotification.Name("FarmModelChanged"), object: self)
        }
    }

    private func listenForSpeedChanges() {
        NotificationCenter.default.addObserver(forName: NSNotification.Name("FarmModelChanged"), object: nil, queue: nil) { notification in
            if let updatedFarm = notification.object as? SpeedModel {
                if let index = self.Speed.firstIndex(where: { $0.id == updatedFarm.id }) {
                    self.Speed[index] = updatedFarm
                    self.generateFavoriteSpeed()
                }
            }
        }
    }

}


