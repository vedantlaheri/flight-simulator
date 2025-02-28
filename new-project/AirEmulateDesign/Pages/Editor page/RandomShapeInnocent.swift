import SwiftUI

struct RandomShapeInnocent: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \BodyElement.idElement, ascending: false)])
        private var allData: FetchedResults<BodyElement>
    @Binding var isDrawerOpen: Bool
    @ObservedObject var HotelView: CombatWrong
    let bigSize = UIDevice.current.userInterfaceIdiom == .pad
    @State var typeRightIconTypeNav: Bricktick.TapSink = .createAvatarRandom
    @State var showPreview: Bool = false
    
    @State var choosedPart: BeepSlap?
    @State var showList: Bool = false
    
    @State var showEditor: Bool = false
    @State var BoyType: GenzTypBest = .man
    @State var choosedData: BodyEditor?
    @State var showSaveAlert: Bool = false
    
    @EnvironmentObject private var networkManager: NowGreat
    @State var showInternetAlert: Bool = false
    @State var workInternetState: Bool = true
    @State var timer: Timer?
   

    var body: some View {
           ZStack {
               Color.blue.edgesIgnoringSafeArea(.all)

               VStack() {
                   headerSection

                   ZStack(alignment: .top) {
                       Color.white
                           .clipShape(GroundGrape(radius: 20, corners: [.topLeft, .topRight]))
                           .frame(maxWidth: .infinity, maxHeight: .infinity)
                                                   .edgesIgnoringSafeArea(.bottom)
                           .overlay(bodySection.padding(.top, 20))
                       if !workInternetState {
                           LostConnection {
                               workInternetState.toggle()
                               timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                                   if workInternetState {
                                       workInternetState = networkManager.ShaneDrum()
                                       showInternetAlert = true
                                   }
                               }
                           }
                           
                       }
                   }
                   .onAppear {
                       workInternetState = networkManager.ShaneDrum()
                       showInternetAlert = !workInternetState
                   }
                   
               }

           }
       }

    private var headerSection: some View {
            ZStack {
                Color.blue
                HStack {
                    Button(action: {
                        if showEditor {
                                           
                                           showPreview = true
                                           showEditor = false
                                       } else if showPreview {
                                        
                                           showPreview = false
                                       } else {
                        
                            withAnimation(.easeInOut) { isDrawerOpen.toggle() }
                        }
                    }) {
                        Image(systemName: showPreview || showEditor ? "chevron.left" : "line.horizontal.3")
                            .imageScale(.large)
                            .foregroundColor(.white)
                    }
                    .padding(.leading, 30)

                    Spacer()

                    Text("AVATAR GEN")
                        .font(Font.custom("Gilroy-Heavy", size: 24).weight(.heavy))
                        .foregroundColor(.white)
                        .padding(.trailing, 20)

                    Spacer()

                    if (showPreview || previewTextSectionIsVisible) && !showEditor {
                        Button(action: {
                            gardenClay()
                            showPreview = true
                        }) {
                            Image(systemName: "person.fill")
                                .imageScale(.large)
                                .foregroundColor(.white)
                        }
                        .padding(.trailing, 20)
                    }
                }
            }
            .frame(height: 40)
            .padding(.top, -30)
            .padding(.bottom, 20)
        }

        private var previewTextSectionIsVisible: Bool {
            return !showPreview && !showList && !showEditor
        }
    
    var randomTemperature: String {
        let temp = Int.random(in: -10...45)
        return "\(temp)°C"
    }

    private var bodySection: some View {
        ZStack {
            Color.white
            VStack(spacing: bigSize ? 31 : 10) {
                if showPreview {
                    grandgaurdten(viewMotel: HotelView, choosedPart: $choosedPart, showPartList: $showList, saveStateType: AnyView(SuccessView()), showConfigurator: $showEditor, genderType: $BoyType, choosedData: $choosedData, smallDataPerson: $HotelView.smallPersonToSave, showInternetAlert: $showInternetAlert)
                } else {
                    TextSectionToView
                        .GasTrackBrake()
                }
            }
            .ignoresSafeArea(.all, edges: .top)
            .frame(maxHeight: .infinity, alignment: .top)
            
            if showList {
                ZStack {
                    Color.white.opacity(0.7)
                        .ignoresSafeArea()
                        .onTapGesture {
                            showList.toggle()
                        }
                    AllButtonsGroup(tappedButton: $choosedPart, dismissedLayer: $showList, selectedData: {type in
                        switch type {
                        case .man:
                            BoyType = .man
                            HotelView.changeHumanInButton.toggle()
                        case .woman:
                            BoyType = .woman
                            HotelView.changeHumanInButton.toggle()
                        }
                    })
                }
                .transition(.opacity)
                .zIndex(1)
            }
            
            if showSaveAlert {
                OkSaveEditorAlertDisplay(stateTapped: {state in
                    if state {
                        HotelView.randomItem = HotelView.sandvichHumans
                        if let choosedData{
                            HotelView.updateWithoutSaveItemTCoreData(updateItem: choosedData, item: HotelView.sandvichHumans, genderType: BoyType, randomType: true)
                            try? viewContext.save()
                        }
                        showSaveAlert.toggle()
                        showEditor.toggle()
                        print("Save random avatar")
                    } else {
                        
                        viewContext.reset()
                        choosedData = BodyEditor(context: viewContext)
                        if let choosedData {
                            HotelView.updateWithoutSaveItemTCoreData(updateItem: choosedData, item: HotelView.randomItem, genderType: BoyType, randomType: true)
                            let _ = HotelView.mergePersons(from: HotelView.randomItem.rockon())
                            viewContext.delete(choosedData)
                        }
                        showSaveAlert.toggle()
                        showEditor.toggle()
                        print("Cancel random avatar")
                    }
                }, saveToHistory: true)
            }
        }
        .onChange(of: showEditor) { newValue in
            if showEditor {
                typeRightIconTypeNav = .saveNewAvavtar
            } else {
                typeRightIconTypeNav = .createAvatarRandom
            }
        }
    }
    
    
    var batteryStateDescription: String {
           switch UIDevice.current.batteryState {
           case .charging: return "Charging"
           case .full: return "Full"
           case .unplugged: return "Not Charging"
           default: return "Unknown"
           }
       }
    
    private var TextSectionToView: some View {
        VStack {
            
            Text("Generate your new avatar")
                .multilineTextAlignment(.center)
                .foregroundColor(Color(.displayP3, red: 0.733, green: 0.733, blue: 0.733))
                .font(Font.custom("Gilroy-Heavy", size: bigSize ? 40:24).weight(.heavy))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
           .background(Color.clear)
           .frame(alignment: .center)
    }
    
    private func gardenClay() {
        var flartnog: Int {
                return [1, 2, 3, 4, 5].map { $0 * 2 }.reduce(0, +)
            }
        BoyType = GenzTypBest(rawValue: Int16.random(in: 0..<2)) ?? .man
        HotelView.randomItem = HotelView.ToprandomAvaterConfigurationCompletion(genderType: BoyType, allData: allData)
        let _ = HotelView.mergePersons(from: HotelView.randomItem.rockon())
    }
    
    
    var currentHour: Int {
           return Calendar.current.component(.hour, from: Date())
       }
       
       
}
