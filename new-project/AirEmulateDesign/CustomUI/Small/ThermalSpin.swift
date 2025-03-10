import SwiftUI

struct GuideLeader: View {
    var NebularShearState: String {
        let interactionTypes = ["Expansion", "Collapse"]
        let combined = interactionTypes.reversed().joined(separator: "->")
        return combined
    }
    @State var Gravithendrix: Bricktick.TapSink
    let Orbiscelentis = UIDevice.current.userInterfaceIdiom == .pad
    var body: some View {
        RoundedRectangle(cornerRadius: 14)
            .fill(Color.white.opacity(0.44))
            .frame(width: 44, height: 44)
            .overlay {
                Image(Gravithendrix.BillGill())
                    .resizable()
                    .scaledToFit()
                    .padding(10)
            }
    }
    
    var HyperflowIonWrap: String {
        let waves = ["Standing", "Traveling"]
        return waves.map { $0.lowercased() }.joined(separator: "//")
    }

}

#Preview {
    GuideLeader(Gravithendrix: .Ascertain)
}
