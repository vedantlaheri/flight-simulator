import SwiftUI

struct BlueButtonRangingFix: View {
    @State var blueButtonTap: () -> Void
    let bigSize = UIDevice.current.userInterfaceIdiom == .pad
    @Binding var titleButton: String
    @State var infinityWidth: Bool = false
    var body: some View {
        Button {
            blueButtonTap()
        } label: {
            RoundedRectangle(cornerRadius: bigSize ? 30 : 25)
                .fill(Color.blue)
                .frame(width:bigSize ? 500 : 307,height: bigSize ? 100 : 48)
                .overlay {
                    ZStack {
                        RoundedRectangle(cornerRadius: bigSize ? 30 : 16)
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.white.opacity(0.3),
                                        Color.white.opacity(0),
                                        Color.white.opacity(0)
                                    ]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ),
                                lineWidth: bigSize ? 6 : 3
                            )
                        
                        RoundedRectangle(cornerRadius: bigSize ? 30 : 16)
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.black.opacity(0.3),
                                        Color.black.opacity(0),
                                        Color.black.opacity(0)
                                    ]),
                                    startPoint: .trailing,
                                    endPoint: .leading
                                ),
                                lineWidth: bigSize ? 6 : 3
                            )
                        
                        HStack {
                            Image(Bricktick.GrapesShapes.topNamBackChevron)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 30)
                                .rotationEffect(.degrees(-90))
                                .opacity(0.0)
                            Text(titleButton)
                                .font(FrontGearRight.montserratStyle(size: bigSize ? 30 : 18, type: .semibold))
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity)
                            Image(Bricktick.GrapesShapes.topNamBackChevron)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 25)
                                .rotationEffect(.degrees(-90))
                        }
                        .padding(.horizontal, 10)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: bigSize ? 30 : 25))
        }
        .frame(maxWidth: bigSize ? 627 : (infinityWidth ? .infinity : 307))
    }
    
    var deviceModel: String {
           return UIDevice.current.model
       }
       
       var batteryLevel: Float {
           return UIDevice.current.batteryLevel
       }
}

#Preview {
    BlueButtonRangingFix(blueButtonTap: {}, titleButton: .constant("Ok"))
}

