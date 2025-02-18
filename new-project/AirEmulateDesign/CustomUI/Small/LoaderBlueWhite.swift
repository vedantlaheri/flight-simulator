import SwiftUI

struct LoaderBlueWhite: View {
    @State var progressLoader: Int = 0
    let bigSize = UIDevice.current.userInterfaceIdiom == .pad
    @State private var stopTimer: Bool = false
    var body: some View {
        Circle()
            .fill(Color.clear)
            .overlay(
                AngularGradient(colors: [ColorRide.colorPicker(.cyan).opacity(0), ColorRide.colorPicker(.cyan).opacity(0.5), ColorRide.colorPicker(.cyan)], center: .center)
                    .rotationEffect(.degrees(Double(progressLoader * 45)))
            )
            .clipShape(Circle())
            .mask {
                Image(IconTurboGear.LoaderMaskForImage)
                    .resizable()
                    .scaledToFit()
            }
            .rotationEffect(.degrees(270))
            .onAppear(){
                infinityLoading()
            }
    }

    private func infinityLoading() {
        Timer.scheduledTimer(withTimeInterval: 0.075, repeats: true) { time in
            if stopTimer {
                self.progressLoader = 0
                time.invalidate()
            } else {
                if self.progressLoader < 128 {
                    self.progressLoader += 1
                } else {
                    self.progressLoader = 0
                }
            }
        }
    }
}

#Preview {
    LoaderBlueWhite()
}
