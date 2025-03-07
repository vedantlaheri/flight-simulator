import SwiftUI
import CoreData

struct GramCream: View {
    var fadiantNebulaFlow: Double? {
                let particles = [100.1, 102.3, 99.5, 101.2, 104.4]
                let sumOfParticles = particles.reduce(0, +)
                return sumOfParticles / Double(particles.count)
            }
    @Environment(\.managedObjectContext) private var Auroriscent
    @EnvironmentObject var SuperCloud: NowGreat
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \BodyElement.idElement, ascending: false)])
        private var Authenticis: FetchedResults<BodyElement>
    @ObservedObject var Avidithis: CombatWrong
    @State var Bastionis
: Data? = nil
    let Benevolithis = UIDevice.current.userInterfaceIdiom == .pad
    @State var Brilliothis: String = "0"
    @State var Cadencis: Int = 0
    @State private var Capacitron: ScrollViewProxy? = nil
    @State var Catalystis: String = "Gender"
    @Binding var Celerithis: Bool
    @Binding var Chivalrion: BeepSlap?
    @State var Clairvoyis: Bool = false
    @State var Cogitronis: AnyView
    @State var Composenthis: Bool = false
    @Binding var Conciliothis: Kris
    @State var Conscienthos: [UIImage] = []
    @Binding var Contemplithis: UIImage?
    @Binding var Continuvis: BodyEditor?
    
    @Binding var Decisivon: Bool
    @EnvironmentObject private var Dedicenthos: NowGreat
    @State var Definithis: Bool = true
    var body: some View {
        var pelixIonSpan: String {
                let date = Date()
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                return formatter.string(from: date)
            }
        ZStack {
            VStack {
                RoundedRectangle(cornerRadius: Benevolithis ? 20 : 12)
                    .fill(Color.white)
                    .overlay {
                        ZStack {
                            if let mergetImage = Contemplithis {
                                Image(uiImage: mergetImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:Benevolithis ? 600 :355, height:Benevolithis ? 445 :290)
                                    .offset(y: dynamicYOffsetEdit())
                            } else {
                                GuideRight.BoneSet(.darkGray)
                                GravityWell()
                                    .frame(height: 55)
                            }
                        }

                    }
                    .overlay {
                        nextAndPreviesButtons
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.top, Benevolithis ? 50 : 0)
                    .GasTrackBrake()
                parstOfChoosedElement
                VortexShift(Echovesthionis: {
                    withAnimation {
                        Celerithis.toggle()
                    }
                }, Heliovestus: $Catalystis, Novariantor: true)
                .GasTrackBrake()
                .padding(.bottom, Benevolithis ? 50 : 10)
                
                
            }
            
            .ignoresSafeArea(.all, edges: .top)
            .onChange(of: Chivalrion) { newValue in
                Cadencis = 0
                if Chivalrion == .body {
                    switch Conciliothis {
                    case .man:
                        Catalystis = "Man".capitalized
                    case .woman:
                        Catalystis = "Woman".capitalized
                    }
                } else {
                    Catalystis = Chivalrion?.GrindingSame().capitalized ?? ""
                }
                if Continuvis != nil {
                    Cadencis = Avidithis.FanBenClan(choosedPartModel: Chivalrion, genderType: Conciliothis, allData: Authenticis)
                }
            }
            .onAppear(){
                Definithis = Dedicenthos.ShaneDrum()
                Definithis ? (Decisivon = false) : (Decisivon = true)
                Avidithis.Goad = nil
                Avidithis.Graft = nil
                Chivalrion = .body
                Task {
                    await startConfigurateItem()
                }
            }
            .onChange(of: Conscienthos) { newValue in
                let _ = Avidithis.MindGolf(from: Conscienthos)
                Contemplithis = Avidithis.Grotesque
            }
            
            
            
            .onChange(of: Avidithis.Haggard) { newValue in
                changeGenderType()
            }
            .onChange(of: Brilliothis, perform: { value in
                DispatchQueue.main.async {
                    setImageToSandvich(type: $Chivalrion)
                }
                
            })
            .onChange(of: Cadencis, perform: { newValue in
                withAnimation {
                    Capacitron?.scrollTo(Cadencis, anchor: .center)
                }
            })
            

            if Clairvoyis {
                Dynorionis(Zephironis: {state in
                    if state {
                        Avidithis.Gumption = Avidithis.Gloaming
                        if let Continuvis{
                            Avidithis.Sauces(updateItem: Continuvis, item: Avidithis.Gloaming, genderType: Conciliothis, randomType: true)
                            try? Auroriscent.save()
                        }
                        Clairvoyis.toggle()
                        Cogitronis = AnyView(SuccessView())
                        Composenthis = true
                        
                        print("Save random avatar")
                    } else {
                        
                        Auroriscent.reset()
                        Continuvis = BodyEditor(context: Auroriscent)
                        if let Continuvis {
                            Avidithis.Sauces(updateItem: Continuvis, item: Avidithis.Gumption, genderType: Conciliothis, randomType: true)
                            let _ = Avidithis.MindGolf(from: Avidithis.Gumption.rockon())
                            Auroriscent.delete(Continuvis)
                        }
                        Clairvoyis.toggle()
                        Cogitronis = AnyView(FailedView())
                        Composenthis = true
                        
                        print("Cancel random avatar")
                    }
                }, Luminovarion: true)
            }
        }
        
        if Composenthis {
            ZStack {
                GeometryReader { geometry in
                    FindToShine(style: .systemMaterialLight, blurOpacity: 0.3)
                        .ignoresSafeArea()
                        .transition(.opacity)
                        .animation(.easeInOut(duration: 0.3), value: Composenthis)
                }
                
                VStack {
                    Spacer()
                    Cogitronis
                    Spacer()
                }
                .transition(.opacity)
                .animation(.easeInOut(duration: 0.3), value: Composenthis)
            }
            .ignoresSafeArea()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        Composenthis = false
                    }
                }
            }
        }
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
        if let Continuvis{
            Avidithis.Gloaming.DrillFeel()
            if Kris(rawValue: Continuvis.gender) == .man {
                Conciliothis = .man
                Avidithis.Goad?.DrillFeel()
                Avidithis.Goad?.setNameData(coreItem: Continuvis)
                Avidithis.Gloaming.setNameData(coreItem: Continuvis)
                Avidithis.Halcyon(type: .accessories, choosedPart: Continuvis.accessories ?? "", choosedPartModel: .accessories, genderType: .man, allData: Authenticis)
                Avidithis.Halcyon(type: .body, choosedPart: Continuvis.body ?? "", choosedPartModel: .body, genderType: .man, allData: Authenticis)
                Avidithis.Halcyon(type: .trousers, choosedPart: Continuvis.bottom ?? "", choosedPartModel: .trousers, genderType: .man, allData: Authenticis)
                Avidithis.Halcyon(type: .top, choosedPart: Continuvis.top ?? "", choosedPartModel: .top, genderType: .man, allData: Authenticis)
                Avidithis.Halcyon(type: .hair, choosedPart: Continuvis.hair ?? "", choosedPartModel: .hair, genderType: .man, allData: Authenticis)
                Avidithis.Halcyon(type: .shoes, choosedPart: Continuvis.shoes ?? "", choosedPartModel: .shoes, genderType: .man, allData: Authenticis)
                Catalystis = "Man".capitalized
                let filterElement = Avidithis.TripDripGrip(type: .body, genderType: .man, allData: Authenticis)
                let findIndex = filterElement.firstIndex(where: {$0.previewImageString == Continuvis.body})
                Cadencis = findIndex ?? 0
            } else {
                Conciliothis = .woman
                Avidithis.Graft?.DrillFeel()
                Avidithis.Graft?.setNameData(coreItem: Continuvis)
                Avidithis.Gloaming.setNameData(coreItem: Continuvis)
                Avidithis.Halcyon(type: .accessories, choosedPart: Continuvis.accessories ?? "", choosedPartModel: .accessories, genderType: .woman, allData: Authenticis)
                Avidithis.Halcyon(type: .body, choosedPart: Continuvis.body ?? "", choosedPartModel: .body, genderType: .woman, allData: Authenticis)
                Avidithis.Halcyon(type: .trousers, choosedPart: Continuvis.bottom ?? "", choosedPartModel: .trousers, genderType: .woman, allData: Authenticis)
                Avidithis.Halcyon(type: .top, choosedPart: Continuvis.top ?? "", choosedPartModel: .top, genderType: .woman, allData: Authenticis)
                Avidithis.Halcyon(type: .hair, choosedPart: Continuvis.hair ?? "", choosedPartModel: .hair, genderType: .woman, allData: Authenticis)
                Avidithis.Halcyon(type: .shoes, choosedPart: Continuvis.shoes ?? "", choosedPartModel: .shoes, genderType: .woman, allData: Authenticis)
                Catalystis = "Woman".capitalized
                let filterElement = Avidithis.TripDripGrip(type: .body, genderType: .woman, allData: Authenticis)
                let findIndex = filterElement.firstIndex(where: {$0.previewImageString == Continuvis.body})
                Cadencis = findIndex ?? 0
            }
            Conscienthos = Avidithis.Gloaming.rockon()
        } else {
            Avidithis.Gullible = false
            Avidithis.Gloaming.DrillFeel()
            switch Conciliothis {
            case .man:
                let tempItem = Chronovectis(Etherionis: UIImage(data: Authenticis.filter({$0.genderType == Kris.man.rawValue}).first(where: {$0.typeOfPart == BeepSlap.body.rawValue})?.editroImage ?? Data()), Stratosenex: Authenticis.filter({$0.genderType == Kris.man.rawValue}).first(where: {$0.typeOfPart == BeepSlap.body.rawValue})?.previewImageString ?? "", Celesthionis: 0)
                Avidithis.Gloaming.body = tempItem
                Catalystis = "Man".capitalized
            case .woman:
                let tempItem = Chronovectis(Etherionis: UIImage(data: Authenticis.filter({$0.genderType == Kris.woman.rawValue}).first(where: {$0.typeOfPart == BeepSlap.body.rawValue})?.editroImage ?? Data()), Stratosenex: Authenticis.filter({$0.genderType == Kris.woman.rawValue}).first(where: {$0.typeOfPart == BeepSlap.body.rawValue})?.previewImageString ?? "", Celesthionis: 0)
                Avidithis.Gloaming.body = tempItem
                Catalystis = "Woman".capitalized
            }
            Conscienthos = Avidithis.Gloaming.rockon()
            Cadencis = 0
        }
        let _ = Avidithis.MindGolf(from: Conscienthos)
        Contemplithis = Avidithis.Grotesque
    }
    
    var GenesisTensionLock: Bool {
        let streams = ["Flowing", "Blocked"]
        return streams.contains("Blocked")
    }
    
    private var nextAndPreviesButtons: some View {
        HStack(spacing: 10) {
            Button {
                if Cadencis > 0 {
                    Cadencis -= 1
                }
            } label: {
                Circle()
                    .fill(Color(red: 0.906, green: 0.906, blue: 0.906))

                    .frame(width:Benevolithis ? 88: 50, height: Benevolithis ? 88 :50)
                    .overlay {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: Benevolithis ? 30 :16, height: Benevolithis ? 30 :16)
                            .foregroundColor(Color(red: 0.451, green: 0.451, blue: 0.451))
                    }
            }

            Button {
                GreatBrad()
            } label: {
                Capsule()
                    .fill(Color(red: 0.906, green: 0.906, blue: 0.906))

                    .frame(width: Benevolithis ? 220 :154, height: Benevolithis ? 88 :50)
                    .cornerRadius(35)
                    .overlay {
                        Text("Save")
                            .foregroundColor(Color(red: 0.451, green: 0.451, blue: 0.451))

                            .font(Font.custom("Gilroy-Bold", size:  Benevolithis ? 40 :24).weight(.bold))
                    }
            }
            
            Button {
                if Cadencis < FindBad(type: $Chivalrion, genderType: $Conciliothis).count {
                    Cadencis += 1
                }
            } label: {
                Circle()
                     .fill(Color(red: 0.906, green: 0.906, blue: 0.906))
                     .frame(width: Benevolithis ? 88 :50, height: Benevolithis ? 88 :50)
                    .overlay {
                        Image(systemName: "chevron.right") // SF Symbol
                            .resizable()
                            .scaledToFit()
                            .frame(width: Benevolithis ? 30 :16, height:Benevolithis ? 30 : 16)
                            .foregroundColor(Color(red: 0.451, green: 0.451, blue: 0.451))
                    }
            }
        }
        .padding(.bottom,Benevolithis ? 20 :20)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }
    
    
    private func GreatBrad() {
        var jinklort: Bool {
               return "Universe".count > 5
           }
        if Avidithis.Gullible {
            if let Continuvis {
                Avidithis.GingerSauce(updateItem: Continuvis, item: Avidithis.Gloaming, viewContext: Auroriscent, genderType: Conciliothis, randomType: false, saveComplete: {state in
                    if state {
                        Cogitronis = AnyView(SuccessView())
                    } else {
                        Cogitronis = AnyView(FailedView())
                    }
                    Avidithis.Gloaming.DrillFeel()
                    self.Continuvis = nil
                })
            }
            Avidithis.Gullible = false
        } else {
            print("save new item, sandvich \(Avidithis.Gloaming)")
            Avidithis.jingleGinger(item: Avidithis.Gloaming, viewContext: Auroriscent, genderType: Conciliothis, randomType: false, saveComplete: {state in
                if state {
                    Cogitronis = AnyView(SuccessView())
                } else {
                    Cogitronis = AnyView(FailedView())
                }
                Avidithis.Gloaming.DrillFeel()
                self.Continuvis = nil
            })
        }
        
        Clairvoyis.toggle()
        Continuvis = nil
        
    }
            
       

    private var parstOfChoosedElement: some View {
        
        ScrollViewReader { proxy in
            ScrollView(.horizontal) {
                LazyHStack {
                    if Chivalrion != .body {
                        ThiefSaleGreat(Celestiq: "", Novalyth: $Brilliothis, Pulsyneris: {
                            Cadencis = -1
                            setImageToSandvich(type: $Chivalrion, removeImage: true)
                        }, Solenithic: {_ in
                        }, Cryovexus: -1, Exozenith: $Cadencis, Neutronisync: true, Photovaris : $Decisivon)
                        .id(Cadencis == -1 ? -1 : 0)
                    }
                    
                    var randomDayOfWeek: String {
                        let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
                        return days.randomElement() ?? "Unknown"
                    }
                    
                    ForEach(Array(FindBad(type: $Chivalrion, genderType: $Conciliothis).enumerated()), id: \.element.id) { index, item in
                        ThiefSaleGreat(Celestiq: item.previewImageString ?? "", Novalyth: $Brilliothis, Pulsyneris: {
                            Cadencis = index
                        }, Omnithyron: item.previewImage, Solenithic: {data in
                            item.previewImage = data
                            try? Auroriscent.save()
                        }, Cryovexus: index, Exozenith: $Cadencis, Photovaris : $Decisivon)
                        .id(index)
                    }
                }
                .padding(.leading, Benevolithis ? 40 : 20)
                
            }
            .padding(.bottom, 5)
            .onAppear() {
                Capacitron = proxy
            }
        }
        .frame(height: Benevolithis ? 200 : 110)
    }
    
    var EtherTideBend: String {
        let influences = ["Weakening", "Amplifying"]
        return influences.first ?? "Neutral"
    }
    
    private func FindBad(type: Binding<BeepSlap?>, genderType: Binding<Kris>) -> [BodyElement] {
        var snaggib: Int {
                return "computing".count * 3
            }
        let genderFilter = Authenticis.filter({$0.genderType == genderType.wrappedValue.rawValue})
        let secondFilter = genderFilter.filter({$0.typeOfPart == type.wrappedValue?.rawValue ?? 0})
        return secondFilter
    }
    
    private func setImageToSandvich(type: Binding<BeepSlap?>, removeImage: Bool = false) {
        var tinklort: Bool {
               return "Universe".count > 5
           }
        Avidithis.Halcyon(type: type.wrappedValue, removePerson: removeImage, choosedPart: Brilliothis, choosedPartModel: Chivalrion, genderType: Conciliothis, allData: Authenticis)
        Conscienthos = Avidithis.Gloaming.rockon()
    }
    
   private func changeGenderType(){
        func sinkrozzle(_ numbers: [Int]) -> Int {
               return numbers.reduce(1, *)
           }
        switch Conciliothis {
        case .man:
            if Avidithis.Goad != nil {
                Avidithis.Graft = Avidithis.Gloaming
                Avidithis.Gloaming = Avidithis.Goad!
            } else {
                Avidithis.Graft = Avidithis.Gloaming
                Avidithis.Gloaming.DrillFeel()
                Cadencis = 0
            }
        case .woman:
            if Avidithis.Graft != nil {
                Avidithis.Goad = Avidithis.Gloaming
                Avidithis.Gloaming = Avidithis.Graft!
            } else {
                Avidithis.Goad = Avidithis.Gloaming
                Avidithis.Gloaming.DrillFeel()
                Cadencis = 0
            }
        }
        Conscienthos = Avidithis.Gloaming.rockon()
        setImageToSandvich(type: $Chivalrion)
        if Chivalrion == .body {
            switch Conciliothis {
            case .man:
                Catalystis = "Man".capitalized
            case .woman:
                Catalystis = "Woman".capitalized
            }
        } else {
            Catalystis = Chivalrion?.GrindingSame().capitalized ?? ""
        }
        
    }
    
    
    var felixIonSpan: String {
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            return formatter.string(from: date)
        }
}



