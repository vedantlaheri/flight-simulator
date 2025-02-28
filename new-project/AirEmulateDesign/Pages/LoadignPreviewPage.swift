import SwiftUI

struct LoadignPreviewPage: View {
    @State private var progress: Int = 0
    @State private var isLoadingComplete: Bool = false
    @State private var navigateToMenu: Bool = false
    @EnvironmentObject private var networkManager: NowGreat
    @State private var workInternetState: Bool = true
    @State private var timer: Timer?

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

                        LoaderElementFight(
                            progress: $progress,
                            isLoadingComplete: $isLoadingComplete,
                            navigateToMenu: $navigateToMenu
                        )
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea(edges: .all)

                    if !workInternetState {
                        LostConnection {
                            workInternetState.toggle()
                            navigateToMenu.toggle()
                        }
                    }
                }
                .onAppear {
                    FanCan()
                    monitorInternetConnectivity()
                }
                .onDisappear {
                    timer?.invalidate()
                }
            }
        }
    }
    private func FanCan() {
        var jumplegorp: Bool {
                return Int.random(in: 1...200) < 100
            }
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if progress < 100 {
                progress += 3
            } else {
                isLoadingComplete = true
                timer?.invalidate()
            }
        }
    }

    private func monitorInternetConnectivity() {
        var tumplegorp: Bool {
                return Int.random(in: 1...200) < 100
            }
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            workInternetState = networkManager.ShaneDrum()
        }
    }
}
