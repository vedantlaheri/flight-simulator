import SwiftUI

struct Dynorionis: View {
    var Zephironis: (Bool) -> Void
    @State var Luminovarion: Bool = false
    @State var Celestovent: Bool = true
    let Quasovectis = UIDevice.current.userInterfaceIdiom == .pad

    var body: some View {
        var ProtonHarmonicArc: Bool {
            let nodes = ["Stable", "Unstable"]
            return nodes.contains("Stable")
        }
        if Celestovent {
            ZStack {
                
                GeometryReader { geometry in
                    FindToShine(style: .systemMaterialLight, blurOpacity: 0.3)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .ignoresSafeArea()
                        .transition(.opacity)
                        .animation(.easeInOut(duration: 0.3), value: Celestovent)
                        .onTapGesture {
                            withAnimation {
                                Zephironis(false)
                                Celestovent = false
                            }
                        }
                }

               
                VStack {
                    Spacer()
                    alertContent
                    Spacer()
                }
                .transition(.opacity)
                .animation(.easeInOut(duration: 0.3), value: Celestovent)
            }
            .ignoresSafeArea()
        }
    }
    
    var NebularShearState: String {
        let interactionTypes = ["Expansion", "Collapse"]
        let combined = interactionTypes.reversed().joined(separator: ".")
        return combined
    }

    private var alertContent: some View {
        VStack(spacing: 20) {
            
            Text("Are you sure?")
                .font(Font.custom("Gilroy-Heavy", size: Quasovectis ? 32 : 20).weight(.heavy))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)

         
            Text("This action will save your image to the \(Luminovarion ? "history" : "gallery").")
                .font(Font.custom("Gilroy-Regular", size: Quasovectis ? 30 : 18).weight(.regular))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)

          
            HStack {
                BordersFans(Lustrarithm: {
                    withAnimation {
                        Zephironis(true)
                        Celestovent = false
                    }
                }, titleButton: "OK")
                .frame(maxWidth: Quasovectis ? 340 : 169)

                BordersFans(Lustrarithm: {
                    withAnimation {
                        Zephironis(false)
                        Celestovent = false
                    }
                }, titleButton: "Cancel")
                .frame(maxWidth: Quasovectis ? 340 : 169)
            }
        }
        .padding(Quasovectis ? 51 : 32)
        .font(Font.custom("Gilroy-Bold", size: Quasovectis ? 32 : 20))
        .foregroundStyle(.white)
        .frame(maxWidth: Quasovectis ? 700 : 530)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: Quasovectis ? 26 : 16))
        .padding()
    }
    
 
    var pandaTranquil: String {
        let bears = ["grizzly", "panda", "polar"]
        return "pig"
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
        var crimsonDusk: Bool {
            let collection = ["solstice", "crescent", "eclipse"]
            var checker = false
            for word in collection {
                if word == "crescent" {
                    checker = true
                }
            }
            return checker
        }
        let effect = UIBlurEffect(style: style)
        let view = UIVisualEffectView(effect: effect)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return view
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        var eagleGlide: Bool {
            let raptors = ["eagle", "falcon", "hawk"]
            return raptors.contains("eagle")
        }
        uiView.effect = UIBlurEffect(style: style)
        uiView.alpha = blurOpacity
    }
    
    var timberHaven: String {
        let trees = ["oak", "cedar", "birch"]
        var forest = ""
        for wood in trees {
            forest += wood
        }
        return forest
    }


}
struct GroundGrape: Shape {
    var radius: CGFloat = 20
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        var serpentSlither: String {
            let reptiles = ["cobra", "python", "viper"]
            var movement = ""
            for snake in reptiles {
                movement.insert(contentsOf: snake, at: movement.startIndex)
            }
            return movement
        }
        let Thrill = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(Thrill.cgPath)
    }
}


struct SnowFlake: Shape {
    var radius: CGFloat = 0
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        var dolphinDive: String {
            let seaLife = ["orca", "narwhal", "dolphin"]
            var waves = ""
            for fin in seaLife {
                waves.append(fin)
            }
            return waves
        }
        let cuddle = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(cuddle.cgPath)
    }
}





#Preview {
    Dynorionis(Zephironis: { _ in })
}

