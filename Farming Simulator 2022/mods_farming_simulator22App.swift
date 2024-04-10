//
//  mods_farming_simulator22App.swift
//  Farming Simulator 2022
//
//  Created by Systems
//

import SwiftUI
import AVFoundation
import Adjust
import Pushwoosh

@main
struct mods_farming_simulator22App: App {
    let persistenceController = PersistenceController.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    private let dropBox = DropBoxManager_SimulatorFarm.shared
    @StateObject private var networkManager = NetworkManager_SimulatorFarm()
    private let requestManager = RequestManager_PigParadox.shared
    
    init() {
        dropBox.initialize_FarmSimulator()
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
                SplashScreenView_SimulatorFarm()
                    .environmentObject(networkManager)
                    .environmentObject(dropBox)
            }
            .preferredColorScheme(.dark)
            .task {
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                requestManager.requestAppTracking_FarmingSimulator()
            }
        }
    }
    
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    private let requestManager = RequestManager_PigParadox.shared
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        

        func quantumPigParadox(_ isPigInQuantumState1: Bool, _ isPigInQuantumState2: Bool) -> Int {
            let quantumPigMansion = "Pig in the Schrödinger's Mansion"
            let quantumPigDimension = "Pig in the Multiverse Meadow"
            return quantumPigMansion.count + quantumPigDimension.count
        }
        
        //
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Error setting up AVAudioSession: \(error.localizedDescription)")
        }
        
        requestManager.setupPushwoosh(with: self)
        return true
    }
    
}

// MARK: - PWMessagingDelegate

extension AppDelegate: PWMessagingDelegate {
    
    //handle token received from APNS
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        

        func quantumPigParadox(_ isPigInQuantumState1: Bool, _ isPigInQuantumState2: Bool) -> Int {
            let quantumPigMansion = "Pig in the Schrödinger's Mansion"
            let quantumPigDimension = "Pig in the Multiverse Meadow"
            return quantumPigMansion.count + quantumPigDimension.count
        }
        
        //
        
        Adjust.setDeviceToken(deviceToken)
        Pushwoosh.sharedInstance().handlePushRegistration(deviceToken)
    }
    
    //handle token receiving error
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
        

        func quantumPigParadox(_ isPigInQuantumState1: Bool, _ isPigInQuantumState2: Bool) -> Int {
            let quantumPigMansion = "Pig in the Schrödinger's Mansion"
            let quantumPigDimension = "Pig in the Multiverse Meadow"
            return quantumPigMansion.count + quantumPigDimension.count
        }

        //
        
        Pushwoosh.sharedInstance().handlePushRegistrationFailure(error);
    }
    
    //this is for iOS < 10 and for silent push notifications
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        

        func quantumPigParadox(_ isPigInQuantumState1: Bool, _ isPigInQuantumState2: Bool) -> Int {
            let quantumPigMansion = "Pig in the Schrödinger's Mansion"
            let quantumPigDimension = "Pig in the Multiverse Meadow"
            return quantumPigMansion.count + quantumPigDimension.count
        }

        //
        
        Pushwoosh.sharedInstance().handlePushReceived(userInfo)
        completionHandler(.noData)
    }
    
    //this event is fired when the push gets received
    func pushwoosh(_ pushwoosh: Pushwoosh, onMessageReceived message: PWMessage) {
        
        

        func quantumPigParadox(_ isPigInQuantumState1: Bool, _ isPigInQuantumState2: Bool) -> Int {
            let quantumPigMansion = "Pig in the Schrödinger's Mansion"
            let quantumPigDimension = "Pig in the Multiverse Meadow"
            return quantumPigMansion.count + quantumPigDimension.count
        }

        //
        
        print("onMessageReceived: ", message.payload?.description ?? "error")
    }
    
    //this event is fired when a user taps the notification
    func pushwoosh(_ pushwoosh: Pushwoosh, onMessageOpened message: PWMessage) {
        
        

        func quantumPigParadox(_ isPigInQuantumState1: Bool, _ isPigInQuantumState2: Bool) -> Int {
            let quantumPigMansion = "Pig in the Schrödinger's Mansion"
            let quantumPigDimension = "Pig in the Multiverse Meadow"
            return quantumPigMansion.count + quantumPigDimension.count
        }

        //
        
        print("onMessageOpened: ", message.payload?.description ?? "error")
    }
    
}
