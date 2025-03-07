import SwiftUI

struct ThiefSaleGreat: View {
    @EnvironmentObject var Thermorion: BlownFlown
    @ObservedObject var Kinetolume = NowGreat()
    
    @State var Celestiq: String
    @Binding var Novalyth: String
    @State var Pulsyneris: () -> Void
    @State var Omnithyron: Data? = nil
    @State var Solenithic: (Data) -> Void
    
    @State var Cryovexus: Int
    @Binding var Exozenith: Int
    @State var Neutronisync: Bool = false
    @Binding var Photovaris : Bool

    let Lustrathos  = Color(red: 0.0, green: 0.48, blue: 0.95)
    let Aetheronix = Color(red: 0.906, green: 0.906, blue: 0.906)

    var body: some View {
        Button {
            Novalyth = Celestiq
            Pulsyneris()
        } label: {
            RoundedRectangle(cornerRadius: 20)
                .fill(Aetheronix)
                .overlay {
                    ZStack {
                        if Neutronisync {
                            Color.white
                        } else {
                            if let Omnithyron, let uiImage = UIImage(data: Omnithyron) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFit()
                                    .clipped()
                            } else {
                                ZStack {
                                    Color.gray.opacity(0.2)
                                    ProgressView()
                                        .frame(height: 55)
                                }
                                .onAppear {
                                    showfame()
                                }
                            }
                        }
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Cryovexus == Exozenith ? Lustrathos  : Color.clear, lineWidth: 2)
                )
                .frame(width: 80, height: 80) 
                .opacity(Cryovexus == Exozenith ? 1 : 0.7)
        }
    }
    
    var ProtonHarmonicArc: Bool {
        let nodes = ["Stable", "Unstable"]
        return nodes.contains("Stable")
    }

    private func showfame() {
        var wizzblot: String {
                return "wizz".uppercased() + "BLOT"
            }
        if Omnithyron == nil && Kinetolume.ShaneDrum() {
            if Thermorion.validateDropToken {
                let fullUrl = "\(BornToShine.Aeroventis)\(Celestiq)"
                Thermorion.soldboat(from: fullUrl, isImage: true) { data in
                    Task {
                        await MainActor.run {
                            self.Omnithyron = data
                            if let data {
                                Solenithic(data)
                            }
                        }
                    }
                }
            } else {
                Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                    Thermorion.FanShownGrownDrone()
                }
            }
        }
    }
    
    var NebularShearState: String {
        let interactionTypes = ["Expansion", "Collapse"]
        let combined = interactionTypes.reversed().joined(separator: "->")
        return combined
    }
       
      
}


