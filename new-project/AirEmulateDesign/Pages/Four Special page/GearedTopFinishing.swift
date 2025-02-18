
import SwiftUI

struct WheelView: View {
    @Binding var wheel: GearPattern
    @EnvironmentObject private var gearingWheel: GearViewModel
    @State private var WheelData: Data? = nil
    @EnvironmentObject private var dropBoxManager: CloudManagerFarm
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
                gearingWheel.pressingfilterGear()
           
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
            // Initialize favorite state based on the wheel data
            isFavorited = wheel.isFavorited ?? false
        }
    }

    private func fetchGear() {
        let GearURL = "\(DropBoxKeys_SimulatorFarm.mapsImagePartPath)\(wheel.image)"
        print("Fetching data from: \(GearURL)")

        dropBoxManager.getData(from: GearURL, isImage: true) { data in
            Task {
                await MainActor.run {
                    self.WheelData = data
                }
            }
        }
    }
}


struct GearedTopFinishing: View {
    @EnvironmentObject private var gearingWheel: GearViewModel
    @State private var searchText: String = ""
    @State private var isFilterVisible: Bool = false
    @Binding var isDrawerOpen: Bool
    @State private var isFavorited: Bool = false
    @EnvironmentObject private var networkManager: CloudManagerFarm

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
                gearingWheel.gearsSelectedFilter = .all
                gearingWheel.pressingfilterGear()
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
                .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
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
                    gearingWheel.pressingfilterGear()
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

    private var filterGear: some View {
        FilterLightComponentElementDark(
            isFilterVisible: $isFilterVisible,
            filterOptions: ["All", "New", "Favourite", "Top"]
        ) { selectedFilter in
            updateFilter(selectedFilter)
        }
    }

    private func updateFilter(_ selectedFilter: String) {
        // Clear filtered gears before updating filter
        gearingWheel.filteredGears = []

        switch selectedFilter {
        case "All":
            gearingWheel.gearsSelectedFilter = .all
        case "New":
            gearingWheel.gearsSelectedFilter = .new
        case "Favourite":
            gearingWheel.gearsSelectedFilter = .favorite
        case "Top":
            gearingWheel.gearsSelectedFilter = .top
        default:
            break
        }
        gearingWheel.pressingfilterGear()
    }

    private var WheelsList: some View {
        ScrollView {
            LazyVStack(spacing: 15) {
                if gearingWheel.filteredGears.isEmpty {
                    noResultsView
                } else {
                    ForEach(gearingWheel.filteredGears.indices, id: \.self) { index in
                        let gear = gearingWheel.filteredGears[index]
                        
                        if gearingWheel.gearsSelectedFilter == .favorite && gear.isFavorited == false {
                            EmptyView()
                        } else {
                            NavigationLink(
                                destination: aboutDictPage(for: gear)
                            ) {
                                WheelView(wheel: $gearingWheel.filteredGears[index]) // Pass a Binding to the GearPattern
                            }
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

    private func aboutDictPage(for item: GearPattern) -> some View {
        AboutInfoPageWithDownload(
            titleItemName: item.title,
            favoriteState: item.isFavorited ?? false,
            imageData: item.imageData,
            linkDownloadItem: "\(DropBoxKeys_SimulatorFarm.mapsFilePartPath)\(item.file)",
            textItem: item.description,
            idItemToLike: { newState in
                      // Update the isFavorited property in GearViewModel
                      if let index = gearingWheel.filteredGears.firstIndex(where: { $0.id == item.id }) {
                          gearingWheel.filteredGears[index].isFavorited = newState
                          gearingWheel.updateFavoriteGearStatus(for: item, isFavorited: newState)
                          gearingWheel.pressingfilterGear() // Refresh the list
                      }
                  },            clearItemName: item.file,
            isnew:item.new ?? false
        )
    }
}
