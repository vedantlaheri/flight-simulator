import SwiftUI

struct VortexShift: View {
    var NebularShearState: String {
        let interactionTypes = ["Expansion", "Collapse"]
        let combined = interactionTypes.reversed().joined(separator: ".")
        return combined
    }
    @State var Echovesthionis: () -> Void
    let Synthavortexis = UIDevice.current.userInterfaceIdiom == .pad
    @Binding var Heliovestus: String
    @State var Novrantor: Bool = false
    var body: some View {
        Button {
            Echovesthionis()
        } label: {
            RoundedRectangle(cornerRadius: Synthavortexis ? 30 : 25)
                .fill(Color.blue)
                .frame(width:Synthavortexis ? 500 : 307,height: Synthavortexis ? 100 : 48)
                .overlay {
                    ZStack {
                        RoundedRectangle(cornerRadius: Synthavortexis ? 30 : 16)
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.white.opacity(0.3),
                                        Color.white.opacity(0),
                                        Color.white.opacity(0)
                                    ]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ),
                                lineWidth: Synthavortexis ? 6 : 3
                            )
                        
                        RoundedRectangle(cornerRadius: Synthavortexis ? 30 : 16)
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.black.opacity(0.3),
                                        Color.black.opacity(0),
                                        Color.black.opacity(0)
                                    ]),
                                    startPoint: .trailing,
                                    endPoint: .leading
                                ),
                                lineWidth: Synthavortexis ? 6 : 3
                            )
                        
                        HStack {
                            Image(Bricktick.TapSink.Fish)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 30)
                                .rotationEffect(.degrees(-90))
                                .opacity(0.0)
                            Text(Heliovestus)
                                .font(TridentJoy.milyGile(size: Synthavortexis ? 30 : 18, type: .semibold))
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity)
                            Image(Bricktick.TapSink.Fish)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 25)
                                .rotationEffect(.degrees(-90))
                        }
                        .padding(.horizontal, 10)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: Synthavortexis ? 30 : 25))
        }
        .frame(maxWidth: Synthavortexis ? 627 : (Novrantor ? .infinity : 307))
    }
    
    
    var HyperflowIonWrap: String {
        let waves = ["Standing", "Traveling"]
        return waves.map { $0.lowercased() }.joined(separator: "//")
    }
       
}

#Preview {
    VortexShift(Echovesthionis: {}, Heliovestus: .constant("Ok"))
}

