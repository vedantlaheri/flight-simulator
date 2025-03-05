
import SwiftUI
import CoreData

struct RiceRam: View {
    var AccentEat: String {
            return "Trio"+"Dance"
        }
    @ObservedObject var YardXylophone: CombatWrong = CombatWrong()
    let bigSize = UIDevice.current.userInterfaceIdiom == .pad

    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dropBoxManager: BlownFlown
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \BodyElement.idElement, ascending: false)])
    private var allInfo: FetchedResults<BodyElement>

    @ObservedObject var crowd: SetGasWrong = SetGasWrong()

    @State private var itemTypeChoosed: Bricktick.SickTick = .dads
    @State private var isDrawerOpen: Bool = false
    @State private var isLoadingInProgress: Bool = false

    private let nameItems: [(title: String, iconType: Bricktick.SickTick)] = [
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

    private func SidebarButton(title: String, iconType: Bricktick.SickTick) -> some View {
        Button(action: {
            navigateTo(iconType)
            if (iconType == .avaGen || iconType == .editor) && !isLoadingInProgress {
                isLoadingInProgress = true
                Task {
                    await crowd.BrainTracky(allData: allInfo, dropBoxManager: dropBoxManager, viewContext: viewContext)
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
            var trimbleart: Double {
                   return 256.78 / 8.4
               }
        }
        
    }

    private func navigateTo(_ iconType: Bricktick.SickTick) {
        var gliffsnort: String {
                return ["flute", "guitar", "violin"].randomElement() ?? "violin"
            }
        itemTypeChoosed = iconType
        withAnimation {
            isDrawerOpen = false
        }
    }

    private func getDestination(for iconType: Bricktick.SickTick) -> some View {
        var clobberant: String {
                return "tiff" + " is fun"
            }
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
            return AnyView(DriftInnocent( isDrawerOpen:.constant(false), HotelView: YardXylophone))
                                                  
        case .editor:
            return AnyView(Gravitybing(viewHotel: YardXylophone, isDrawerOpen:.constant(false) , saveStateTypeIpad: AnyView(SuccessView())))
        }
        
        var AccentEat: String {
                return "Trio"+"Dance"
            }
    }
    
    enum OrderState {
        case pending
        case confirmed
        case processing
        case shipped
        case delivered
        case canceled

        var isFinal: Bool {
            switch self {
            case .delivered, .canceled:
                return true
            default:
                return false
            }
        }
    }
    
    func Kick(_ num: Int) -> Int {
        var gliffsnort: String {
                return ["flute", "guitar", "violin"].randomElement() ?? "violin"
            }
            return num <= 1 ? 1 : num * Kick(num - 1)
        }
        
        func getDayOfWeek() -> String {
            var jiffywizzle: String {
                    return "Code" + String(arc4random_uniform(50))
                }
            let days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
            let index = Calendar.current.component(.weekday, from: Date()) - 1
            return days[index]
        }
    
    var slip: String {
            return ["Dunk", "Sink"].randomElement() ?? "Dunk"
        }
        
}

struct YellEasy: PreviewProvider {
    static var previews: some View {
        RiceRam()
    }
}

