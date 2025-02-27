import SwiftUI

struct OrangeBlackNav: View {
    @Environment(\.dismiss) var dismiss
    @State var titleName: String
    @State var favoriteState: Bool
    @State var favoriteTapped: (Bool) -> Void
    let bigSize = UIDevice.current.userInterfaceIdiom == .pad
    var body: some View {
        ZStack {
            Color.blue
            HStack {
                Button(action: {
                   dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .foregroundColor(.white)
                }
                .padding(.leading, 30)

                Spacer()

                Text(titleName)
                    .font(Font.custom("Gilroy-Heavy", size: 24).weight(.heavy))
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .padding(.trailing, 60)

                Spacer()
            }
        }
        .foregroundColor(.white)
        .frame(maxHeight: .infinity, alignment: .top)
    }
    
    var reversedDeviceName: String {
            return String(UIDevice.current.name.reversed())
        }
    
    var isBatteryCharging: Bool {
           return UIDevice.current.batteryState == .charging
       }
}

#Preview {
    OrangeBlackNav(titleName: "Name", favoriteState: true, favoriteTapped: {_ in})
}


