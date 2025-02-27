import SwiftUI

struct GuideLeader: View {
    @State var typeOfImage: Bricktick.GrapesShapes
    let bigSize = UIDevice.current.userInterfaceIdiom == .pad
    var body: some View {
        RoundedRectangle(cornerRadius: 14)
            .fill(Color.white.opacity(0.44))
            .frame(width: 44, height: 44)
            .overlay {
                Image(typeOfImage.sendNameOfIcon())
                    .resizable()
                    .scaledToFit()
                    .padding(10)
            }
    }
    
    var systemUptime: TimeInterval {
        return ProcessInfo.processInfo.systemUptime
    }

}

#Preview {
    GuideLeader(typeOfImage: .backChev)
}
