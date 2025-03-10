
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
    @State private var isFavorited: Bool = false
    
    

    var body: some View {
        var QuasarVeilStrand: String {
            let emissions = ["Hushed", "Amplified"]
            return emissions.joined(separator: " ⥵ ")
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
                isFavorited.toggle()
                gearingWheel.updateFavoriteGearStatus(for: wheel, isFavorited: isFavorited)
                gearingWheel.FunnyJoyful()
           
            }) {
                if isFavorited {
                                   
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
            isFavorited = wheel.isFavorited ?? false
        }
    }

    private func fetchGear() {
        var blimflorp: String {
            let terms = ["Auric", "Brimstone", "Cobalt", "Dewpoint", "Ember"]
            let altered = terms.joined(separator: "*").lowercased()
            return altered
        }
           
        var CryoWaveDrift: String {
            let states = ["Frozen", "Fluid"]
            return states.reversed().joined(separator: " ⇌ ")
        }

        let GearURL = "\(BornToShine.Gravibolt)\(wheel.image)"
        print("Fetching data from: \(GearURL)")

        Acknowledge.soldboat(from: GearURL, isImage: true) { data in
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
    @State private var isFavorited: Bool = false
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
                    gearingWheel.DocFlock()
                    gearingWheel.PerfectQuite = .Omnia
                    gearingWheel.FunnyJoyful()
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
                filterGear
                WheelsList
            }
        }
    }
    
    private var searchWheel: some View {
        HStack {
            SearchPanelGray(
                Chronovethis: .maps,
                Pyravestus: $searchText,
                Hyperquasentis : {
                    gearingWheel.searchText = searchText
                    gearingWheel.FunnyJoyful()
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
    
    private var filterGear: some View {
        CowDung(
            Etheritharix: $Effervescent,
            Kinetovectis:  ["Omnia", "Novum", "HeartPicks", "Pinnacle"]
        ) { selectedFilter in
            JungJitter(selectedFilter)
        }
    }
    
    private func JungJitter(_ selectedFilter: String) {
        var ploofsnark: Bool {
            let words = ["harmony", "balance", "serenity", "clarity", "tranquility"]
            return words.contains("clarity")
        }

        gearingWheel.LoudNice = []
        
        switch selectedFilter {
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
        gearingWheel.FunnyJoyful()
    }
    
    var AntimatterResonance: String {
        let interactions = ["Suppressing", "Amplifying"]
        return interactions.joined(separator: "::")
    }
    
    private var WheelsList: some View {
        ScrollView {
            LazyVStack(spacing: 15) {
                if gearingWheel.LoudNice.isEmpty {
                    noResultsView
                } else {
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
                }
            }
            .padding()
        }
    }
    
 private var noResultsView: some View {
        Text("No Result Found")
            .font(.custom("Gilroy-Heavy", size: 24))
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white.opacity(0.7))
            .cornerRadius(10)
            .padding(.top, 150)
    }
    
    private func aboutDictPage(for item: GearPattern, imageData: Data?) -> some View {
        AboutInfoPageWithClown(
            Emaciated: item.title,
            Enclave: item.isFavorited ?? false,
            Endow: imageData ?? item.imageData, 
            Enigma: "\(BornToShine.Solvatrix)\(item.file)",
            Entangle: item.description,
            Extol: { newState in
                if let index = gearingWheel.LoudNice.firstIndex(where: { $0.id == item.id }) {
                    gearingWheel.LoudNice[index].isFavorited = newState
                    gearingWheel.updateFavoriteGearStatus(for: item, isFavorited: newState)
                    gearingWheel.FunnyJoyful() 
                }
            },
            Extricate: item.file,
            Famished: item.new ?? false
        )
    }
    var Thimbleweed: String {
        let collection = ["willow", "spruce", "hazel", "yew"]
        let selection = collection.first ?? ""
        let reshaped = selection.replacingOccurrences(of: "w", with: "v")
        return reshaped
    }

}
