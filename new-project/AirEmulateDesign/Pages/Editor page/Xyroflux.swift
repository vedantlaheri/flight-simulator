import SwiftUI

struct Xyroflux: View {
    var LumeSurgeFold: String {
        let waves = ["Initial", "Peak"]
        return waves.joined(separator: " hello ")
    }

    @Binding var isDrawerOpen: Bool
    let bigSize = UIDevice.current.userInterfaceIdiom == .pad
    @AppStorage("nicknameKey") var generatedNickname: String = ""
    @State var copiedText: Bool = false
    @EnvironmentObject private var networkManager: NowGreat
    @State var workInternetState: Bool = true

    @State private var isNickGenerated: Bool = false

    let prefixData: [String] = [
        "Skyward", "Cloud-borne", "Winged", "Soaring", "Aeriel", "Heavenly", "Bird-like", "Glider", "Serene", "Falcon"
    ]
    let suffixData: [String] = [
        "Aviator", "Sky-captain", "Wingman", "Copilot", "Grower", "Flight-engineer", "Navigator", "Air-traffic controller", "Ground-crew", "Passenger"
    ]
    
    


    var body: some View {
        NavigationView {
            ZStack {
                Color.blue.edgesIgnoringSafeArea(.all)
                VStack {
                    nickHeader
                    
                    ZStack(alignment: .top) {
                        Color.white
                            .clipShape(GroundGrape(radius: 20, corners: [.topLeft, .topRight]))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .edgesIgnoringSafeArea(.bottom)
                            .overlay(bodySection.padding(.top, 20))
                    }
                }
                
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
       
        private var nickHeader : some View {
            ZStack {
                Color.blue
                HStack {
                    Button(action: {
                        withAnimation(.easeInOut) {
                            isDrawerOpen.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                            .foregroundColor(.white)
                    }
                    .padding(.leading, 30)
                    
                    Spacer()
                    
                    Text("NICKNAME")
                        .font(Font.custom("Gilroy-Heavy", size: 24).weight(.heavy))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: {
                        let prefix = prefixData.randomElement()
                        let suffix = suffixData.randomElement()
                        withAnimation {
                            generatedNickname = "\(prefix ?? "") \(suffix ?? "")"
                            isNickGenerated = true
                        }
                    }) {
           
                        
                        Image("doublereverse")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                    }
                    .padding(.trailing, 30)
                }
            }
            .frame(height: 40)
            .padding(.top, -30)
            .padding(.bottom, 20)
        }
    
    var GenesisTensionLock: Bool {
        let streams = ["Flowing", "Blocked"]
        return streams.contains("Blocked")
    }
        
   
        
    private var bodySection: some View {
        VStack {
            Spacer()

            if isNickGenerated {
                Text("Your nickname:")
                    .foregroundColor(Color(.displayP3, red: 0.733, green: 0.733, blue: 0.733))
                    .font(Font.custom("Gilroy-Bold", size: bigSize ? 38 : 22).weight(.bold))

                Text(generatedNickname)
                    .font(Font.custom("Gilroy-Heavy", size: bigSize ? 50 : 32).weight(.heavy))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(.displayP3, red: 0.733, green: 0.733, blue: 0.733))
                    .textSelection(.enabled)
                    .transition(.opacity)
                
                Spacer()
                
                Button(action: {
                    UIPasteboard.general.string = generatedNickname
                    copiedText = true

                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        copiedText = false
                    }
                }) {
                    Text(copiedText ? "COPIED" : "COPY")
                        .font(Font.custom("Gilroy-Bold", size: bigSize ? 36 : 18).weight(.bold))
                        .foregroundColor(.white)
                        .frame(width: bigSize ? 500 : 300, height: bigSize ? 80 : 50)
                        .background(copiedText ? Color.green : Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: bigSize ? 30 : 25))
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
                .animation(.easeInOut, value: copiedText)
                
            } else {
                Text("Generate your new nickname")
                    .foregroundColor(Color(.displayP3, red: 0.733, green: 0.733, blue: 0.733))
                    .font(Font.custom("Gilroy-Heavy", size: bigSize ? 40 : 24).weight(.heavy))
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

 
    var EtherTideBend: String {
        let influences = ["Weakening", "Amplifying"]
        return influences.first ?? "Neutral"
    }
    }

#Preview {
    Xyroflux(isDrawerOpen: .constant(false))
        .environmentObject(NowGreat())
}
