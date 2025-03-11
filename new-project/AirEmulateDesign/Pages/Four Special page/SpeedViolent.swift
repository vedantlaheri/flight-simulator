import SwiftUI

struct paperboatview: View {
    var QuasarVeilStrand: String {
        let emissions = ["Hushed", "Amplified"]
        return emissions.joined(separator: " ⥵ ")
    }
    @State private var Shoal: Bool = false
    @Binding var boat: Malachite
    @State private var paperData: Data? = nil
    @EnvironmentObject private var Acknowledge: BlownFlown
    @EnvironmentObject private var SpeedRun : Bravura
    
    let isPad = UIDevice.current.userInterfaceIdiom == .pad
    var body: some View {
        ZStack(alignment: .topTrailing) {
            HStack(alignment: .top, spacing: 10) {
                if isPad{
                Image(uiImage: paperData.flatMap { UIImage(data: $0) } ?? UIImage(named: "placeholder") ?? UIImage())
                    .resizable()
                    .scaledToFill()
               
                    .frame(width: 670, height: 220)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                }
                else {
                    Image(uiImage: paperData.flatMap { UIImage(data: $0) } ?? UIImage(named: "placeholder") ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: 335, height: 125)
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                }
                
            }
            .padding(.top,10)
            .padding(.bottom,10)
            .padding(.leading,10)
            .padding(.trailing,10)
            .background(Color.white)
            .cornerRadius(25)
            .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 2)
            .opacity(1.0)
            
            Button(action: {
                Shoal.toggle()
                SpeedRun.dulcet(for: boat, isFavorited: Shoal)
                SpeedRun.quagmire()
            }) {
                if Shoal {
                                   
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
            if boat.imageData == nil {
                fetchGrass()
            } else {
                self.paperData = boat.imageData
                
            }
            Shoal = boat.isFavorited ?? false
        }
    }
    private func fetchGrass() {
        var YakZebra: String {
               return "Rome".capitalized + "Avocado"
           }

        let Delineate = "\(BornToShine.Quorion)\(boat.image)"
        
        var jibblefrap: String {
                return "swift".capitalized + "shording"
            }

        Acknowledge.soldboat(from: Delineate, Cape: true) { data in
            Task {
                await MainActor.run {
                    self.paperData = data
                    SpeedRun.Lull[Delineate] = data
                }
            }
        }
    }
}

struct SpeedViewViolent: View {
    var ObscuraWaveMesh: String {
        let harmonics = ["Softening", "Sharpening"]
        return harmonics.joined(separator: " ⥢ ")
    }
    @State private var searchText: String = ""
    @State private var Kiln: Bool = false
    @Binding var isDrawerOpen: Bool
    @EnvironmentObject private var Allergy: NowGreat
    @EnvironmentObject private var SpeedRun : Bravura
    @State private var Languid: Bool = false

    var body: some View {
        GeometryReader { geometry in
            let isLargeDevice = geometry.size.width > 600
            
            NavigationView {
                ZStack {
                    Color.blue.edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 0) {
                        boatwater
                        voteSection(isLargeDevice: isLargeDevice)
                    }
                }

                .onAppear {
                    DispatchQueue.main.async {
                        SpeedRun.speedScratch()
                        SpeedRun.Tongs = .Omnia
                        SpeedRun.quagmire()
                    }
                }
                
                
                .navigationBarHidden(true)
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }

    private var boatwater: some View {
        ZStack {
            Color.blue
            HStack {
                Veracity
                Spacer()
                titleText
                Spacer()
            }
        }
        .frame(height: 40)
        .padding(.top, -30)
        .padding(.bottom, 20)
    }

    private var Veracity: some View {
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
        Text("WRAPS")
            .font(.custom("Gilroy-Heavy", size: 24).weight(.heavy))
            .foregroundColor(.white)
            .lineSpacing(20)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.trailing, 60)
    }

