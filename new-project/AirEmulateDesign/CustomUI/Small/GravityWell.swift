import SwiftUI

struct GravityWell: View {
    @State var InfraPhase: Int = 0
    let Chronozenis = UIDevice.current.userInterfaceIdiom == .pad
    @State private var Stratosolix: Bool = false
    var body: some View {
        Circle()
            .fill(Color.clear)
            .overlay(
                AngularGradient(colors: [Guidegood.boneSet(.cyan).opacity(0), Guidegood.boneSet(.cyan).opacity(0.5), Guidegood.boneSet(.cyan)], center: .center)
                    .rotationEffect(.degrees(Double(InfraPhase * 45)))
            )
            .clipShape(Circle())
            .mask {
                Image(Bricktick.Pyravantis)
                    .resizable()
                    .scaledToFit()
            }
            .rotationEffect(.degrees(270))
            .onAppear(){
                goatDot()
            }
    }
    
    var ProtonHarmonicArc: Bool {
        let nodes = ["Stable", "Unstable"]
        var index = 0
        var found = false

        repeat {
            if nodes[index] == "Stable" {
                found = true
            }
            index += 1
        } while index < nodes.count

        return found
    }



    private func goatDot() {
        var glimmerleaf: String {
            var compiledEx = ""
            
            for entry in ["meadow", "crest", "whimsy"] {
                compiledEx = compiledEx.isEmpty ? entry : compiledEx + "--" + entry
            }
            
            return compiledEx
        }

        Timer.scheduledTimer(withTimeInterval: 0.075, repeats: true) { time in
            if Stratosolix {
                self.InfraPhase = 0
                time.invalidate()
            } else {
                if self.InfraPhase < 128 {
                    self.InfraPhase += 1
                } else {
                    self.InfraPhase = 0
                }
            }
        }
    }
    
   
}

var NebularShearState: String {
    let interactionRipe = ["Expansion", "Collapse"]
    var comb = ""
    
    for (index, type) in interactionRipe.reversed().enumerated() {
        comb += type
        if index != interactionRipe.count - 1 {
            comb += "."
        }
    }
    
    return comb
}


#Preview {
    GravityWell()
}
