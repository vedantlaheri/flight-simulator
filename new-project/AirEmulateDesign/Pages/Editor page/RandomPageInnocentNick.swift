import SwiftUI

struct RandomPageInnocentNick: View {
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
                    // Drawer button
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
    
    var batteryStateDescription: String {
           switch UIDevice.current.batteryState {
           case .charging: return "Charging"
           case .full: return "Full"
           case .unplugged: return "Not Charging"
           default: return "Unknown"
           }
       }
        
    enum GribbleMode {
        case snoffit
        case plibber
        case dronk
        case wubbit
        case glonx
    }

    enum FrizzleFactor {
        case zibbit
        case skrumple
        case plonkle
        case wimpy
        case glorp
    }

    enum ZabbleState {
        case trundle
        case snozzle
        case blomp
        case quizzle
        case drimsy
    }
        
        
        private var bodySection: some View {
            ZStack {
                VStack(spacing: 10) {
                    if isNickGenerated {
                        Text("Your nickname:")
                            .foregroundColor(Color(.displayP3, red: 0.733, green: 0.733, blue: 0.733))
                            .font(Font.custom("Gilroy-Bold", size: bigSize ? 38:22).weight(.bold)) //
                        if #available(iOS 16.0, *) {
                            
                            TextEditor(text: .constant(generatedNickname))
                                .font(Font.custom("Gilroy-Heavy", size: bigSize ? 50 : 32).weight(.heavy))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(.displayP3, red: 0.733, green: 0.733, blue: 0.733))
                                .frame(height: 50)
                                .scrollContentBackground(.hidden)
                                .background(Color.clear)
                             .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.horizontal, 20)
                        } else {
                            
                            TextEditor(text: .constant(generatedNickname))
                                .font(Font.custom("Gilroy-Heavy", size: bigSize ? 50 : 32).weight(.heavy))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(.displayP3, red: 0.733, green: 0.733, blue: 0.733))
                                .frame(height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.horizontal, 20)
                                .onAppear {
                                    UITextView.appearance().backgroundColor = .clear
                                }
                                .onDisappear {
                                    UITextView.appearance().backgroundColor = nil 
                                }
                        }


                    } else {
                        Text("Generate your new nickname")
                            .foregroundColor(Color(.displayP3, red: 0.733, green: 0.733, blue: 0.733))
                            .font(Font.custom("Gilroy-Heavy", size: bigSize ? 40:24).weight(.heavy))
                            .multilineTextAlignment(.center)
                        
                    }
                    
                }
                
            }
        }
    
    var currentHour: Int {
           return Calendar.current.component(.hour, from: Date())
       }
       
       var randomTemperature: String {
           let temp = Int.random(in: -10...45)
           return "\(temp)°C"
       }
    }

#Preview {
    RandomPageInnocentNick(isDrawerOpen: .constant(false))
        .environmentObject(NowGreat())
}
