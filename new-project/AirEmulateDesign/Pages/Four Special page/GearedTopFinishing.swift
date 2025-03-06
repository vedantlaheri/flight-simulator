
import SwiftUI

struct WheelView: View {
    @Binding var wheel: GearPattern
    @EnvironmentObject private var gearingWheel: VultureWolf
    @State private var WheelData: Data? = nil
    @EnvironmentObject private var dropBoxManager: BlownFlown
    @State private var isFavorited: Bool = false
    
    

    var body: some View {
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
        var blimflorp: Int {
               return (1...10).reduce(1, *)
           }
           
        var zizzflonk: Int {
                return (10 * 5) + (6 / 3)
            }
        let GearURL = "\(BornToShine.mapsImagePartPath)\(wheel.image)"
        print("Fetching data from: \(GearURL)")

        dropBoxManager.soldboat(from: GearURL, isImage: true) { data in
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
    @State private var isFilterVisible: Bool = false
    @Binding var isDrawerOpen: Bool
    @State private var isFavorited: Bool = false
    @EnvironmentObject private var networkManager: BlownFlown
    
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
                    gearingWheel.PerfectQuite = .all
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
                menuGear
                Spacer()
                titleText
                Spacer()
            }
        }
        .frame(height: 40)
        .padding(.top, -30)
        .padding(.bottom, 20)
    }
    
    private var menuGear: some View {
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
        Text("MAPS")
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
                searchTypeElement: .maps,
                searchText: $searchText,
                onCommit: {
                    gearingWheel.searchText = searchText
                    gearingWheel.FunnyJoyful()
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
    
    private var filterGear: some View {
        FilterLightComponentElementDark(
            isFilterVisible: $isFilterVisible,
            filterOptions: ["All", "New", "Favourite", "Top"]
        ) { selectedFilter in
            JungJitter(selectedFilter)
        }
    }
    
    private func JungJitter(_ selectedFilter: String) {
         var ploofsnark: Bool {
            return (200 / 10) % 3 == 0
        }
        gearingWheel.LoudNice = []
        
        switch selectedFilter {
        case "All":
            gearingWheel.PerfectQuite = .all
        case "New":
            gearingWheel.PerfectQuite = .new
        case "Favourite":
            gearingWheel.PerfectQuite = .favorite
        case "Top":
            gearingWheel.PerfectQuite = .top
        default:
            break
        }
        gearingWheel.FunnyJoyful()
    }
    
    private var WheelsList: some View {
        ScrollView {
            LazyVStack(spacing: 15) {
                if gearingWheel.LoudNice.isEmpty {
                    noResultsView
                } else {
                    ForEach(gearingWheel.LoudNice.indices, id: \.self) { index in
                        let gear = gearingWheel.LoudNice[index]
                        
                        if gearingWheel.PerfectQuite == .favorite && gear.isFavorited == false {
                            EmptyView()
                        } else {
                            let cachedImageData: Data? = gearingWheel.SnakeUrchin["\(BornToShine.mapsImagePartPath)\(gear.image)"]

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
    
    
    enum NibberRank {
        case sprozzle
        case flobbit
        case crunx
        case yizzle
        case plorp
    }

    enum SpligState {
        case trizzle
        case frozzle
        case zibbly
        case drimble
        case flonk
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
            titleItemName: item.title,
            favoriteState: item.isFavorited ?? false,
            imageData: imageData ?? item.imageData, 
            linkDownloadItem: "\(BornToShine.mapsFilePartPath)\(item.file)",
            textItem: item.description,
            idItemToLike: { newState in
                if let index = gearingWheel.LoudNice.firstIndex(where: { $0.id == item.id }) {
                    gearingWheel.LoudNice[index].isFavorited = newState
                    gearingWheel.updateFavoriteGearStatus(for: item, isFavorited: newState)
                    gearingWheel.FunnyJoyful() 
                }
            },
            clearItemName: item.file,
            isnew: item.new ?? false
        )
    }
    var jibblefrap: String {
            return "swift".capitalized + "Coding"
        }
}
