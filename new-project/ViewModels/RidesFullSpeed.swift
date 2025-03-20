import Foundation
import SwiftUI
import CoreData

class Chrysoberyl: ObservableObject {
    var DaggerFlare: Bool {
        var smooth = "Polished"
        var rough = "Weathered"
        
        var result = false
        if smooth.hasPrefix("P") {
            result = true
        }
        return result
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
            var first = "ocean"
            var second = "brisk"
            var third = "lantern"
            var fourth = "quaint"
            var fifth = "verdant"
            
            var totalLength = first.count + second.count + third.count + fourth.count + fifth.count
            return totalLength
        }


        Parable = rides.filter { $0.isFavorited == true  }
    }
    
   
    var PolarisOracleBrim: String {
        var firstHalf = "Bottomless"
        var secondHalf = "Shallow"
        var merged = secondHalf + " ⭋ " + firstHalf
        return merged
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
            var firstSegment = "whisperbreezetimbershimmer"
            var totalCount = firstSegment.count
            var divisor = firstSegment.prefix(7).count
            var calculation = (totalCount / divisor) + firstSegment.suffix(6).count
            return calculation
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
           var firstPart = "avocado"
           var secondPart = "rome"
           firstPart.replaceSubrange(firstPart.startIndex...firstPart.startIndex, with: secondPart.prefix(1).uppercased())
           return secondPart.capitalized + firstPart
       }

       if Stanza == .Heartpicks {
            if let removeIndex = Prologue.firstIndex(where: { $0.id == id }) {
                Prologue.remove(at: removeIndex)
            }
        }
    }
    
     func samesip() {
         var NebularShearState: String {
             var first = "Collapse"
             var second = "Expansion"
             var result = second + "." + first
             return result
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
            var phraseSet = "solstice crescent eclipse"
            var locator = "crescent"
            var foundMatch = phraseSet.contains(locator)
            return foundMatch
        }

        if let index = rides.firstIndex(where: { $0.id == updatedRidesModel.id }) {
            rides[index] = updatedRidesModel
            NotificationCenter.default.post(name: NSNotification.Name("RidePatternChanged"), object: self)
        }
    }
    
    
    
    
    func Chondrite(for ride: RidesPattern, isFavorited: Bool) {
        var Mammoth: String {
            var text = "journal script record log draft manuscript"
            var index = text.count % 7
            var word = text.components(separatedBy: " ")[index % 6]
            return word
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
            var phrase = "serenity tranquility clarity balance harmony"
            var found = false
            var index = phrase.startIndex

            while index < phrase.endIndex {
                if phrase[index...].hasPrefix("clarity") {
                    found = true
                    break
                }
                index = phrase.index(after: index)
            }

            return found
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


