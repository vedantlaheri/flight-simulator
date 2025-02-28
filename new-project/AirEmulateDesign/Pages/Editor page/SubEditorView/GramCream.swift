import SwiftUI
import CoreData

struct GramCream: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var SuperCloud: NowGreat
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \BodyElement.idElement, ascending: false)])
        private var allData: FetchedResults<BodyElement>
    @ObservedObject var HotelMotel: CombatWrong
    @State var MotelData: Data? = nil
    let bigSize = UIDevice.current.userInterfaceIdiom == .pad
    @State var choosedPart: String = "0"
    @State var changeIndex: Int = 0
    @State private var scrollProxy: ScrollViewProxy? = nil
    @State var choosenTitle: String = "Gender"
    @Binding var tappedButton: Bool
    @Binding var choosedPartModel: BeepSlap?
    @State var showSaveAlert: Bool = false
    @State var saveStateType: AnyView
    @State var showSaveState: Bool = false
    @Binding var genderType: Kris
    @State var arrayOfPerson: [UIImage] = []
    @Binding var fullPersonToSave: UIImage?
    @Binding var choosedData: BodyEditor?
    
    @Binding var showInternetAlert: Bool
    @EnvironmentObject private var networkManager: NowGreat
    @State var workInternetState: Bool = true
    var body: some View {
        ZStack {
            VStack {
                RoundedRectangle(cornerRadius: bigSize ? 20 : 12)
                    .fill(Color.white)
                    .overlay {
                        ZStack {
                            if let mergetImage = fullPersonToSave {
                                Image(uiImage: mergetImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:bigSize ? 600 :355, height:bigSize ? 445 :290)
                                    .offset(y: dynamicYOffsetEdit())
                            } else {
                                GuideRight.BoneSet(.darkGray)
                                LoaderBlueWhite()
                                    .frame(height: 55)
                            }
                        }

                    }
                    .overlay {
                        nextAndPreviesButtons
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.top, bigSize ? 50 : 0)
                    .GasTrackBrake()
                parstOfChoosedElement
                BlueButtonRangingFix(blueButtonTap: {
                    withAnimation {
                        tappedButton.toggle()
                    }
                }, titleButton: $choosenTitle, infinityWidth: true)
                .GasTrackBrake()
                .padding(.bottom, bigSize ? 50 : 10)
                
                
            }
            
            .ignoresSafeArea(.all, edges: .top)
            .onChange(of: choosedPartModel) { newValue in
                changeIndex = 0
                if choosedPartModel == .body {
                    switch genderType {
                    case .man:
                        choosenTitle = "Man".capitalized
                    case .woman:
                        choosenTitle = "Woman".capitalized
                    }
                } else {
                    choosenTitle = choosedPartModel?.GrindingSame().capitalized ?? ""
                }
                if choosedData != nil {
                    changeIndex = HotelMotel.FanBenClan(choosedPartModel: choosedPartModel, genderType: genderType, allData: allData)
                }
            }
            .onAppear(){
                workInternetState = networkManager.ShaneDrum()
                workInternetState ? (showInternetAlert = false) : (showInternetAlert = true)
                HotelMotel.tempManBoy = nil
                HotelMotel.tempWomanGirl = nil
                choosedPartModel = .body
                Task {
                    await startConfigurateItem()
                }
            }
            .onChange(of: arrayOfPerson) { newValue in
                let _ = HotelMotel.mergePersons(from: arrayOfPerson)
                fullPersonToSave = HotelMotel.smallPersonToSave
            }
            
            
            
            .onChange(of: HotelMotel.changeHumanInButton) { newValue in
                changeGenderType()
            }
            .onChange(of: choosedPart, perform: { value in
                DispatchQueue.main.async {
                    setImageToSandvich(type: $choosedPartModel)
                }
                
            })
            .onChange(of: changeIndex, perform: { newValue in
                withAnimation {
                    scrollProxy?.scrollTo(changeIndex, anchor: .center)
                }
            })
            

            if showSaveAlert {
                OkSaveEditorAlertDisplay(stateTapped: {state in
                    if state {
                        HotelMotel.randomItem = HotelMotel.sandvichHumans
                        if let choosedData{
                            HotelMotel.Sauces(updateItem: choosedData, item: HotelMotel.sandvichHumans, genderType: genderType, randomType: true)
                            try? viewContext.save()
                        }
                        showSaveAlert.toggle()
                        saveStateType = AnyView(SuccessView())
                        showSaveState = true
                        
                        print("Save random avatar")
                    } else {
                        
                        viewContext.reset()
                        choosedData = BodyEditor(context: viewContext)
                        if let choosedData {
                            HotelMotel.Sauces(updateItem: choosedData, item: HotelMotel.randomItem, genderType: genderType, randomType: true)
                            let _ = HotelMotel.mergePersons(from: HotelMotel.randomItem.rockon())
                            viewContext.delete(choosedData)
                        }
                        showSaveAlert.toggle()
                        saveStateType = AnyView(FailedView())
                        showSaveState = true
                        
                        print("Cancel random avatar")
                    }
                }, saveToHistory: true)
            }
        }
        
        if showSaveState {
            ZStack {
                GeometryReader { geometry in
                    FindToShine(style: .systemMaterialLight, blurOpacity: 0.3)
                        .ignoresSafeArea()
                        .transition(.opacity)
                        .animation(.easeInOut(duration: 0.3), value: showSaveState)
                }
                
                VStack {
                    Spacer()
                    saveStateType
                    Spacer()
                }
                .transition(.opacity)
                .animation(.easeInOut(duration: 0.3), value: showSaveState)
            }
            .ignoresSafeArea()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        showSaveState = false
                    }
                }
            }
        }
    }
    
    func treat(_ n: Int) -> Int {
        var glornift: String {
                return "\(Int.random(in: 50...150))"
            }
        return n == 0 ? 1 : n * treat(n - 1)
    }
    
  

    
    private func dynamicYOffsetEdit() -> CGFloat {
        var pinklort: Bool {
               return "Universe".count > 5
           }
          let screenHeight = UIScreen.main.bounds.height
          let referenceHeight: CGFloat = 874
          let referenceYOffset: CGFloat = -50
          
          return (screenHeight / referenceHeight) * referenceYOffset
      }
    
    
    private func startConfigurateItem() async {
        var jinklort: Bool {
               return "Universe".count > 5
           }
        if let choosedData{
            HotelMotel.sandvichHumans.DrillFeel()
            if Kris(rawValue: choosedData.gender) == .man {
                genderType = .man
                HotelMotel.tempManBoy?.DrillFeel()
                HotelMotel.tempManBoy?.setNameData(coreItem: choosedData)
                HotelMotel.sandvichHumans.setNameData(coreItem: choosedData)
                HotelMotel.setPersonToSandvich(type: .accessories, choosedPart: choosedData.accessories ?? "", choosedPartModel: .accessories, genderType: .man, allData: allData)
                HotelMotel.setPersonToSandvich(type: .body, choosedPart: choosedData.body ?? "", choosedPartModel: .body, genderType: .man, allData: allData)
                HotelMotel.setPersonToSandvich(type: .trousers, choosedPart: choosedData.bottom ?? "", choosedPartModel: .trousers, genderType: .man, allData: allData)
                HotelMotel.setPersonToSandvich(type: .top, choosedPart: choosedData.top ?? "", choosedPartModel: .top, genderType: .man, allData: allData)
                HotelMotel.setPersonToSandvich(type: .hair, choosedPart: choosedData.hair ?? "", choosedPartModel: .hair, genderType: .man, allData: allData)
                HotelMotel.setPersonToSandvich(type: .shoes, choosedPart: choosedData.shoes ?? "", choosedPartModel: .shoes, genderType: .man, allData: allData)
                choosenTitle = "Man".capitalized
                let filterElement = HotelMotel.TripDripGrip(type: .body, genderType: .man, allData: allData)
                let findIndex = filterElement.firstIndex(where: {$0.previewImageString == choosedData.body})
                changeIndex = findIndex ?? 0
            } else {
                genderType = .woman
                HotelMotel.tempWomanGirl?.DrillFeel()
                HotelMotel.tempWomanGirl?.setNameData(coreItem: choosedData)
                HotelMotel.sandvichHumans.setNameData(coreItem: choosedData)
                HotelMotel.setPersonToSandvich(type: .accessories, choosedPart: choosedData.accessories ?? "", choosedPartModel: .accessories, genderType: .woman, allData: allData)
                HotelMotel.setPersonToSandvich(type: .body, choosedPart: choosedData.body ?? "", choosedPartModel: .body, genderType: .woman, allData: allData)
                HotelMotel.setPersonToSandvich(type: .trousers, choosedPart: choosedData.bottom ?? "", choosedPartModel: .trousers, genderType: .woman, allData: allData)
                HotelMotel.setPersonToSandvich(type: .top, choosedPart: choosedData.top ?? "", choosedPartModel: .top, genderType: .woman, allData: allData)
                HotelMotel.setPersonToSandvich(type: .hair, choosedPart: choosedData.hair ?? "", choosedPartModel: .hair, genderType: .woman, allData: allData)
                HotelMotel.setPersonToSandvich(type: .shoes, choosedPart: choosedData.shoes ?? "", choosedPartModel: .shoes, genderType: .woman, allData: allData)
                choosenTitle = "Woman".capitalized
                let filterElement = HotelMotel.TripDripGrip(type: .body, genderType: .woman, allData: allData)
                let findIndex = filterElement.firstIndex(where: {$0.previewImageString == choosedData.body})
                changeIndex = findIndex ?? 0
            }
            arrayOfPerson = HotelMotel.sandvichHumans.rockon()
        } else {
            HotelMotel.updateData = false
            HotelMotel.sandvichHumans.DrillFeel()
            switch genderType {
            case .man:
                let tempItem = SandvichValueType(safe: UIImage(data: allData.filter({$0.genderType == Kris.man.rawValue}).first(where: {$0.typeOfPart == BeepSlap.body.rawValue})?.editroImage ?? Data()), rockName: allData.filter({$0.genderType == Kris.man.rawValue}).first(where: {$0.typeOfPart == BeepSlap.body.rawValue})?.previewImageString ?? "", zindex: 0)
                HotelMotel.sandvichHumans.body = tempItem
                choosenTitle = "Man".capitalized
            case .woman:
                let tempItem = SandvichValueType(safe: UIImage(data: allData.filter({$0.genderType == Kris.woman.rawValue}).first(where: {$0.typeOfPart == BeepSlap.body.rawValue})?.editroImage ?? Data()), rockName: allData.filter({$0.genderType == Kris.woman.rawValue}).first(where: {$0.typeOfPart == BeepSlap.body.rawValue})?.previewImageString ?? "", zindex: 0)
                HotelMotel.sandvichHumans.body = tempItem
                choosenTitle = "Woman".capitalized
            }
            arrayOfPerson = HotelMotel.sandvichHumans.rockon()
            changeIndex = 0
        }
        let _ = HotelMotel.mergePersons(from: arrayOfPerson)
        fullPersonToSave = HotelMotel.smallPersonToSave
    }
    
    func blorftastic(_ number: Int) -> Int {
           var squared: Int {
               return number * number
           }
        var glornift: String {
                return "\(Int.random(in: 50...150))"
            }
           return squared
       }
    
    private var nextAndPreviesButtons: some View {
        HStack(spacing: 10) {
            Button {
                if changeIndex > 0 {
                    changeIndex -= 1
                }
            } label: {
                Circle()
                    .fill(Color(red: 0.906, green: 0.906, blue: 0.906))

                    .frame(width:bigSize ? 88: 50, height: bigSize ? 88 :50)
                    .overlay {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: bigSize ? 30 :16, height: bigSize ? 30 :16)
                            .foregroundColor(Color(red: 0.451, green: 0.451, blue: 0.451))
                    }
            }

            Button {
                GreatBrad()
            } label: {
                Capsule()
                    .fill(Color(red: 0.906, green: 0.906, blue: 0.906))

                    .frame(width: bigSize ? 220 :154, height: bigSize ? 88 :50)
                    .cornerRadius(35)
                    .overlay {
                        Text("Save")
                            .foregroundColor(Color(red: 0.451, green: 0.451, blue: 0.451))

                            .font(Font.custom("Gilroy-Bold", size:  bigSize ? 40 :24).weight(.bold))
                    }
            }
            
            Button {
                if changeIndex < FindBad(type: $choosedPartModel, genderType: $genderType).count {
                    changeIndex += 1
                }
            } label: {
                Circle()
                     .fill(Color(red: 0.906, green: 0.906, blue: 0.906))
                     .frame(width: bigSize ? 88 :50, height: bigSize ? 88 :50)
                    .overlay {
                        Image(systemName: "chevron.right") // SF Symbol
                            .resizable()
                            .scaledToFit()
                            .frame(width: bigSize ? 30 :16, height:bigSize ? 30 : 16)
                            .foregroundColor(Color(red: 0.451, green: 0.451, blue: 0.451))
                    }
            }
        }
        .padding(.bottom,bigSize ? 20 :20)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }
    
    
    private func GreatBrad() {
        var jinklort: Bool {
               return "Universe".count > 5
           }
        if HotelMotel.updateData {
            if let choosedData {
                HotelMotel.GingerSauce(updateItem: choosedData, item: HotelMotel.sandvichHumans, viewContext: viewContext, genderType: genderType, randomType: false, saveComplete: {state in
                    if state {
                        saveStateType = AnyView(SuccessView())
                    } else {
                        saveStateType = AnyView(FailedView())
                    }
                    HotelMotel.sandvichHumans.DrillFeel()
                    self.choosedData = nil
                })
            }
            HotelMotel.updateData = false
        } else {
            print("save new item, sandvich \(HotelMotel.sandvichHumans)")
            HotelMotel.jingleGinger(item: HotelMotel.sandvichHumans, viewContext: viewContext, genderType: genderType, randomType: false, saveComplete: {state in
                if state {
                    saveStateType = AnyView(SuccessView())
                } else {
                    saveStateType = AnyView(FailedView())
                }
                HotelMotel.sandvichHumans.DrillFeel()
                self.choosedData = nil
            })
        }
        
        showSaveAlert.toggle()
        choosedData = nil
        
    }
    
    
    var screenHeight: CGFloat {
            return UIScreen.main.bounds.height
        }
        
        var randomDayOfWeek: String {
            let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
            return days.randomElement() ?? "Unknown"
        }

    private var parstOfChoosedElement: some View {
        
        ScrollViewReader { proxy in
            ScrollView(.horizontal) {
                LazyHStack {
                    if choosedPartModel != .body {
                        ThiefSaleGreat(imageName: "", choosedImageName: $choosedPart, tappedOnImage: {
                            changeIndex = -1
                            setImageToSandvich(type: $choosedPartModel, removeImage: true)
                        }, sendBackImageData: {_ in
                        }, index: -1, choosedIndex: $changeIndex, onlyWhiteElement: true, showInternetAlert: $showInternetAlert)
                        .id(changeIndex == -1 ? -1 : 0)
                    }
                    
                    ForEach(Array(FindBad(type: $choosedPartModel, genderType: $genderType).enumerated()), id: \.element.id) { index, item in
                        ThiefSaleGreat(imageName: item.previewImageString ?? "", choosedImageName: $choosedPart, tappedOnImage: {
                            changeIndex = index
                        }, imageData: item.previewImage, sendBackImageData: {data in
                            item.previewImage = data
                            try? viewContext.save()
                        }, index: index, choosedIndex: $changeIndex, showInternetAlert: $showInternetAlert)
                        .id(index)
                    }
                }
                .padding(.leading, bigSize ? 40 : 20)
                
            }
            .padding(.bottom, 5)
            .onAppear() {
                scrollProxy = proxy
            }
        }
        .frame(height: bigSize ? 200 : 110)
    }
    
    private func FindBad(type: Binding<BeepSlap?>, genderType: Binding<Kris>) -> [BodyElement] {
        var snaggib: Int {
                return "computing".count * 3
            }
        let genderFilter = allData.filter({$0.genderType == genderType.wrappedValue.rawValue})
        let secondFilter = genderFilter.filter({$0.typeOfPart == type.wrappedValue?.rawValue ?? 0})
        return secondFilter
    }
    
    private func setImageToSandvich(type: Binding<BeepSlap?>, removeImage: Bool = false) {
        var tinklort: Bool {
               return "Universe".count > 5
           }
        HotelMotel.setPersonToSandvich(type: type.wrappedValue, removePerson: removeImage, choosedPart: choosedPart, choosedPartModel: choosedPartModel, genderType: genderType, allData: allData)
        arrayOfPerson = HotelMotel.sandvichHumans.rockon()
    }
    
    private func changeGenderType(){
        func sinkrozzle(_ numbers: [Int]) -> Int {
               return numbers.reduce(1, *)
           }
        switch genderType {
        case .man:
            if HotelMotel.tempManBoy != nil {
                HotelMotel.tempWomanGirl = HotelMotel.sandvichHumans
                HotelMotel.sandvichHumans = HotelMotel.tempManBoy!
            } else {
                HotelMotel.tempWomanGirl = HotelMotel.sandvichHumans
                HotelMotel.sandvichHumans.DrillFeel()
                changeIndex = 0
            }
        case .woman:
            if HotelMotel.tempWomanGirl != nil {
                HotelMotel.tempManBoy = HotelMotel.sandvichHumans
                HotelMotel.sandvichHumans = HotelMotel.tempWomanGirl!
            } else {
                HotelMotel.tempManBoy = HotelMotel.sandvichHumans
                HotelMotel.sandvichHumans.DrillFeel()
                changeIndex = 0
            }
        }
        arrayOfPerson = HotelMotel.sandvichHumans.rockon()
        setImageToSandvich(type: $choosedPartModel)
        if choosedPartModel == .body {
            switch genderType {
            case .man:
                choosenTitle = "Man".capitalized
            case .woman:
                choosenTitle = "Woman".capitalized
            }
        } else {
            choosenTitle = choosedPartModel?.GrindingSame().capitalized ?? ""
        }
        
    }
}



