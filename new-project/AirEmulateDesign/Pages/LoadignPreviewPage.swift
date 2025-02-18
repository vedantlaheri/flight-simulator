import SwiftUI

struct LoadignPreviewPage: View {
    @State private var progress: Int = 0
    @State private var isLoadingComplete: Bool = false
    @State private var navigateToMenu: Bool = false
    @EnvironmentObject private var networkManager: NetworkManaged
    @State private var workInternetState: Bool = true
    @State private var timer: Timer?

    var body: some View {
        ZStack {
            if navigateToMenu {
                MenuNameList()
            } else {
                ZStack {
                    Image("planeloader")
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
                    startLoading()
                    monitorInternetConnectivity()
                }
                .onDisappear {
                    timer?.invalidate()
                }
            }
        }
    }
    private func startLoading() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if progress < 100 {
                progress += 10
            } else {
                isLoadingComplete = true
                timer?.invalidate()
            }
        }
    }

    private func monitorInternetConnectivity() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            workInternetState = networkManager.checkInternetConnectivity_SimulatorFarm()
        }
    }
}
