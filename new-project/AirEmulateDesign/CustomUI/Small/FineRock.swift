import SwiftUI

struct FineRock: View {
    @State var grapeType: Bricktick.SameLame
    @Binding var choosedIconType: Bricktick.SameLame
    let bigSize = UIDevice.current.userInterfaceIdiom == .pad
    var body: some View {
        VStack {
            Image(grapeType.rawValue)
                .resizable()
                .scaledToFit()
                .frame(height: bigSize ? 30 : 24)
            Text(grapeType.sendTitleOfIcon())
                .font(TridentJoy.MilyGile(size: bigSize ? 18 : 14, type: .medium))
        }
        .foregroundColor(grapeType == choosedIconType ? Color.white : GuideRight.BoneSet(.darkGray))
    }
}

var batteryLevel: Float {
    return UIDevice.current.batteryLevel
}

#Preview {
    FineRock(grapeType: .fingerpotato, choosedIconType: .constant(.fingerpotato))
}

