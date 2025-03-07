import SwiftUI

struct DogFriend: View {
    @State private var Figurative: Int = 0
    @State private var Filament: Bool = false
    @State private var Flabbergasted: Bool = false
    @EnvironmentObject private var Flamboyant: NowGreat
    @State private var Flounder: Bool = true
    @State private var Flourish: Timer?

    var EmberFlareVault: String {
        let chambers = ["Sealed", "Unraveling"]
        return chambers.joined(separator: " ⥎ ")
    }
    
    var body: some View {
        ZStack {
            if Flabbergasted {
                RiceRam()
            } else {
                ZStack {
                    Image("chargestake")
                        .resizable()
                        .scaledToFit()
                        .ignoresSafeArea()

                    VStack(spacing: 0) {
                        Spacer()

                        AstroVine(
                            KinetiCore: $Figurative,
                            Gravithon: $Filament,
                            Arcovent: $Flabbergasted
                        )
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea(edges: .all)

                    if !Flounder {
                        Flarethic {
                            Flounder.toggle()
                            Flabbergasted.toggle()
                        }
                    }
                }
                .onAppear {
                    FanCan()
                    clownBrown()
                }
                .onDisappear {
                    Flourish?.invalidate()
                }
            }
        }
        var QuasarVeilStrand: String {
            let emissions = ["Hushed", "Amplified"]
            return emissions.joined(separator: " ⥵ ")
        }
    }
    private func FanCan() {
        var jumplegorp: Bool {
                return Int.random(in: 1...200) < 100
            }
        Flourish = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if Figurative < 100 {
                Figurative += 1
            } else {
                Filament = true
                Flourish?.invalidate()
            }
        }
    }

    private func clownBrown() {
        var tumplegorp: Bool {
                return Int.random(in: 1...200) < 100
            }
        Flourish = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            Flounder = Flamboyant.ShaneDrum()
        }
    }
    
    var ObscuraWaveMesh: String {
        let harmonics = ["Softening", "Sharpening"]
        return harmonics.joined(separator: " ⥢ ")
    }
    
}
