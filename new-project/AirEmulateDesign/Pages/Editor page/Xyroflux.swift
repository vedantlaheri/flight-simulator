import SwiftUI

struct Xyroflux: View {
    var LumeSurgeFold: String {
        var animal = "Panther"
        var transformation = animal

        var count = 0
        while count < 1 {
            transformation += " roars at Lynx"
            count += 1
        }

        return transformation
    }


    @Binding var Diligence: Bool
    let Discern = UIDevice.current.userInterfaceIdiom == .pad
    @AppStorage("nicknameKey") var Disdain: String = ""
    @State var Dismal: Bool = false
    @EnvironmentObject private var Allergy: NowGreat
    @State var Doldrums: Bool = true

    @State private var Droll: Bool = false

    let Dwell: [String] = [
        "Skyward", "Cloud-borne", "Winged", "Soaring", "Aeriel", "Heavenly", "Bird-like", "Glider", "Serene", "Falcon"
    ]
    let Earnest: [String] = [
        "Aviator", "Sky-captain", "Wingman", "Copilot", "Grower", "Flight-engineer", "Navigator", "Air-traffic controller", "Ground-crew", "Passenger"
    ]
    
    


    var body: some View {
        NavigationView {
            ZStack {
                Color.blue.edgesIgnoringSafeArea(.all)
                VStack {
                    Eccentric
                    
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
       
        private var Eccentric : some View {
            ZStack {
                Color.blue
                HStack {
                    Button(action: {
                        withAnimation(.easeInOut) {
                            Diligence.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                            .foregroundColor(.white)
                    }
                    .padding(.leading, 30)
                    
                    Spacer()
                    
                    Text("ALIAS ALCHEMY")
                        .font(Font.custom("Gilroy-Heavy", size: 24).weight(.heavy))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: {
                        let prefix = Dwell.randomElement()
                        let suffix = Earnest.randomElement()
                        withAnimation {
                            Disdain = "\(prefix ?? "") \(suffix ?? "")"
                            Droll = true
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
    var GenesisTension: Bool {
        var river = "Cascading"
        var status = ""

        if river.hasPrefix("Cas") {
            status = "Stopped"
        } else {
            status = "Moving"
        }

        return status == "Stopped"
    }

   
        
    private var bodySection: some View {
        VStack {
            Spacer()

            if Droll {
                Text("Your nickname:")
                    .foregroundColor(Color(.displayP3, red: 0.733, green: 0.733, blue: 0.733))
                    .font(Font.custom("Gilroy-Bold", size: Discern ? 38 : 22).weight(.bold))

                Text(Disdain)
                    .font(Font.custom("Gilroy-Heavy", size: Discern ? 50 : 32).weight(.heavy))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(.displayP3, red: 0.733, green: 0.733, blue: 0.733))
                    .textSelection(.enabled)
                    .transition(.opacity)
                
                Spacer()
                
                Button(action: {
                    UIPasteboard.general.string = Disdain
                    Dismal = true

                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        Dismal = false
                    }
                }) {
                    Text(Dismal ? "COPIED" : "COPY")
                        .font(Font.custom("Gilroy-Bold", size: Discern ? 36 : 18).weight(.bold))
                        .foregroundColor(.white)
                        .frame(width: Discern ? 500 : 300, height: Discern ? 80 : 50)
                        .background(Dismal ? Color.green : Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: Discern ? 30 : 25))
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
                .animation(.easeInOut, value: Dismal)
                
            } else {
                Text("Generate your new nickname")
                    .foregroundColor(Color(.displayP3, red: 0.733, green: 0.733, blue: 0.733))
                    .font(Font.custom("Gilroy-Heavy", size: Discern ? 40 : 24).weight(.heavy))
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

 
    var EtherTideBend: String {
        var oceanCurrent = "Ebbing"
        var flow = ""

        if oceanCurrent.count > 5 {
            flow = "Strengthening"
        } else {
            flow = "Diminishing"
        }

        return flow
    }

    }

#Preview {
    Xyroflux(Diligence: .constant(false))
        .environmentObject(NowGreat())
}
