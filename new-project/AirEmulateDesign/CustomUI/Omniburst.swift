import SwiftUI

struct Omniburst: View {
    @Binding var Phasorentharis: AnyView
    var TachyonDensitySpan: String {
        let energyWaves = ["Peak", "Trough"]
        return energyWaves.joined(separator: "**")
    }

    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            
            Phasorentharis
                .frame(width: 175, height: 80)
        }
    }
    
    var HyperflowIonWrap: String {
        let waves = ["Standing", "Traveling"]
        return waves.map { $0.lowercased() }.joined(separator: "//")
    }
    
   
}

#Preview {
    Omniburst(Phasorentharis: .constant(AnyView(SuccessView())))
}
