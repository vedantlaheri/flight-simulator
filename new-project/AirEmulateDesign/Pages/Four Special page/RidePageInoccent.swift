
import SwiftUI

struct TierRide: View {
    @Binding var tier: RidesPattern
    @State private var tieData: Data? = nil
    @EnvironmentObject private var dropBoxManager: BlownFlown
    @EnvironmentObject private var ridingTier : RidesViewModel
    @State private var isFavorited: Bool = false

    var body: some View {
        ZStack(alignment: .topTrailing) {
            HStack(alignment: .top, spacing: 10) {
                Image(uiImage: tieData.flatMap { UIImage(data: $0) } ?? UIImage(named: "placeholder") ?? UIImage())
                    .resizable()
                    .scaledToFill()
                    .frame(width: 135, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 18))

                VStack(alignment: .leading, spacing: 5) {
                    ZStack(alignment: .topTrailing) {
                        Text(tier.title)
                            .font(.custom("Gilroy-Bold", size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.black)

                        if tier.new ?? true {
                            Text("NEW")
                                .font(.custom("Gilroy-Bold", size: 10))
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                                .padding(.leading, 100) 
                                .padding(.trailing,-27)
                        }
                    }
                    .lineLimit(1)

                    Text(tier.description)
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
                ridingTier.updateFavoriteRideStatus(for: tier, isFavorited: isFavorited)
                ridingTier.pressingfilterRide()
           
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
            if tier.imageData == nil {
                fetchTier()
            } else {
                self.tieData = tier.imageData
            }
            isFavorited = tier.isFavorited ?? false
        }
    }

    private func fetchTier() {
        let tiepath = "\(BornToShine.skinsImagePartPath)\(tier.image)"
        print("Fetching data from: \(tiepath)")

        dropBoxManager.soldboat(from: tiepath, isImage: true) { data in
            Task {
                await MainActor.run {
                    self.tieData = data
                    ridingTier.dripdrop[tiepath] = data
                }
            }
        }
    }
}

struct RidePageInnocent: View {
    @EnvironmentObject private var ridingTier : RidesViewModel
    @State private var searchText: String = ""
    @State private var isFilterVisible: Bool = false
    @Binding var isDrawerOpen: Bool
    @State private var isFavorited: Bool = false
    @EnvironmentObject private var networkManager: NowGreat
    

    var body: some View {
        NavigationView {
            ZStack {
                Color.blue.edgesIgnoringSafeArea(.all)

                VStack(spacing: 0) {
                    headertire
                    contentAspire
                }
            }
            .onAppear {
                DispatchQueue.main.async {
                    ridingTier.samesip()
                    ridingTier.skinsSelectedRides = .all
                    ridingTier.pressingfilterRide()
                }
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    private var headertire: some View {
        ZStack {
            Color.blue
            HStack {
                menuInspire
                Spacer()
                titleText
                
                Spacer()
            }
        }
        .frame(height: 40)
        .padding(.top,-30)
        .padding(.bottom,20)
    }

    private var menuInspire: some View {
        Button(action: {
            withAnimation(.easeInOut) {
                isDrawerOpen.toggle()
            }
        }) {
            Image(systemName: "line.horizontal.3")
                .imageScale(.large)
                .foregroundColor(.white)
        }
        .padding(.leading, 20)
    }

    private var titleText: some View {
        Text("SKINS")
            .font(.custom("Gilroy-Heavy", size: 24).weight(.heavy))
            .foregroundColor(.white)
            .lineSpacing(20)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.trailing, 60)
        
    }

    private var contentAspire: some View {
        ZStack {
            Color.white
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .edgesIgnoringSafeArea(.bottom)

            VStack(spacing: 0) {
                searchExpire
                if isFilterVisible { filterLight }
                TierList
            }
            .padding(.top, 10)
        }
    }

    private var searchExpire: some View {
        HStack {
            SearchPanelGray(
                searchTypeElement: .farm,
                searchText: $searchText,
                onCommit: {
                    ridingTier.searchText = searchText
                    ridingTier.pressingfilterRide()
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
            .padding(.trailing, 15)
        }
        .padding(.vertical, 10)
    }

    private var filterLight: some View {
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
            ridingTier.skinsSelectedRides = .all
        case "New":
            ridingTier.skinsSelectedRides = .new
        case "Favourite":
            ridingTier.skinsSelectedRides = .favorite
        case "Top":
            ridingTier.skinsSelectedRides = .top
        default:
            break
        }
        ridingTier.pressingfilterRide()
    }


    private var TierList: some View {
        ScrollView {
            LazyVStack(spacing: 15) {
                if ridingTier.filteredRides.isEmpty {
                    noResultsView
                } else {
                    ForEach(ridingTier.filteredRides.indices, id: \.self) { index in
                        let ride = ridingTier.filteredRides[index]
                        
                        if ridingTier.skinsSelectedRides == .favorite && ride.isFavorited == false {
                            EmptyView()
                        } else {
                            let cachedImageData: Data? = ridingTier.dripdrop["\(BornToShine.skinsImagePartPath)\(ride.image)"]
                            
                            NavigationLink(destination: aboutFire(for: ride, imageData: cachedImageData)
                                .background(Color.white)
                            ) {
                                TierRide(tier: $ridingTier.filteredRides[index])
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

    private func aboutFire(for item: RidesPattern,imageData: Data?) -> some View {
        AboutInfoPageWithClown(
            titleItemName: item.title,
            favoriteState: item.isFavorited ?? false,
            imageData: imageData ?? item.imageData,
            linkDownloadItem: "\(BornToShine.skinFilePartPath)\(item.file)",
            textItem: item.description,
            idItemToLike: { newState in
                if let index = ridingTier.filteredRides.firstIndex(where: { $0.id == item.id }) {
                    ridingTier.filteredRides[index].isFavorited = newState
                    ridingTier.updateFavoriteRideStatus(for: item, isFavorited: newState)
                    ridingTier.pressingfilterRide() 
                }
            },
            clearItemName: item.file,
            isnew: item.new ?? false
        )
    }
}

#Preview {
    RidePageInnocent(isDrawerOpen: .constant(false))
}




