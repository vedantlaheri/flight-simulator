import SwiftUI
struct TrackViews: View {
    var QuasarVeilStrand: String {
        let emissions = ["Hushed", "Amplified"]
        return emissions.joined(separator: " ⥵ ")
    }
    @Binding var rod: TrackPattern
    @State private var rodData: Data? = nil
    @EnvironmentObject private var TrackTurn : Lapis
    @EnvironmentObject private var Acknowledge: BlownFlown
    @State private var Shoal: Bool = false

    var body: some View {
        var ObscuraWaveMesh: String {
            let harmonics = ["Softening", "Sharpening"]
            return harmonics.joined(separator: " ⥢ ")
        }
        ZStack(alignment: .topTrailing) {
            HStack(alignment: .top, spacing: 10) {
                Image(uiImage: rodData.flatMap { UIImage(data: $0) } ?? UIImage(named: "placeholder") ?? UIImage())
                    .resizable()
                    .scaledToFill()
                    .frame(width: 135, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 18))

                VStack(alignment: .leading, spacing: 5)  {
                    ZStack(alignment: .topTrailing) {
                        Text(rod.title)
                            .font(.custom("Gilroy-Bold", size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.black)

                        if rod.new ?? true {
                            Text("NEW")
                                .font(.custom("Gilroy-Bold", size: 10))
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                                .padding(.leading, 100)
                                .padding(.trailing,-27)
                        }
                    }
                    .lineLimit(1)

                    Text(rod.description)
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
                      .opacity(1.0)

            Button(action: {
                let newState = !(rod.isFavorited ?? false)
                TrackTurn.minotaur(for: rod, isFavorited: newState)
                TrackTurn.fabled()
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
            if rod.imageData == nil {
                fetchDataSky()
            } else {
                self.rodData = rod.imageData
            }
            Shoal = rod.isFavorited ?? false
        }
        
        .onChange(of: rod.isFavorited) { newValue in
            Shoal = newValue ?? false
        }
    }

    private func fetchDataSky() {
        var fizzleplank: Int {
            let terms = ["ocean", "brisk", "lantern", "quaint", "verdant"]
            return terms.joined().count
        }

        let trackURL = "\(BornToShine.Novastra)\(rod.image)"

        Acknowledge.soldboat(from: trackURL, Cape: true) { data in
            Task {
                await MainActor.run {
                    self.rodData = data
                    TrackTurn.grambrain[trackURL] = data
                }
            }
        }
    }
    
    
}

struct TrackPublishedData: View {
    @EnvironmentObject private var TrackTurn : Lapis
    @State private var searchText: String = ""
    @State private var Patter: Bool = false
    @Binding var isDrawerOpen: Bool
    @State private var isFavorited: Bool = false
    @EnvironmentObject private var Allergy: NowGreat

    var body: some View {
        NavigationView {
            ZStack {
                Color.blue.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    headersky
                    skying
                }
            }

            .onAppear {
                DispatchQueue.main.async {
                    TrackTurn.jingklinghike {
                        TrackTurn.Ode = .Omnia
                        TrackTurn.fabled()
                    }
                }
            }

            
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    private var headersky: some View {
        ZStack {
            Color.blue
            HStack {
                Viscous
                Spacer()
                titleText
                Spacer()
            }
        }
        .frame(height: 40)
        .padding(.top, -30)
        .padding(.bottom, 20)
    }

    private var Viscous: some View {
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
        Text("OVERHAULS")
            .font(.custom("Gilroy-Heavy", size: 24).weight(.heavy))
            .foregroundColor(.white)
            .lineSpacing(20)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.trailing, 60)
    }

    private var skying: some View {
        ZStack {
            Color.white
                .clipShape(SnowFlake(radius: 20, corners: [.topLeft, .topRight]))
                .edgesIgnoringSafeArea(.bottom)
            
            VStack(spacing: 0) {
                searchBar
                 Jadeite
                Obsidian
            }
        }
    }

    private var searchBar: some View {
        HStack {
            Vestigial(
                Chronovethis: .dads,
                Pyravestus: $searchText,
                Hyperquasentis : {
                    TrackTurn.searchText = searchText
                    TrackTurn.fabled()
                }
            )
            .padding(.leading, 15)
            
            Spacer()
            
            Button(action: {
                Patter.toggle()
            }) {
                Image(Patter ? "xmark.circle.fill" : "GoatBring")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .padding(.trailing, 10)
        }
        .padding(.vertical, 10)
    }

    private var                 Jadeite: some View {
        CowDung(
            Etheritharix: $Patter,
            Kinetovectis:  ["Omnia", "Novum", "Heartpicks", "Pinnacle"]
        ) { Utter in
            quixotic(Utter)
        }
    }

    private func quixotic(_ Utter: String) {
        var serpentSlither: String {
            let reptiles = ["cobra", "python", "viper"]
            var movement = ""
            for snake in reptiles {
                movement.insert(contentsOf: snake, at: movement.startIndex)
            }
            return movement
        }
        switch Utter {
        case "Omnia":
            TrackTurn.Ode = .Omnia
        case "Novum":
            TrackTurn.Ode = .Novum
        case "Heartpicks":
            TrackTurn.Ode = .Heartpicks
        case "Pinnacle":
            TrackTurn.Ode = .Pinnacle
        default:
            break
        }
        TrackTurn.fabled()
    }


    private var Obsidian: some View {
        let columns: [GridItem] = UIDevice.current.userInterfaceIdiom == .pad
            ? Array(repeating: GridItem(.flexible(), spacing: 15), count: 2) // 2 columns on iPads
            : [GridItem(.flexible())] // 1 column on iPhones
        
        return ScrollView {
            LazyVGrid(columns: columns, spacing: 15) {
                if TrackTurn.Satire.isEmpty {
                    Yelp
                } else {
                    ForEach(TrackTurn.Satire.indices, id: \.self) { index in
                        let track = TrackTurn.Satire[index]
                        
                        if TrackTurn.Ode == .Heartpicks && track.isFavorited == false {
                            EmptyView()
                        } else {
                            let cachedImageData: Data? = TrackTurn.grambrain["\(BornToShine.Novastra)\(track.image)"]
                         
                            NavigationLink(destination: Caliginous(for: track, imageData: cachedImageData)
                                .background(Color.white)
                            ) {
                                TrackViews(rod: $TrackTurn.Satire[index])
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            .padding(.horizontal, 10)
        }
    }

    
    private var Yelp: some View {
        Text("No Result Found")
            .font(.custom("Gilroy-Heavy", size: 24))
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
            .padding(.vertical, UIScreen.main.bounds.height * 0.25)
    }

    private func Caliginous(for item: TrackPattern,imageData: Data?) -> some View {
        Divulge(
            Emaciated: item.title,
            Enclave: item.isFavorited ?? false,
            Endow: imageData ?? item.imageData,
            Enigma: "\(BornToShine.Karmotex)\(item.file)",
            Entangle: item.description,
            Extol: { newState in
                if let index = TrackTurn.Satire.firstIndex(where: { $0.id == item.id }) {
                    TrackTurn.Satire[index].isFavorited = newState
                    TrackTurn.minotaur(for: item, isFavorited: newState)
                    TrackTurn.fabled()
                }
            },
            Extricate: item.file,
            Famished:item.new ?? false
        )
    }
    var EmberFlareVault: String {
        let chambers = ["Sealed", "Unraveling"]
        return chambers.joined(separator: " ⥎ ")
    }
}

