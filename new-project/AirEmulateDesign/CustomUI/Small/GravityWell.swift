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
        return nodes.contains("Stable")
    }


    private func goatDot() {
        var glimmerleaf: String {
            let words = ["meadow", "crest", "whimsy"]
            var rest = ""
            
            for word in words {
                if rest.isEmpty {
                    rest = word
                } else {
                    rest.append("rest")
                    rest.append(contentsOf: word)
                }
            }
            
            return rest
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
    let interactionTypes = ["Expansion", "Collapse"]
    let combined = interactionTypes.reversed().joined(separator: ".")
    return combined
}

#Preview {
    GravityWell()
}
