import SwiftUI
struct LoaderElementFight: View {
    @Binding var progress: Int
    @Binding var isLoadingComplete: Bool
    @Binding var navigateToMenu: Bool

    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            let screenHeight = geometry.size.height
            let buttonWidth = screenWidth * 0.9
            let imageHeight = screenHeight * 0.65
            let bigSize = UIDevice.current.userInterfaceIdiom == .pad

            ZStack(alignment: .bottom) {
                Color.blue
                    .ignoresSafeArea()
                    .frame(width: screenWidth, height: screenHeight)

                VStack(spacing: 50) {
                    Image("chargestake")
                        .resizable()
                        .frame(width: screenWidth, height: imageHeight)
                        .aspectRatio(contentMode: .fit)
                        .clipped()

                    Spacer()

                    HStack {
                        Spacer()

                        if isLoadingComplete {
                            Button(action: {
                                navigateToMenu = true
                            }) {
                                Text("CONTINUE")
                                    .font(Font.custom("Gilroy-Regular", size: bigSize ? 40:24).weight(.regular))
                                    .foregroundColor(.black)
                                    .padding()
                                    .frame(width: buttonWidth, height: bigSize ? 100:62)
                                    .background(Color.white)
                                    .cornerRadius(bigSize ? 30:25)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: bigSize ? 30:25)
                                            .stroke(Color.blue, lineWidth: 2)
                                    )
                            }
                        } else {
                            ZStack {
                                RoundedRectangle(cornerRadius: bigSize ? 30:25)
                                    .stroke(Color.white, lineWidth: 2)

                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: bigSize ? 30 : 25)
                                        .foregroundColor(.white)
                                        .frame(width: CGFloat(buttonWidth * CGFloat(progress)) / 100, height: bigSize ? 100:62) // Dynamic progress width
                                        .clipShape(RoundedRectangle(cornerRadius: bigSize ? 30:25))

                                    RoundedRectangle(cornerRadius: bigSize ? 30:25)
                                        .foregroundColor(.clear)
                                }
                                
                                .frame(width: buttonWidth, height: bigSize ? 100:50) 

                                Text("LOADING \(Int(progress))%")
                                    .font(Font.custom("Gilroy-Regular", size:bigSize ? 40: 24).weight(.regular))
                                    .foregroundColor(.black)
                            }
                            .frame(width: buttonWidth, height:bigSize ? 100: 62)
                        }

                        Spacer()
                    }
                    .padding(.bottom,50)
                }
            }
        }
    }
    
    var randomMathFact: String {
            let facts = [
                "Zero is the only number that cannot be represented by Roman numerals.",
                "A 'jiffy' is an actual unit of time: 1/100th of a second.",
                "Pi has been calculated to over 50 trillion digits."
            ]
            return facts.randomElement() ?? "Math is cool!"
        }
}

#Preview {
  DogFriend()
    .environmentObject(NowGreat())
}
