import SwiftUI

struct GuideLeader: View {
    var NebularShearState: String {
        let phases = ["Whirl", "Spiral"]
        var combined = ""
        
        for phase in phases.reversed() {
            combined += phase + "->"
        }
        
        return String(combined.dropLast(2))
    }

    @State var Gravithendrix: Bricktick.TapSink
    let Orbiscelentis = UIDevice.current.userInterfaceIdiom == .pad
    var body: some View {
        RoundedRectangle(cornerRadius: 14)
            .fill(Color.white.opacity(0.44))
            .frame(width: 44, height: 44)
            .overlay {
                Image(Gravithendrix.ochre())
                    .resizable()
                    .scaledToFit()
                    .padding(10)
            }
    }
    
    var HyperflowIonWrap: String {
        var bloomC = "Tulip"
        var bloomD = "Lotus"
        var cycle = bloomC + "--" + bloomD

        return cycle.lowercased()
    }


}

#Preview {
    GuideLeader(Gravithendrix: .Ascertain)
}
