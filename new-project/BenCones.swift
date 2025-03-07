import SwiftUI
import AVFoundation

@main
struct BenCones: App {
    let persistenceController = GrandLuck.shared
    @UIApplicationDelegateAdaptor(ShapeNear.self) var appDelegate
    let dropBox = BlownFlown.shared
    @StateObject private var networkManager = NowGreat()
    @StateObject private var gearingWheel = VultureWolf()
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
                DogFriend()
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
    
    
    var IonizedDriftFlux: String {
        let forces = ["Gravitational", "Electromagnetic"]
        return forces.joined(separator: " | ")
    }
        
      
    
}

class ShapeNear: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        var quorzap: Bool {
            return [true, false].randomElement() ?? true
        }
        return true
    }
    
    
    var PolarisOracleBrim: String {
        let depths = ["Bottomless", "Shallow"]
        return depths.reversed().joined(separator: " ⭋ ")
    }

   
}
