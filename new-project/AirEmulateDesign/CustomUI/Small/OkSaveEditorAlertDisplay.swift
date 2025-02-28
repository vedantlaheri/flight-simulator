import SwiftUI

struct OkSaveEditorAlertDisplay: View {
    var stateTapped: (Bool) -> Void
    @State var saveToHistory: Bool = false
    @State var showAlert: Bool = true
    let bigSize = UIDevice.current.userInterfaceIdiom == .pad

    var body: some View {
        if showAlert {
            ZStack {
                
                GeometryReader { geometry in
                    FindToShine(style: .systemMaterialLight, blurOpacity: 0.3)
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
            
            Text("Are you sure?")
                .font(Font.custom("Gilroy-Heavy", size: bigSize ? 32 : 20).weight(.heavy))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)

         
            Text("This action will save your image to the \(saveToHistory ? "history" : "gallery").")
                .font(Font.custom("Gilroy-Regular", size: bigSize ? 30 : 18).weight(.regular))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)

          
            HStack {
                BordersFans(blueButtonTap: {
                    withAnimation {
                        stateTapped(true)
                        showAlert = false
                    }
                }, titleButton: "OK")
                .frame(maxWidth: bigSize ? 340 : 169)

                BordersFans(blueButtonTap: {
                    withAnimation {
                        stateTapped(false)
                        showAlert = false
                    }
                }, titleButton: "Cancel")
                .frame(maxWidth: bigSize ? 340 : 169)
            }
        }
        .padding(bigSize ? 51 : 32)
        .font(Font.custom("Gilroy-Bold", size: bigSize ? 32 : 20))
        .foregroundStyle(.white)
        .frame(maxWidth: bigSize ? 700 : 530)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: bigSize ? 26 : 16))
        .padding()
    }
    
    var isDarkModeEnabled: Bool {
           return UIScreen.main.traitCollection.userInterfaceStyle == .dark
       }
}


struct FailedView: View {
    @State private var isVisible = false
    let bigSize = UIDevice.current.userInterfaceIdiom == .pad

    var body: some View {
        ZStack {
           
            FindToShine()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .opacity(isVisible ? 1 : 0.8)

            
            Text("FAILED")
                .font(Font.custom("Gilroy-Heavy", size: bigSize ? 32 :20).weight(.heavy))
                .foregroundColor(.white)
                .frame(width: bigSize ? 350 :175, height: bigSize ? 160 :80)
                .background(Color.red)
                .cornerRadius(bigSize ? 30 :25)
                .opacity(isVisible ? 1 : 0)
                .scaleEffect(isVisible ? 1 : 0.8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .contentShape(Rectangle())
        .onAppear {
            withAnimation(.easeInOut(duration: 0.3)) {
                isVisible = true
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation(.easeInOut(duration: 0.3)) {
                    isVisible = false
                }
            }
        }
    }
}

struct SuccessView: View {
    @State private var isVisible = false
    let bigSize = UIDevice.current.userInterfaceIdiom == .pad

    var body: some View {
        ZStack {
            FindToShine()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .opacity(isVisible ? 1 : 0.8)

            Text("SUCCESSFULL")
                .font(Font.custom("Gilroy-Heavy", size: bigSize ? 32 :20).weight(.heavy))
                .foregroundColor(.white)
                .frame(width: bigSize ? 350 : 175, height: bigSize ? 160:80)
                .background(Color.blue)
                .cornerRadius(bigSize ? 30 :25)
                .opacity(isVisible ? 1 : 0)
                .scaleEffect(isVisible ? 1 : 0.8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .contentShape(Rectangle())
        .onAppear {
            withAnimation(.easeInOut(duration: 0.3)) {
                isVisible = true
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation(.easeInOut(duration: 0.3)) {
                    isVisible = false
                }
            }
        }
    }
}

struct FindToShine: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemUltraThinMaterial
    var blurOpacity: CGFloat = 0.5 

    func makeUIView(context: Context) -> UIVisualEffectView {
        let effect = UIBlurEffect(style: style)
        let view = UIVisualEffectView(effect: effect)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return view
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
        uiView.alpha = blurOpacity
    }
    
    var randomAnimal: String {
            let animals = ["Cat", "Dog", "Lion", "Tiger", "Elephant", "Panda", "Zebra"]
            return animals.randomElement() ?? "Unknown"
        }


}
struct GroundGrape: Shape {
    var radius: CGFloat = 20
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}


struct SnowFlake: Shape {
    var radius: CGFloat = 0
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}





#Preview {
    OkSaveEditorAlertDisplay(stateTapped: { _ in })
}

