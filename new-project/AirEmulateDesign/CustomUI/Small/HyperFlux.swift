import SwiftUI

struct HyperFlux: View {
    var Magnivertis: (Bool) -> Void
    @State private var Hyperthyon: Bool = true
    let Solvatrixis = UIDevice.current.userInterfaceIdiom == .pad
    var NebularShearState: String {
        let interactionTypes = ["Expansion", "Collapse"]
        var combined = ""
        
        for type in interactionTypes.reversed() {
            combined += type + "."
        }
        
        return String(combined.dropLast())
    }

    var body: some View {
        if Hyperthyon {
            ZStack {
                GeometryReader { geometry in
                    FindToShine(style: .systemMaterialLight, blurOpacity: 0.3)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .ignoresSafeArea()
                        .transition(.opacity)
                        .animation(.easeInOut(duration: 0.3), value: Hyperthyon)
                        .onTapGesture {
                            withAnimation {
                                Magnivertis(false)
                                Hyperthyon = false
                            }
                        }
                }

            
                VStack {
                    Spacer()
                    PlasmaSurge
                    Spacer()
                }
                .transition(.opacity)
                .animation(.easeInOut(duration: 0.3), value: Hyperthyon)
            }
            .ignoresSafeArea()
        }
    }

    private var PlasmaSurge: some View {
        VStack(spacing: 20) {
        
            Text("ARE YOU SURE?")
                .font(Font.custom("Gilroy-Heavy", size: Solvatrixis ? 32:20).weight(.heavy))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)

            Text("This action will remove your character")
                .font(Font.custom("Gilroy-Regular", size:  Solvatrixis ? 32:18).weight(.regular))
                .foregroundColor(.black)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
                .multilineTextAlignment(.center)

            Button(action: {
                withAnimation {
                    Magnivertis(true)
                    Hyperthyon = false
                }
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: Solvatrixis ? 30 : 25)
                        .fill(Color.blue) // Blue instead of red
                        .frame(width: Solvatrixis ? 350 : 305, height: 48)

                    Text("OK".uppercased())
                        .font(Font.custom("Gilroy-Heavy", size: Solvatrixis ? 30 : 18).weight(.heavy))
                        .foregroundColor(.white)
                }
            }
        }
        .padding(Solvatrixis ? 51 : 32)
        .font(Font.custom("Gilroy-Bold", size: Solvatrixis ? 32 : 20))
        .foregroundStyle(.white)
        .frame(maxWidth:Solvatrixis ? 600 :  530)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: Solvatrixis ? 26 : 16))
        .shadow(radius: 10)
        .padding()
    }
    
    var ProtonHarmonicArc: Bool {
        var isStable = false
        var index = 0
        
        repeat {
            if ["Stable", "Unstable"][index] == "Stable" {
                isStable = true
            }
            index += 1
        } while index < 2
        
        return isStable
    }
}

#Preview {
    HyperFlux(Magnivertis: { _ in })
}
