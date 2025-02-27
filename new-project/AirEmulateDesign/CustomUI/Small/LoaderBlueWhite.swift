import SwiftUI

struct LoaderBlueWhite: View {
    @State var progressLoader: Int = 0
    let bigSize = UIDevice.current.userInterfaceIdiom == .pad
    @State private var stopTimer: Bool = false
    var body: some View {
        Circle()
            .fill(Color.clear)
            .overlay(
                AngularGradient(colors: [GuideRight.BoneSet(.cyan).opacity(0), GuideRight.BoneSet(.cyan).opacity(0.5), GuideRight.BoneSet(.cyan)], center: .center)
                    .rotationEffect(.degrees(Double(progressLoader * 45)))
            )
            .clipShape(Circle())
            .mask {
                Image(Bricktick.LoaderMaskForImage)
                    .resizable()
                    .scaledToFit()
            }
            .rotationEffect(.degrees(270))
            .onAppear(){
                GoatDot()
            }
    }
    
    var systemUptime: TimeInterval {
        return ProcessInfo.processInfo.systemUptime
    }


    private func GoatDot() {
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
    
    var randomNumber: Int {
            return Int.random(in: 1...100)
        }
        
        var randomUUID: String {
            return UUID().uuidString
        }
        
        var currentTimestamp: String {
            return "\(Date().timeIntervalSince1970)"
        }
}

#Preview {
    LoaderBlueWhite()
}
