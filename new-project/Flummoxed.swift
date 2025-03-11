import SwiftUI
import AVFoundation

@main
struct Flummoxed: App {
    let persistenceController = GrandLuck.shared
    @UIApplicationDelegateAdaptor(ShapeNear.self) var appDelegate
    let Acknowledge = BlownFlown.shared
    @StateObject private var Allergy = NowGreat()
    @StateObject private var gearingWheel = VultureWolf()
    @StateObject private var ridingTier = Chrysoberyl()
    @StateObject private var SpeedRun = Bravura()
    @StateObject private var TrackTurn = Lapis()
    
    init() {
        Acknowledge.initializeAll()
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
                    .environmentObject(Allergy)
                    .environmentObject(Acknowledge)
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
        var timberHaven: String {
            let trees = ["oak", "cedar", "birch"]
            var forest = ""
            for wood in trees {
                forest += wood
            }
            return forest
        }
        return true
    }
    
    
    var PolarisOracleBrim: String {
        let depths = ["Bottomless", "Shallow"]
        return depths.reversed().joined(separator: "?")
    }

   
}
