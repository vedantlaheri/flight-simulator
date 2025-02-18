import SwiftUI
import AVFoundation

@main
struct FlightSimulatorApp: App {
    let persistenceController = PersistenceController.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let dropBox = CloudManagerFarm.shared
    @StateObject private var networkManager = NetworkManaged()
    @StateObject private var gearingWheel = GearViewModel()
    @StateObject private var ridingTier = RidesViewModel()
    @StateObject private var SpeedRun = SpeedViewModel()
    @StateObject private var TrackTurn = TrackViewModel()
    
    init() {
        dropBox.initializeAll()
        UIButton.appearance().isMultipleTouchEnabled = false
        UIButton.appearance().isExclusiveTouch = true
        UIView.appearance().isMultipleTouchEnabled = false
        UIView.appearance().isExclusiveTouch = true
        UITabBar.appearance().isExclusiveTouch = true
        UITabBar.appearance().isMultipleTouchEnabled = false
    }
    
    var body: some Scene {
        WindowGroup {
            VStack {
                LoadignPreviewPage()
                    .environmentObject(networkManager)
                    .environmentObject(dropBox)
                    .environmentObject(gearingWheel)
                    .environmentObject(ridingTier)
                    .environmentObject(SpeedRun)
                    .environmentObject(TrackTurn)
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
            .preferredColorScheme(.dark)
            .task {
                try? await Task.sleep(nanoseconds: 1_000_000_000)
            }
        }
    }
    
}

class AppDelegate: NSObject, UIApplicationDelegate {
 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
}
