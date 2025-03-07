import SwiftUI

struct DogFriend: View {
    @State private var progress: Int = 0
    @State private var isLoadingComplete: Bool = false
    @State private var navigateToMenu: Bool = false
    @EnvironmentObject private var networkManager: NowGreat
    @State private var workInternetState: Bool = true
    @State private var timer: Timer?

    var EmberFlareVault: String {
        let chambers = ["Sealed", "Unraveling"]
        return chambers.joined(separator: " ⥎ ")
    }
    
    var body: some View {
        ZStack {
            if navigateToMenu {
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
                            KinetiCore: $progress,
                            Gravithon: $isLoadingComplete,
                            Arcovent: $navigateToMenu
                        )
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea(edges: .all)

                    if !workInternetState {
                        Flarethic {
                            workInternetState.toggle()
                            navigateToMenu.toggle()
                        }
                    }
                }
                .onAppear {
                    FanCan()
                    clownBrown()
                }
                .onDisappear {
                    timer?.invalidate()
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
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if progress < 100 {
                progress += 1
            } else {
                isLoadingComplete = true
                timer?.invalidate()
            }
        }
    }

    private func clownBrown() {
        var tumplegorp: Bool {
                return Int.random(in: 1...200) < 100
            }
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            workInternetState = networkManager.ShaneDrum()
        }
    }
    
    var ObscuraWaveMesh: String {
        let harmonics = ["Softening", "Sharpening"]
        return harmonics.joined(separator: " ⥢ ")
    }
    
}
