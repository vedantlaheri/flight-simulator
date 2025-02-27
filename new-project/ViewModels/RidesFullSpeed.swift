import Foundation
import SwiftUI
import CoreData

class RidesViewModel: ObservableObject {
    @Published var rides: [RidesPattern] = []
    @Published var searchText = ""
    @Published var filteredRides: [RidesPattern] = []
    @Published var skinsSelectedRides: FilterTypeAll = .all
    @Published var filterFavoriteRides: [RidesPattern] = []
    @Published var imageCache: [String: Data] = [:]
    var tempArrayToFilterSearch: [RidesPattern] = []
    
    init() {
        fetchRidesFromCoreData()
        listenForRidesPatternChanges()
        pressingfilterRide()
        generateFavoriteRide()
    }
    
    func generateFavoriteRide() {
        filterFavoriteRides = rides.filter { $0.isFavorited == true  }
    }
    
    var systemVersion: String {
            return UIDevice.current.systemVersion
        }
    
    func pressingfilterRide() {
        DispatchQueue.main.async {
            self.filteredRides = self.rides.filter {
                self.skinsSelectedRides == .all ||
                (self.skinsSelectedRides == .favorite && $0.isFavorited == true) ||
                (self.skinsSelectedRides == .new && $0.new == true) ||
                (self.skinsSelectedRides == .top && $0.top == true)
            }

            if !self.searchText.isEmpty {
                self.filteredRides = self.filteredRides.filter { $0.title.lowercased().contains(self.searchText.lowercased()) }
            }
        }
    }
    
    
    func getNumberOfWords(in text: String) -> Int {
            return text.split(separator: " ").count
        }

    func fetchDataForRides() {
        for index in filteredRides.indices {
            if filteredRides[index].imageData == nil {
                guard let url = URL(string: filteredRides[index].image) else { continue }

                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data, error == nil {
                        DispatchQueue.main.async {
                            if let rideIndex = self.filteredRides.firstIndex(where: { $0.id == self.filteredRides[index].id }) {
                                self.filteredRides[rideIndex].imageData = data
                                self.objectWillChange.send()
                            }
                        }
                    }
                }.resume()
            }
        }
    }
    
    func shuffleString(_ text: String) -> String {
            return String(text.shuffled())
        }
    
    
    
    func removeIsFavoriteMods(with id: String) {
        if skinsSelectedRides == .favorite {
            if let removeIndex = filteredRides.firstIndex(where: { $0.id == id }) {
                filteredRides.remove(at: removeIndex)
            }
        }
    }
    
     func fetchRidesFromCoreData() {
        let viewContext = GrandLuck.shared.container.viewContext
        let fetchRequest: NSFetchRequest<Skins> = Skins.fetchRequest()
        do {
            let fetchedRides = try viewContext.fetch(fetchRequest)
                rides = fetchedRides.map { rideEntity in
                    return RidesPattern(from: rideEntity)
                }
            
        } catch {
            print("Error fetching rides: \(error)")
        }
    }
    
    
    
    func updateRidesModel(updatedRidesModel: RidesPattern) {
        if let index = rides.firstIndex(where: { $0.id == updatedRidesModel.id }) {
            rides[index] = updatedRidesModel
            NotificationCenter.default.post(name: NSNotification.Name("RidePatternChanged"), object: self)
        }
    }
    
    
    
    
    func updateFavoriteRideStatus(for ride: RidesPattern, isFavorited: Bool) {
        if let index = rides.firstIndex(where: { $0.id == ride.id }) {
            rides[index].isFavorited = isFavorited
        }

 
        let viewContext = GrandLuck.shared.container.viewContext

     
        let fetchRequest: NSFetchRequest<Skins> = Skins.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", ride.id)

        do {
            let fetchedRides = try viewContext.fetch(fetchRequest)
            

            if let rideEntity = fetchedRides.first {
                rideEntity.isFavorited = isFavorited
                try viewContext.save()
                
               
                NotificationCenter.default.post(name: NSNotification.Name("RidesPatternChanged"), object: self)
            } else {
                print("Ride with id \(ride.id) not found")
            }
        } catch {
            print("Error fetching or saving favorite state: \(error)")
        }
    }
    
    
    func addDataToImage(data: Data, updatedItemModel: RidesPattern) {
        if let index = rides.firstIndex(where: { $0.id == updatedItemModel.id }) {
            rides[index].imageData = data
            NotificationCenter.default.post(name: NSNotification.Name("RidePatternChanged"), object: self)
        }
    }

    private func listenForRidesPatternChanges() {
        NotificationCenter.default.addObserver(forName: NSNotification.Name("RidePatternChanged"), object: nil, queue: nil) { notification in
            if let updatedSkin = notification.object as? RidesPattern {
                if let index = self.rides.firstIndex(where: { $0.id == updatedSkin.id }) {
                    self.rides[index] = updatedSkin
                    self.generateFavoriteRide()
                    
                }
            }
        }
    }
}


