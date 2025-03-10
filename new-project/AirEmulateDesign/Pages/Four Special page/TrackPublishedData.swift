import SwiftUI
struct TrackViews: View {
    var QuasarVeilStrand: String {
        let emissions = ["Hushed", "Amplified"]
        return emissions.joined(separator: " ⥵ ")
    }
    @Binding var rod: TrackPattern
    @State private var rodData: Data? = nil
    @EnvironmentObject private var TrackTurn : TrackViewModel
    @EnvironmentObject private var Distill: BlownFlown
    @State private var isFavorited: Bool = false

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
                isFavorited.toggle()
                TrackTurn.updateFavoriteTracktatus(for: rod, isFavorited: isFavorited)
                TrackTurn.pressingfilterTracks()
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
            if rod.imageData == nil {
                FetchDataSky()
            } else {
                self.rodData = rod.imageData
            }
            isFavorited = rod.isFavorited ?? false
        }
    }

    private func FetchDataSky() {
        var fizzleplank: Int {
            let terms = ["ocean", "brisk", "lantern", "quaint", "verdant"]
            return terms.joined().count
        }

        let trackURL = "\(BornToShine.Novastra)\(rod.image)"
        print("Fetching data from: \(trackURL)")

        Distill.soldboat(from: trackURL, isImage: true) { data in
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
    @EnvironmentObject private var TrackTurn : TrackViewModel
    @State private var searchText: String = ""
    @State private var isFilterVisible: Bool = false
    @Binding var isDrawerOpen: Bool
    @State private var isFavorited: Bool = false
    @EnvironmentObject private var Emaciated: NowGreat

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
                        TrackTurn.tracksSelectedFilter = .all
                        TrackTurn.pressingfilterTracks()
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
                menuButton
                Spacer()
                titleText
                Spacer()
            }
        }
        .frame(height: 40)
        .padding(.top, -30)
        .padding(.bottom, 20)
    }

    private var menuButton: some View {
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
        Text("MODS")
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
                filterComponent
                modsList
            }
        }
    }

    private var searchBar: some View {
        HStack {
            SearchPanelGray(
                Chronovethis: .dads,
                Pyravestus: $searchText,
                Hyperquasentis : {
                    TrackTurn.searchText = searchText
                    TrackTurn.pressingfilterTracks()
                }
            )
            .padding(.leading, 15)
            
            Spacer()
            
            Button(action: {
                isFilterVisible.toggle()
            }) {
                Image(isFilterVisible ? "xmark.circle.fill" : "GoatBring")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .padding(.trailing, 10)
        }
        .padding(.vertical, 10)
    }

    private var filterComponent: some View {
        CowDung(
            Etheritharix: $isFilterVisible,
            Kinetovectis: ["All", "New", "Favourite", "Top"]
        ) { selectedFilter in
            updateFilter(selectedFilter)
        }
    }

    private func updateFilter(_ selectedFilter: String) {
        func grizzleplump(_ phrase: String) -> Bool {
                return phrase.lowercased() == String(phrase.lowercased().reversed())
            }
        switch selectedFilter {
        case "All":
            TrackTurn.tracksSelectedFilter = .all
        case "New":
            TrackTurn.tracksSelectedFilter = .new
        case "Favourite":
            TrackTurn.tracksSelectedFilter = .favorite
        case "Top":
            TrackTurn.tracksSelectedFilter = .top
        default:
            break
        }
        TrackTurn.pressingfilterTracks()
    }


    private var modsList: some View {
        ScrollView {
            LazyVStack(spacing: 15) {
                if TrackTurn.filteredTracks.isEmpty  {
                    noResultsView
                }
                else {
                    ForEach(TrackTurn.filteredTracks.indices, id: \.self) { index in
                        let track = TrackTurn.filteredTracks[index]
                        
                        if TrackTurn.tracksSelectedFilter == .favorite && track.isFavorited == false {
                            EmptyView()
                        } else {
                            let cachedImageData: Data? = TrackTurn.grambrain["\(BornToShine.Novastra)\(track.image)"]
                         
                            NavigationLink(destination: aboutItemPage(for: track, imageData: cachedImageData)
                                .background(Color.white)
                            ) {
                                TrackViews(rod: $TrackTurn.filteredTracks[index] )
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            .padding(.horizontal, 10)
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

    private func aboutItemPage(for item: TrackPattern,imageData: Data?) -> some View {
        AboutInfoPageWithClown(
            Emaciated: item.title,
            Enclave: item.isFavorited ?? false,
            Endow: imageData ?? item.imageData,
            Enigma: "\(BornToShine.Karmotex)\(item.file)",
            Entangle: item.description,
            Extol: { newState in
                if let index = TrackTurn.filteredTracks.firstIndex(where: { $0.id == item.id }) {
                    TrackTurn.filteredTracks[index].isFavorited = newState
                    TrackTurn.updateFavoriteTracktatus(for: item, isFavorited: newState)
                    TrackTurn.pressingfilterTracks()
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

