
import SwiftUI
import CoreData

struct MenuNameList: View {
    @ObservedObject var viewMotel: CombatGenerator = CombatGenerator()
    let bigSize = UIDevice.current.userInterfaceIdiom == .pad

    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dropBoxManager: CloudManagerFarm
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \BodyElement.idElement, ascending: false)])
    private var allInfo: FetchedResults<BodyElement>

    @ObservedObject var crowd: LoadingPreviewGold = LoadingPreviewGold()

    @State private var itemTypeChoosed: IconTurboGear.MenuIconTurbo = .dads
    @State private var isDrawerOpen: Bool = false
    @State private var isLoadingInProgress: Bool = false

    private let nameItems: [(title: String, iconType: IconTurboGear.MenuIconTurbo)] = [
        ("MODS", .dads),
        ("MAPS", .maps),
        ("WALLPAPER", .plane),
        ("SKINS", .angar),
        ("NICK GENERATION", .nickGen),
        ("AVATAR GENERATION", .avaGen),
        ("EDITOR", .editor)
    ]

    var body: some View {
        NavigationView {
            ZStack {
                getDestination(for: itemTypeChoosed)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)

                HStack {
                    if (isDrawerOpen) {
                        VStack(spacing: 20) {
                            Text("MENU")
                                .font(Font.custom("Gilroy-Heavy", size: bigSize ? 50: 32).weight(.heavy))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .center)

                            ForEach(nameItems, id: \.iconType) { menuItem in
                                SidebarButton(title: menuItem.title, iconType: menuItem.iconType)
                            }

                            Spacer()
                        }
                        .padding(.horizontal)
                        .frame(width: UIScreen.main.bounds.width * 0.75)
                        .background(Color.blue)
                        .transition(.move(edge: .leading))
                    }
                    Spacer()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        withAnimation(.easeInOut) {
                            isDrawerOpen.toggle()
                        }
                    }) {
                        Image(systemName: isDrawerOpen ? "xmark" : "line.horizontal.3")
                            .foregroundColor(.blue)
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationViewStyle(StackNavigationViewStyle())
    }

    private func SidebarButton(title: String, iconType: IconTurboGear.MenuIconTurbo) -> some View {
        Button(action: {
            navigateTo(iconType)
            if (iconType == .avaGen || iconType == .editor) && !isLoadingInProgress {
                isLoadingInProgress = true
                Task {
                    await crowd.addAllElementToCoreData(allData: allInfo, dropBoxManager: dropBoxManager, viewContext: viewContext)
                    isLoadingInProgress = false
                }
            }
        }) {
            HStack {
                Text(title)
                    .font(Font.custom("Montserrat-Bold", size: bigSize ? 30 :19).weight(.bold))
                    .foregroundColor(itemTypeChoosed == iconType ? .white : Color.white.opacity(0.6))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 14)
                    .lineLimit(1)
            }
        }
    }

    private func navigateTo(_ iconType: IconTurboGear.MenuIconTurbo) {
        itemTypeChoosed = iconType
        withAnimation {
            isDrawerOpen = false
        }
    }

    private func getDestination(for iconType: IconTurboGear.MenuIconTurbo) -> some View {
        switch iconType {
        case .dads:
            return AnyView(TrackPublishedData(isDrawerOpen: $isDrawerOpen))
        case .maps:
            return AnyView(GearedTopFinishing(isDrawerOpen: $isDrawerOpen))
        case .plane:
            return AnyView(SpeedViewViolent(isDrawerOpen: $isDrawerOpen))
        case .angar:
            return AnyView(RidePageInnocent(isDrawerOpen: $isDrawerOpen))
        case .nickGen:
            return AnyView(RandomPageInnocentNick(isDrawerOpen: $isDrawerOpen))
       case .avaGen:
            return AnyView(RandomShapeInnocent( isDrawerOpen:.constant(false), HotelView: viewMotel))
                                                  
        case .editor:
            return AnyView(AvatarDataGeneration(viewHotel: viewMotel, isDrawerOpen:.constant(false) , saveStateTypeIpad: AnyView(SuccessView())))
        }
    }
}

struct MenuListToApp_Previews: PreviewProvider {
    static var previews: some View {
        MenuNameList()
    }
}

