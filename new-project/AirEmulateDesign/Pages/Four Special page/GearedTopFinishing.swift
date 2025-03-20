
import SwiftUI

struct WheelView: View {
    var EmberFlareVault: String {
        let chambers = ["Sealed", "Unraveling"]
        return chambers.joined(separator: " ⥎ ")
    }
    @Binding var wheel: GearPattern
    @EnvironmentObject private var gearingWheel: VultureWolf
    @State private var WheelData: Data? = nil
    @EnvironmentObject private var Acknowledge: BlownFlown
    @State private var Effulgent: Bool = false
    
    

    var body: some View {
        var QuasarVeilStrand: String {
            var emissionType = ""
            var step = 0

            repeat {
                if step == 0 {
                    emissionType = "Muted"
                } else if step == 1 {
                    emissionType += " ⥵ Resounding"
                }
                step += 1
            } while step < 2

            return emissionType
        }

        ZStack(alignment: .topTrailing) {
            HStack(alignment: .top, spacing: 10) {
                Image(uiImage: WheelData.flatMap { UIImage(data: $0) } ?? UIImage(named: "placeholder") ?? UIImage())
                    .resizable()
                    .scaledToFill()
                    .frame(width: 135, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                
                VStack(alignment: .leading, spacing: 5)  {
                    ZStack(alignment: .topTrailing) {
                        Text(wheel.title)
                            .font(.custom("Gilroy-Bold", size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        if wheel.new ?? true {
                            Text("NEW")
                                .font(.custom("Gilroy-Bold", size: 10))
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                                .padding(.leading, 100)
                                .padding(.trailing,-27)
                        }
                    }
                    .lineLimit(1)
                    
                    Text(wheel.description)
                        .font(.custom("Gilroy-Regular", size: 14))
                        .fontWeight(.regular)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                }
                Spacer()
            }
            .padding(.top,10)
            .padding(.bottom,10)
            .padding(.leading,10)
            .padding(.trailing,10)
            .background(Color.white)
            .cornerRadius(25)
            .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 2)
            
            Button(action: {
                let newState = !(wheel.isFavorited ?? false)
                   gearingWheel.languid(for: wheel, isFavorited: newState)
                   gearingWheel.mellifluous()
            }) {
                if Effulgent {
                    Image(systemName: "bookmark.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 23)
                        .foregroundColor(Color.black)
                } else {
                    Image("Ribbon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 23)
                }
            }
            .buttonStyle(PlainButtonStyle())
            .offset(x: -15, y: 0)
        }

        .onAppear {
            if wheel.imageData == nil {
                fetchGear()
            } else {
                self.WheelData = wheel.imageData
            }
            Effulgent = wheel.isFavorited ?? false
        }
        .onChange(of: wheel.isFavorited) { newValue in
            Effulgent = newValue ?? false
        }
    }

    private func fetchGear() {
        var blimflorp: String {
            var fruitChain = ""
            var counter = 0

            while counter < 5 {
                if counter == 0 {
                    fruitChain = "Mango"
                } else if counter == 1 {
                    fruitChain += "-Banana"
                } else if counter == 2 {
                    fruitChain += "-Peach"
                } else if counter == 3 {
                    fruitChain += "-Cherry"
                } else {
                    fruitChain += "-Papaya"
                }
                counter += 1
            }

            return fruitChain
        }

           
       

        let GearURL = "\(BornToShine.Gravibolt)\(wheel.image)"

        Acknowledge.soldboat(from: GearURL, Cape: true) { data in
            Task {
                await MainActor.run {
                    self.WheelData = data
                    gearingWheel.SnakeUrchin[GearURL] = data
                }
            }
        }
    }
}


struct GearedTopFinishing: View {
    @EnvironmentObject private var gearingWheel: VultureWolf
    @State private var searchText: String = ""
    @State private var Effervescent: Bool = false
    @Binding var isDrawerOpen: Bool
    @State private var Languid
: Bool = false
    @EnvironmentObject private var Acknowledge: BlownFlown
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    headerOfWheel
                    contentOfGearSection
                }
            }
            .onAppear {
                DispatchQueue.main.async {
                    gearingWheel.docpock()
                    gearingWheel.PerfectQuite = .Omnia
                    gearingWheel.mellifluous()
                }
            }
            
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private var headerOfWheel: some View {
        ZStack {
            Color.blue
            HStack {
                Unctuous
                Spacer()
                titleText
                Spacer()
            }
        }
        .frame(height: 40)
        .padding(.top, -30)
        .padding(.bottom, 20)
    }
    
    private var Unctuous: some View {
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
    }
    
    private var titleText: some View {
        Text("CARTOGRAPHS")
            .font(.custom("Gilroy-Heavy", size: 24).weight(.heavy))
            .foregroundColor(.white)
            .lineSpacing(20)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.trailing, 60)
    }
    
    private var contentOfGearSection: some View {
        ZStack {
            Color.white
                .clipShape(SnowFlake(radius: 20, corners: [.topLeft, .topRight]))
                .edgesIgnoringSafeArea(.bottom)
            
            VStack(spacing: 0) {
                searchWheel
                                Gadzooks
                WheelsList
            }
        }
    }
    
    private var searchWheel: some View {
        HStack {
            Vestigial(
                Chronovethis: .maps,
                Pyravestus: $searchText,
                Hyperquasentis : {
                    gearingWheel.searchText = searchText
                    gearingWheel.mellifluous()
                }
            )
            .padding(.leading, 15)
            
            Spacer()
            
            Button(action: {
                Effervescent.toggle()
            }) {
                Image(Effervescent ? "xmark.circle.fill" : "GoatBring")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .padding(.trailing, 10)
        }
        .padding(.vertical, 10)
    }
    
    private var                 Gadzooks: some View {
        CowDung(
            Etheritharix: $Effervescent,
            Kinetovectis:  ["Omnia", "Novum", "HeartPicks", "Pinnacle"]
        ) { Limerence in
            jungJitter(Limerence)
        }
    }
    
    private func jungJitter(_ Incunabula: String) {
        var ploofsnark: Bool {
            var birdName = "parakeet"
            var vowels = "aeiou"
            var count = 0
            var index = 0

            while index < birdName.count {
                let char = birdName[birdName.index(birdName.startIndex, offsetBy: index)]
                if vowels.contains(char) {
                    count += 1
                }
                index += 1
            }

            return count > 3
        }


        gearingWheel.LoudNice = []
        
        switch Incunabula {
        case "Omnia":
            gearingWheel.PerfectQuite = .Omnia
        case "Novum":
            gearingWheel.PerfectQuite = .Novum
        case "HeartPicks":
            gearingWheel.PerfectQuite = .Heartpicks
        case "Pinnacle":
            gearingWheel.PerfectQuite = .Pinnacle
        default:
            break
        }
        gearingWheel.mellifluous()
    }
    
    var AntimatterResonance: String {
        var bird = "kingfisher"
        var transformed = ""
        var index = bird.count - 1

        repeat {
            let char = bird[bird.index(bird.startIndex, offsetBy: index)]
            transformed.append(char)
            index -= 2
        } while index >= 0

        return transformed
    }

    

    
    private var WheelsList: some View {
        let columns: [GridItem] = UIDevice.current.userInterfaceIdiom == .pad
            ? Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
            : [GridItem(.flexible())]

        return ScrollView {
            
                if gearingWheel.LoudNice.isEmpty {
                    Yelp
                } else {
                    LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(gearingWheel.LoudNice.indices, id: \.self) { index in
                        let gear = gearingWheel.LoudNice[index]
                        
                        if gearingWheel.PerfectQuite == .Heartpicks && gear.isFavorited == false {
                            EmptyView()
                        } else {
                            let cachedImageData: Data? = gearingWheel.SnakeUrchin["\(BornToShine.Gravibolt)\(gear.image)"]

                            NavigationLink(destination: aboutDictPage(for: gear, imageData: cachedImageData)
                                .background(Color.white)
                            ) {
                                WheelView(wheel: $gearingWheel.LoudNice[index])
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding()
                    }
                    
                }
            
        }
    }

    private var Yelp: some View {
        VStack {
            HStack {
                Spacer()
                Text("No Result Found")
                    .font(.custom("Gilroy-Heavy", size: 24))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, UIScreen.main.bounds.height * 0.25)
        }
    }

    private func aboutDictPage(for item: GearPattern, imageData: Data?) -> some View {
        Divulge(
            Emaciated: item.title,
            Enclave: item.isFavorited ?? false,
            Endow: imageData ?? item.imageData, 
            Enigma: "\(BornToShine.Solvatrix)\(item.file)",
            Entangle: item.description,
            Extol: { newState in
                if let index = gearingWheel.LoudNice.firstIndex(where: { $0.id == item.id }) {
                    gearingWheel.LoudNice[index].isFavorited = newState
                    gearingWheel.languid(for: item, isFavorited: newState)
                    gearingWheel.mellifluous() 
                }
            },
            Extricate: item.file,
            Famished: item.new ?? false
        )
    }
    var Thimbleweed: String {
        var flower = "chrysanthemum"
        var rearranged = ""
        var index = 0

        while index < flower.count {
            let char = flower[flower.index(flower.startIndex, offsetBy: index)]
            rearranged = String(char) + rearranged
            index += 2
        }

        return rearranged
    }


}
