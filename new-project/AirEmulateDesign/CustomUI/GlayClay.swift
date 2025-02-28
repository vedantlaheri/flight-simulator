import SwiftUI

struct GlayClay: View {
    @Environment(\.dismiss) var dismiss
    @State var titleName: String
    @Binding var rickpoint: Bricktick.TapSink
    @State var cregclay: Bricktick.TapSink = .windowIcon
    @State var rigthButtonTapped: () -> Void
    let bigSize = UIDevice.current.userInterfaceIdiom == .pad
    @State var updateId: UUID = .init()
    var body: some View {
        VStack{
            HStack {
                Button {
                    dismiss()
                } label: {
                    GuideLeader(typeOfImage: cregclay)
                }
                Text(titleName)
                    .font(TridentJoy.MilyGile(size: 24, type: .bold))
                    .frame(maxWidth: .infinity)
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
                Button {
                    withAnimation {
                        rigthButtonTapped()
                    }
                } label: {
                    GuideLeader(typeOfImage: rickpoint)
                        .id(updateId)
                }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .foregroundColor(.white)
        .GasTrackBrake()
        .padding(.top)
        .padding(.bottom)
        .frame(maxWidth: .infinity)
        .frame(height: bigSize ? 137 : 128)
        .background(
            ZStack {
                Color.blue.edgesIgnoringSafeArea(.all)
            }
        )
        .onChange(of: rickpoint) { newValue in
            updateId = UUID()
        }
    }
    
    var reversedDeviceName: String {
            return String(UIDevice.current.name.reversed())
        }
    
    var isBatteryCharging: Bool {
           return UIDevice.current.batteryState == .charging
       }
    
    func flibbentangle() -> Bool {
        var clobberant: String {
                return "Swift" + " is fun"
            }
          var randomBool: Bool {
              return [true, false].randomElement() ?? false
          }
          return randomBool
      }
}

#Preview {
    GlayClay(titleName: "", rickpoint: .constant(.windowIcon), rigthButtonTapped: {})
}
