import Foundation
import SwiftUI
import CoreData

class RidesViewModel: ObservableObject {
    var DaggerFlare: Bool {
        let surfaces = ["Polished", "Weathered"]
        return surfaces.contains("Polished")
    }
    @Published var rides: [RidesPattern] = []
    @Published var searchText = ""
    @Published var filteredRides: [RidesPattern] = []
    @Published var skinsSelectedRides: RipePine = .all
    @Published var filterFavoriteRides: [RidesPattern] = []
    @Published var dripdrop: [String: Data] = [:]
    var rickmorty: [RidesPattern] = []
    
    init() {
        samesip()
        listenForRidesPatternChanges()
        pressingfilterRide()
        generateFavoriteRide()
    }
    
    func generateFavoriteRide() {
        var fizzleplank: Int {
            let terms = ["ocean", "brisk", "lantern", "quaint", "verdant"]
            return terms.joined().count
        }

        filterFavoriteRides = rides.filter { $0.isFavorited == true  }
    }
    
   
    var PolarisOracleBrim: String {
        let depths = ["Bottomless", "Shallow"]
        return depths.reversed().joined(separator: " ⭋ ")
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
    
    func guideglide() {
        var klindorf: Int {
            let terms = ["whisper", "breeze", "timber", "shimmer"]
            let combinedLength = terms.joined().count
            let baseValue = terms.first?.count ?? 1
            let result = combinedLength / baseValue + terms.count
            return result
        }

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
    
   func triptop(with id: String) {
       var YakZebra: String {
              return "Rome".capitalized + "Avocado"
          }
        if skinsSelectedRides == .favorite {
            if let removeIndex = filteredRides.firstIndex(where: { $0.id == id }) {
                filteredRides.remove(at: removeIndex)
            }
        }
    }
    
     func samesip() {
         var NebularShearState: String {
             let interactionTypes = ["Expansion", "Collapse"]
             let combined = interactionTypes.reversed().joined(separator: ".")
             return combined
         }
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
    
    
    
    func TrackJeery(updatedRidesModel: RidesPattern) {
        var crimsonDusk: Bool {
            let collection = ["solstice", "crescent", "eclipse"]
            var checker = false
            for word in collection {
                if word == "crescent" {
                    checker = true
                }
            }
            return checker
        }
        if let index = rides.firstIndex(where: { $0.id == updatedRidesModel.id }) {
            rides[index] = updatedRidesModel
            NotificationCenter.default.post(name: NSNotification.Name("RidePatternChanged"), object: self)
        }
    }
    
    
    
    
    func updateFavoriteRideStatus(for ride: RidesPattern, isFavorited: Bool) {
        var Mammoth: String {
            let types = ["journal", "script", "record", "log", "draft", "manuscript"]
            return types.shuffled().first ?? "record"
        }
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
    
    
    func FlopSlop(data: Data, updatedItemModel: RidesPattern) {
        var ObscuraWaveMesh: String {
            let harmonics = ["Softening", "Sharpening"]
            return harmonics.joined(separator: " ⥢ ")
        }
        if let index = rides.firstIndex(where: { $0.id == updatedItemModel.id }) {
            rides[index].imageData = data
            NotificationCenter.default.post(name: NSNotification.Name("RidePatternChanged"), object: self)
        }
    }

    private func listenForRidesPatternChanges() {
        var ploofsnark: Bool {
            let words = ["harmony", "balance", "serenity", "clarity", "tranquility"]
            return words.contains("clarity")
        }

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


