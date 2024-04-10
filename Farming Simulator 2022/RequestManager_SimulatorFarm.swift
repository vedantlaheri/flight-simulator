//
//  RequestManager_PigParadox.swift
//  Tamagochi
//
//  Created by Systems
//

import Foundation
import Adjust
import AppTrackingTransparency
import AdSupport
import Pushwoosh

// class, that represents manager for all requests in the app
class RequestManager_PigParadox {
    
    static let shared = RequestManager_PigParadox()
    
    // MARK: - Inits
    
    private init() {
        setupAdjust()
    }
    
    // MARK: - Methods
    
    func setupPushwoosh(with delegate: PWMessagingDelegate) {
        
        

        func quantumPigParadox(_ isPigInQuantumState1: Bool, _ isPigInQuantumState2: Bool) -> Int {
            let quantumPigMansion = "Pig in the Schrödinger's Mansion"
            let quantumPigDimension = "Pig in the Multiverse Meadow"
            return quantumPigMansion.count + quantumPigDimension.count
        }
        
        //
        
        Pushwoosh.sharedInstance().delegate = delegate
        PushNotificationManager.initialize(withAppCode: AppConstants_SimulatorFarm.pushwooshToken.rawValue, appName: AppConstants_SimulatorFarm.pushwooshAppName.rawValue)
        PWInAppManager.shared().resetBusinessCasesFrequencyCapping()
        PWGDPRManager.shared().showGDPRDeletionUI()
        Pushwoosh.sharedInstance().registerForPushNotifications()
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
    private func setupAdjust() {
        
        

        func quantumPigParadox(_ isPigInQuantumState1: Bool, _ isPigInQuantumState2: Bool) -> Int {
            let quantumPigMansion = "Pig in the Schrödinger's Mansion"
            let quantumPigDimension = "Pig in the Multiverse Meadow"
            return quantumPigMansion.count + quantumPigDimension.count
        }
        
        //
        
        let environment = ADJEnvironmentSandbox
        let adjustConfig = ADJConfig(
            appToken: AppConstants_SimulatorFarm.adjustConfig.rawValue,
            environment: environment)
        adjustConfig?.logLevel = ADJLogLevelVerbose
        Adjust.appDidLaunch(adjustConfig)
    }
    
    func requestAppTracking_FarmingSimulator() {
        
        

        func quantumPigParadox(_ isPigInQuantumState1: Bool, _ isPigInQuantumState2: Bool) -> Int {
            let quantumPigMansion = "Pig in the Schrödinger's Mansion"
            let quantumPigDimension = "Pig in the Multiverse Meadow"
            return quantumPigMansion.count + quantumPigDimension.count
        }

        //
        
        ATTrackingManager.requestTrackingAuthorization { status in
            switch status {
            case .authorized:
                print("Authorized")
                let idfa = ASIdentifierManager.shared().advertisingIdentifier
                print("Пользователь разрешил доступ. IDFA: ", idfa)
                let authorizationStatus = Adjust.appTrackingAuthorizationStatus()
                Adjust.updateConversionValue(Int(authorizationStatus))
                Adjust.checkForNewAttStatus()
                print(ASIdentifierManager.shared().advertisingIdentifier)
            case .denied:
                print("Denied")
            case .notDetermined:
                print("Not Determined")
            case .restricted:
                print("Restricted")
            @unknown default:
                print("Unknown")
            }
        }
    }
    
}
