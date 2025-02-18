import SwiftUI

struct FixDeleteItemAlertCompletion: View {
    var stateTapped: (Bool) -> Void
    @State private var showAlert: Bool = true
    let bigSize = UIDevice.current.userInterfaceIdiom == .pad

    var body: some View {
        if showAlert {
            ZStack {
                GeometryReader { geometry in
                    VisualEffectBlur(style: .systemMaterialLight, blurOpacity: 0.3)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .ignoresSafeArea()
                        .transition(.opacity)
                        .animation(.easeInOut(duration: 0.3), value: showAlert)
                        .onTapGesture {
                            withAnimation {
                                stateTapped(false)
                                showAlert = false
                            }
                        }
                }

            
                VStack {
                    Spacer()
                    alertContent
                    Spacer()
                }
                .transition(.opacity)
                .animation(.easeInOut(duration: 0.3), value: showAlert)
            }
            .ignoresSafeArea()
        }
    }

    private var alertContent: some View {
        VStack(spacing: 20) {
        
            Text("ARE YOU SURE?")
                .font(Font.custom("Gilroy-Heavy", size: bigSize ? 32:20).weight(.heavy))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)

            Text("This action will remove your character")
                .font(Font.custom("Gilroy-Regular", size:  bigSize ? 32:18).weight(.regular))
                .foregroundColor(.black)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
                .multilineTextAlignment(.center)

            Button(action: {
                withAnimation {
                    stateTapped(true)
                    showAlert = false
                }
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: bigSize ? 30 : 25)
                        .fill(Color.blue) // Blue instead of red
                        .frame(width: bigSize ? 350 : 305, height: 48)

                    Text("OK".uppercased())
                        .font(Font.custom("Gilroy-Heavy", size: bigSize ? 30 : 18).weight(.heavy))
                        .foregroundColor(.white)
                }
            }
        }
        .padding(bigSize ? 51 : 32)
        .font(Font.custom("Gilroy-Bold", size: bigSize ? 32 : 20))
        .foregroundStyle(.white)
        .frame(maxWidth:bigSize ? 600 :  530)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: bigSize ? 26 : 16))
        .shadow(radius: 10)
        .padding()
    }
}

#Preview {
    FixDeleteItemAlertCompletion(stateTapped: { _ in })
}
