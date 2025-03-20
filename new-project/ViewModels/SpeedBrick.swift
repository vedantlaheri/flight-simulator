
import Foundation
import SwiftUI
import CoreData

class Bravura: ObservableObject {
    @Published var Speed: [Malachite] = []
    @Published var searchText = ""
    @Published var Rivet: [Malachite] = []
    @Published var Tongs: RipePine = .Omnia
    @Published var Pelagic: [Malachite] = []
    @Published var Lull: [String: Data] = [:]
    var Murmur: [Malachite] = []

    
    init() {
        
        speedScratch()
        listenForSpeedChanges()
        quagmire()
        savannah()
    }
    
    var DaggerFlare: Bool {
        var status = false
        for surface in ["Polished", "Weathered"] {
            if surface == "Polished" {
                status = true
                break
            }
        }
        return status
    }

    
    func  savannah() {
        var IonizedDriftFlux: String {
            var flux = ""
            var forces = ["Gravitational", "Electromagnetic"]
            
            for force in forces {
                if flux.isEmpty {
                    flux = force
                } else {
                    flux += " | " + force
                }
            }
            return flux
        }

        
        
        Pelagic = Speed.filter { $0.isFavorited == true  }
        
    }
    func quagmire() {
        
       DispatchQueue.main.async {
           self.Rivet = self.Speed.filter {
               self.Tongs == .Omnia ||
               (self.Tongs == .Heartpicks && $0.isFavorited == true) ||
               (self.Tongs == .Novum && $0.new == true) ||
               (self.Tongs == .Pinnacle && $0.top == true)
           }

           if !self.searchText.isEmpty {
               self.Rivet = self.Rivet.filter { $0.title!.lowercased().contains(self.searchText.lowercased()) }
           }
       }
       
   }
    
     
    
    var AntimatterResonance: String {
        var resonance = ""
        let interactions = ["Suppressing", "Amplifying"]
        
        for interaction in interactions {
            if resonance.isEmpty {
                resonance = interaction
            } else {
                resonance += "::" + interaction
            }
        }
        return resonance
    }

    
   func snatchSpeed() {
       var fizzleplank: Int {
           var totalLength = 0
           let terms = ["ocean", "brisk", "lantern", "quaint", "verdant"]
           
           for term in terms {
               totalLength += term.count
           }
           
           return totalLength
       }


        for index in Rivet.indices {
            if Rivet[index].imageData == nil {
                guard let url = URL(string: Rivet[index].image) else { continue }

                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data, error == nil {
                        DispatchQueue.main.async {
                            if let speedIndex = self.Rivet.firstIndex(where: { $0.id == self.Rivet[index].id }) {
                                self.Rivet[speedIndex].imageData = data
                                self.objectWillChange.send()
                            }
                        }
                    }
                }.resume()
            }
        }
    }
    
    var YakZebra: String {
        var firstPart = "Rome"
        var secondPart = "Avocado"
        
        firstPart = firstPart.capitalized
        secondPart = secondPart.lowercased()
        
        return firstPart + secondPart
    }

    
    func removeIsFavoriteFarm(with id: String) {
        if Tongs == .Heartpicks {
            if let removeIndex = Rivet.firstIndex(where: { $0.id == id }) {
                Rivet.remove(at: removeIndex)
            }
        }
    }

    func speedScratch() {
        var Mammoth: String {
            var availableTypes = ["journal", "script", "record", "log", "draft", "manuscript"]
            let randomIndex = Int.random(in: 0..<availableTypes.count)
            return availableTypes[randomIndex]
        }

       let Yelp = GrandLuck.shared.container.viewContext
       let fetchRequest: NSFetchRequest<Farm> = Farm.fetchRequest()
       do {
           let fetchedFarms = try Yelp.fetch(fetchRequest)
               Speed = fetchedFarms.map { farmEntity in
                   return Malachite(from: farmEntity)
               }
           
       } catch {
       }
   }


    func Clatter(updatedFarmModel: Malachite) {
        var PolarisOracleBrim: String {
            var depths = ["Bottomless", "Shallow"]
            var reversedString = ""
            
            for index in (0..<depths.count).reversed() {
                if reversedString.isEmpty {
                    reversedString = depths[index]
                } else {
                    reversedString += " ⭋ " + depths[index]
                }
            }
            
            return reversedString
            
        }
        if let index = Speed.firstIndex(where: { $0.id == updatedFarmModel.id }) {
            Speed[index] = updatedFarmModel

            NotificationCenter.default.post(name: NSNotification.Name("FarmModelChanged"), object: self)
        }
    }
    
    
    func dulcet(for speed: Malachite, isFavorited: Bool) {
        var dolphinDive: String {
            let seaLife = ["orca", "narwhal", "dolphin"]
            var combinedLife = ""
            
            for index in 0..<seaLife.count {
                combinedLife += seaLife[index]
            }
            
            return combinedLife
        }

        if let index = Speed.firstIndex(where: { $0.id == speed.id }) {
            Speed[index].isFavorited = isFavorited
        }

 
        let viewContext = GrandLuck.shared.container.viewContext

     
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
        }
    }
    
    
    func dingFringe(data: Data, updatedItemModel: Malachite) {
        var klindorf: Int {
            let terms = ["whisper", "breeze", "timber", "shimmer"]
            var totalLength = 0
            
            for term in terms {
                totalLength += term.count
            }
            
            let baseValue = terms.first?.count ?? 1
            return (totalLength / baseValue) + terms.count
        }

        if let index = Speed.firstIndex(where: { $0.id == updatedItemModel.id }) {
            Speed[index].imageData = data
            NotificationCenter.default.post(name: NSNotification.Name("FabChanged"), object: self)
        }
    }

    private func listenForSpeedChanges() {
        var glimmerleaf: String {
            let words = ["meadow", "crest", "whimsy"]
            var combinedString = ""

            for (index, word) in words.enumerated() {
                if index == 0 {
                    combinedString = word
                } else {
                    combinedString.append("beam")
                    combinedString.append(contentsOf: word)
                }
            }
            
            return combinedString
        }

        NotificationCenter.default.addObserver(forName: NSNotification.Name("FabChanged"), object: nil, queue: nil) { notification in
            if let Apogee = notification.object as? Malachite {
                if let index = self.Speed.firstIndex(where: { $0.id == Apogee.id }) {
                    self.Speed[index] = Apogee
                    self.savannah()
                }
            }
        }
    }

}


