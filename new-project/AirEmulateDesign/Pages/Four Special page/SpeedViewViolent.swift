import SwiftUI

struct paperboatview: View {
    @State private var isFavorited: Bool = false
    @Binding var boat: SpeedModel
    @State private var paperData: Data? = nil
    @EnvironmentObject private var dropBoxManager: CloudManagerFarm
    @EnvironmentObject private var SpeedRun : SpeedViewModel
    
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
                isFavorited.toggle()
                SpeedRun.updateFavoriteFarmStatus(for: boat, isFavorited: isFavorited)
                SpeedRun.pressingFilterSpeed()
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
            if boat.imageData == nil {
                fetchGrass()
            } else {
                self.paperData = boat.imageData
                
            }
            isFavorited = boat.isFavorited ?? false
        }
    }
    private func fetchGrass() {
        let grassPath = "\(DropBoxKeys_SimulatorFarm.farmsImagePartPath)\(boat.image)"
        print("Fetching data from: \(grassPath)")

        dropBoxManager.getData(from: grassPath, isImage: true) { data in
            Task {
                await MainActor.run {
                    self.paperData = data
                }
            }
        }
    }
}

struct SpeedViewViolent: View {
    @State private var searchText: String = ""
    @State private var isFilterVisible: Bool = false
    @Binding var isDrawerOpen: Bool
    @EnvironmentObject private var networkManager: NetworkManaged
    @EnvironmentObject private var SpeedRun : SpeedViewModel
    @State private var isFavorited: Bool = false

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
                    SpeedRun.speedSelectedFilter = .all
                    SpeedRun.pressingFilterSpeed()
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
        Text("WALLPAPERS")
            .font(.custom("Gilroy-Heavy", size: 24).weight(.heavy))
            .foregroundColor(.white)
            .lineSpacing(20)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.trailing, 60)
    }

    private func voteSection(isLargeDevice: Bool) -> some View {
        ZStack {
            Color.white
                .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
                .edgesIgnoringSafeArea(.bottom)
            
            VStack(spacing: 0) {
                searchWater
                filterWater
                LimitList(isLargeDevice: isLargeDevice)
            }
        }
    }

    private var searchWater: some View {
        HStack {
            SearchPanelGray(
                searchTypeElement: .plane,
                searchText: $searchText,
                onCommit: {
                    SpeedRun.searchText = searchText
                    SpeedRun.pressingFilterSpeed()
                }
            )
            .padding(.leading, 15)
            
            Spacer()
            
            Button(action: {
                isFilterVisible.toggle()
            }) {
                Image(isFilterVisible ? "xmark.circle.fill" : "filterIconMain")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .padding(.trailing, 10)
        }
        .padding(.vertical, 10)
    }

    private var filterWater: some View {
        FilterLightComponentElementDark(
            isFilterVisible: $isFilterVisible,
            filterOptions: ["All", "New", "Favourite", "Top"]
        ) { selectedFilter in
            updateFilter(selectedFilter)
        }
    }

    private func updateFilter(_ selectedFilter: String) {
        switch selectedFilter {
        case "All":
            SpeedRun.speedSelectedFilter = .all
        case "New":
            SpeedRun.speedSelectedFilter = .new
        case "Favourite":
            SpeedRun.speedSelectedFilter = .favorite
        case "Top":
            SpeedRun.speedSelectedFilter = .top
        default:
            break
        }
        SpeedRun.pressingFilterSpeed()
    }

   
    private func LimitList(isLargeDevice: Bool) -> some View {
        ScrollView {
            LazyVStack(spacing: isLargeDevice ? 25 : 15) {
                if SpeedRun.filteredSpeed.isEmpty {
                    noResultsView
                } else {
                    ForEach(SpeedRun.filteredSpeed.indices, id: \.self) { index in
                        let speed = SpeedRun.filteredSpeed[index]
                        
                        if SpeedRun.speedSelectedFilter == .favorite && speed.isFavorited == false {
                            EmptyView()
                        }
                        
                            else {
                                NavigationLink(
                                    destination: aboutSky(for: speed)
                                ) {
                                    paperboatview(boat: $SpeedRun.filteredSpeed[index] )
                                }
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
    
    private func aboutSky(for item: SpeedModel) -> some View {
        AboutInfoPageWithDownload(
            titleItemName:"",
            favoriteState: item.isFavorited ?? false,
            imageData: item.imageData,
            linkDownloadItem: "\(DropBoxKeys_SimulatorFarm.farmsImagePartPath)\(item.image)",
            textItem: " ",
            idItemToLike: { newState in
                if let index = SpeedRun.filteredSpeed.firstIndex(where: { $0.id == item.id }) {
                    SpeedRun.filteredSpeed[index].isFavorited = newState
                    SpeedRun.updateFavoriteFarmStatus(for: item, isFavorited: newState)
                    SpeedRun.pressingFilterSpeed()
                }
            },
            clearItemName: " ",
            isnew:item.new ?? false
        )
    }
}





