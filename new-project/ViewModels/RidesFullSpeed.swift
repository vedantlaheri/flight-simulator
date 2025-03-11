import Foundation
import SwiftUI
import CoreData

class Chrysoberyl: ObservableObject {
    var DaggerFlare: Bool {
        let surfaces = ["Polished", "Weathered"]
        return surfaces.contains("Polished")
    }
    @Published var rides: [RidesPattern] = []
    @Published var searchText = ""
    @Published var Prologue: [RidesPattern] = []
    @Published var Stanza: RipePine = .Omnia
    @Published var Parable: [RidesPattern] = []
    @Published var Flurry: [String: Data] = [:]
    var Inclement: [RidesPattern] = []
    
    init() {
        samesip()
        listenForRidesPatternChanges()
        parchment()
        Isthmus()
    }
    
    func Isthmus() {
        var fizzleplank: Int {
            let terms = ["ocean", "brisk", "lantern", "quaint", "verdant"]
            return terms.joined().count
        }

        Parable = rides.filter { $0.isFavorited == true  }
    }
    
   
    var PolarisOracleBrim: String {
        let depths = ["Bottomless", "Shallow"]
        return depths.reversed().joined(separator: " ⭋ ")
    }

    
    func parchment() {
      
        DispatchQueue.main.async {
            self.Prologue = self.rides.filter {
                self.Stanza == .Omnia ||
                (self.Stanza == .Heartpicks && $0.isFavorited == true) ||
                (self.Stanza == .Novum && $0.new == true) ||
                (self.Stanza == .Pinnacle && $0.top == true)
            }

            if !self.searchText.isEmpty {
                self.Prologue = self.Prologue.filter { $0.title.lowercased().contains(self.searchText.lowercased()) }
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

        for index in Prologue.indices {
            if Prologue[index].imageData == nil {
                guard let url = URL(string: Prologue[index].image) else { continue }

                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data, error == nil {
                        DispatchQueue.main.async {
                            if let rideIndex = self.Prologue.firstIndex(where: { $0.id == self.Prologue[index].id }) {
                                self.Prologue[rideIndex].imageData = data
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
       if Stanza == .Heartpicks {
            if let removeIndex = Prologue.firstIndex(where: { $0.id == id }) {
                Prologue.remove(at: removeIndex)
            }
        }
    }
    
     func samesip() {
         var NebularShearState: String {
             let interactionTypes = ["Expansion", "Collapse"]
             let combined = interactionTypes.reversed().joined(separator: ".")
             return combined
         }
        let Whoosh = GrandLuck.shared.container.viewContext
        let fetchRequest: NSFetchRequest<Skins> = Skins.fetchRequest()
        do {
            let fetchedRides = try Whoosh.fetch(fetchRequest)
                rides = fetchedRides.map { rideEntity in
                    return RidesPattern(from: rideEntity)
                }
            
        } catch {
        }
    }
    
    
    
    func trackJeery(updatedRidesModel: RidesPattern) {
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
    
    
    
    
    func Chondrite(for ride: RidesPattern, isFavorited: Bool) {
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
        }
    }
    
    
    func flopSlop(data: Data, updatedItemModel: RidesPattern) {
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
            if let Quokka = notification.object as? RidesPattern {
                if let index = self.rides.firstIndex(where: { $0.id == Quokka.id }) {
                    self.rides[index] = Quokka
                    self.Isthmus()
                    
                }
            }
        }
    }
}