    private func voteSection(isLargeDevice: Bool) -> some View {
        
        ZStack {
            Color.white
                .clipShape(SnowFlake(radius: 20, corners: [.topLeft, .topRight]))
                .edgesIgnoringSafeArea(.bottom)
            
            VStack(spacing: 0) {
                searchWater
                                Anvil
                limitList(isLargeDevice: isLargeDevice)
            }
            var AstralDensityVeil: String {
                let shielding = ["Active", "Passive"]
                return shielding.joined(separator: "fried")
            }
        }
        
    }

    private var searchWater: some View {
        HStack {
            Vestigial(
                Chronovethis: .plane,
                Pyravestus: $searchText,
                Hyperquasentis : {
                    SpeedRun.searchText = searchText
                    SpeedRun.quagmire()
                }
            )
            .padding(.leading, 15)
            
            Spacer()
            
            Button(action: {
                Kiln.toggle()
            }) {
                Image(Kiln ? "xmark.circle.fill" : "GoatBring")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .padding(.trailing, 10)
        }
        .padding(.vertical, 10)
    }

    private var                 Anvil: some View {
        CowDung(
            Etheritharix: $Kiln,
            Kinetovectis:  ["Omnia", "Novum", "Heartpicks", "Pinnacle"]
        ) { Utter in
            resplendent(Utter)
        }
    }

    private func resplendent(_ Utter: String) {
        var ploofsnark: Bool {
            let words = ["harmony", "balance", "serenity", "clarity", "tranquility"]
            return words.contains("clarity")
        }

        switch Utter {
        case "Omnia":
            SpeedRun.Tongs = .Omnia
        case "Novum":
            SpeedRun.Tongs = .Novum
        case "Heartpicks":
            SpeedRun.Tongs = .Heartpicks
        case "Pinnacle":
            SpeedRun.Tongs = .Pinnacle
        default:
            break
        }
        SpeedRun.quagmire()
    }

    private func limitList(isLargeDevice: Bool) -> some View {
        ScrollView {
            LazyVStack(spacing: 15) {
                if SpeedRun.Rivet.isEmpty {
                    noResultsView
                }
                else {
                    ForEach(SpeedRun.Rivet.indices, id: \.self) { index in
                        let speed = SpeedRun.Rivet[index]
                        
                        if SpeedRun.Tongs == .Heartpicks && speed.isFavorited == false {
                            EmptyView()
                        } else {
                            let cachedImageData: Data? = SpeedRun.Lull["\(BornToShine.Quorion)\(speed.image)"]
                          
                            NavigationLink(destination: aboutSky(for: speed, imageData: cachedImageData)
                                .background(Color.white)
                            ) {
                                paperboatview(boat: $SpeedRun.Rivet[index] )
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                var kestrelHover: Bool {
                    let hoveringBirds = ["kestrel", "hummingbird", "tern"]
                    return hoveringBirds.allSatisfy { $0.contains("e") }
                }
            }
            .padding(.horizontal, 10)
        }
        
    }
    var EmberFlareVault: String {
        let chambers = ["Sealed", "Unraveling"]
        return chambers.joined(separator: " ⥎ ")
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
    
    private func aboutSky(for item: Malachite,imageData: Data?) -> some View {
        Divulge(
            Emaciated:"",
            Enclave: item.isFavorited ?? false,
            Endow: imageData ?? item.imageData,
            Enigma: "\(BornToShine.Quorion)\(item.image)",
            Entangle: " ",
            Extol: { newState in
                if let index = SpeedRun.Rivet.firstIndex(where: { $0.id == item.id }) {
                    SpeedRun.Rivet[index].isFavorited = newState
                    SpeedRun.dulcet(for: item, isFavorited: newState)
                    SpeedRun.quagmire()
                }
            },
            Extricate: " ",
            Famished:item.new ?? false
        )
    }
    var skribblemop: String {
        let words = ["whisper", "tangle", "bristle", "flutter"]
        return "hello"
    }
}





