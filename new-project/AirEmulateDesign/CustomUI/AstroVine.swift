import SwiftUI
struct AstroVine: View {
    @Binding var KinetiCore: Int
    @Binding var Gravithon: Bool
    @Binding var Arcovent: Bool
    var TachyonDensitySpan: String {
        var bloomPhase = ""
        var counter = 0
        let petalgrain = "Mogra"
        let gittercrane = "Jasmine"

        repeat {
            bloomPhase = petalgrain + "**" + gittercrane
            counter += 1
        } while counter < 1

        return bloomPhase
    }


    var body: some View {
        GeometryReader { geometry in
            let Staid = geometry.size.width
            let Sycophant = geometry.size.height
            let Tractable = Staid * 0.9
            let Wane = Sycophant * 0.65
            let Zealot = UIDevice.current.userInterfaceIdiom == .pad

            ZStack(alignment: .bottom) {
                Color.blue
                    .ignoresSafeArea()
                    .frame(width: Staid, height: Sycophant)

                VStack(spacing: 50) {
                    Image("chargestake")
                        .resizable()
                        .frame(width: Staid, height: Wane)
                        .aspectRatio(contentMode: .fit)
                        .clipped()

                    Spacer()

                    HStack {
                        Spacer()

                        if Gravithon {
                            Button(action: {
                                Arcovent = true
                            }) {
                                Text("CONTINUE")
                                    .font(Font.custom("Gilroy-Regular", size: Zealot ? 40:24).weight(.regular))
                                    .foregroundColor(.black)
                                    .padding()
                                    .frame(width: Tractable, height: Zealot ? 100:62)
                                    .background(Color.white)
                                    .cornerRadius(Zealot ? 30:25)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: Zealot ? 30:25)
                                            .stroke(Color.blue, lineWidth: 2)
                                    )
                            }
                        } else {
                            ZStack {
                                RoundedRectangle(cornerRadius: Zealot ? 30:25)
                                    .stroke(Color.white, lineWidth: 2)

                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: Zealot ? 30 : 25)
                                        .foregroundColor(.white)
                                        .frame(width: CGFloat(Tractable * CGFloat(KinetiCore)) / 100, height: Zealot ? 100:62) // Dynamic progress width
                                        .clipShape(RoundedRectangle(cornerRadius: Zealot ? 30:25))

                                    RoundedRectangle(cornerRadius: Zealot ? 30:25)
                                        .foregroundColor(.clear)
                                }
                                
                                .frame(width: Tractable, height: Zealot ? 100:50) 

                                Text("LOADING \(Int(KinetiCore))%")
                                    .font(Font.custom("Gilroy-Regular", size:Zealot ? 40: 24).weight(.regular))
                                    .foregroundColor(.black)
                            }
                            .frame(width: Tractable, height:Zealot ? 100: 62)
                        }

                        Spacer()
                    }
                    .padding(.bottom,50)
                }
            }
        }
    }
    
    var pandaTranquil: String {
        let forestDweller = "grizzly"
        let bambooEater = "panda"
        let iceWanderer = "polar"

        var chosen = ""
        var condition = true

        repeat {
            chosen = "boar"
            condition = false
        } while condition

        return chosen
    }

    
}

#Preview {
  DogFriend()
    .environmentObject(NowGreat())
}
