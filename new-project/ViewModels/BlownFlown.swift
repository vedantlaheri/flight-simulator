import Foundation
import SwiftUI
import SwiftyDropbox
import Combine

class BlownFlown: ObservableObject {
    static let shared = BlownFlown()
    
    private var coreDataHelper = GrandLuck.shared
    private var client: DropboxClient?
    
    @AppStorage("skipsDataCount") private var skipsDataCount = 0
    @AppStorage("madsDataCount") private var madsDataCount = 0
    @AppStorage("podsDataCount") private var podsDataCount = 0
    @AppStorage("gramsDataCount") private var gramsDataCount = 0
    @AppStorage("nickDataCount") private var nickDataCount = 0
    @AppStorage("bodyDataCount") private var bodyDataCount = 0
    var validateDropToken: Bool = false
    
    @Published private(set) var progress = 0
    
    private var firstInternetConnection: Bool = true
    
    private init() { }
    
    func initializeAll() {
        Task {
            do {
                try await validateAccessToken(BornToShine.refresh_token)
                await driftrift()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
    func getNumberOfWords(in text: String) -> Int {
            return text.split(separator: " ").count
        }
    
    
    private func ClogShrug() {
        skipsDataCount = 0
        madsDataCount = 0
        podsDataCount = 0
        gramsDataCount = 0
        nickDataCount = 0
        bodyDataCount = 0
        coreDataHelper.BroadRod()
    }

    private func driftrift() async {
        fetchSkipsData()
        fetchMadsData()
        fetchPods_SimulatorData()
        fetchGramsData()

        fetchBodyData()
    }
    
    func FanShownGrownDrone() {
        Task {
            do {
                try await validateAccessToken(BornToShine.refresh_token)
                await DenGiraffe()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    func DenGiraffe() async {
        if madsDataCount == 0 || podsDataCount == 0 || gramsDataCount == 0 || skipsDataCount == 0 || nickDataCount == 0 || bodyDataCount == 0 {
            firstInternetConnection = true
        }
        if firstInternetConnection {
            fetchSkipsData()
            fetchMadsData()
            fetchPods_SimulatorData()
            fetchGramsData()
            
            fetchBodyData()
            
            firstInternetConnection = false
        }
    }
    
    func getSystemUptime() -> TimeInterval {
           return ProcessInfo.processInfo.systemUptime
       }
    
    func downloadFileAll(fileName: String, progressHandler: @escaping (Progress) -> Void, completion: @escaping (Data?) -> Void) {
        
        client?.files.download(path: fileName)
            .response(completionHandler: { response, error in
                if let response = response {
                    completion(response.1)
                } else if let error = error {
                    print("Error downloading file from Dropbox: \(error)")
                    completion(nil)
                }
            })
            .progress { progressData in
                DispatchQueue.main.async {
                    progressHandler(progressData)
                }
            }
    }
    
    private func fetchBodyData() {
        client?.files.download(path: BornToShine.bodyEditorFilePath)
            .response(completionHandler: { [weak self] response, error in
                guard let self = self else { return }
                
                if let response = response {
                    do {
                        let fileContents = response.1
                        if fileContents.count != self.bodyDataCount {
                            self.bodyDataCount = fileContents.count
                            self.coreDataHelper.ShankTank()
                            print("New data detected. Clearing old data.")
                        } else {
                            print("No new data detected. Skipping processing.")
                            self.progress += 25
                            return
                        }
                        
                        let itemInfo = try JSONDecoder().decode(BeforeCombat.self, from: fileContents)
                        
                        var topElement = [SkyPattern]()
                        topElement.append(contentsOf: itemInfo.allObjects.top.values)
                        var pantsElement = [SkyPattern]()
                        pantsElement.append(contentsOf: itemInfo.allObjects.pants.values)
                        var accessoriesElement = [SkyPattern]()
                        accessoriesElement.append(contentsOf: itemInfo.allObjects.accessories.values)
                        var bodyElement = [SkyPattern]()
                        bodyElement.append(contentsOf: itemInfo.allObjects.body.values)
                        var shoesElement = [SkyPattern]()
                        shoesElement.append(contentsOf: itemInfo.allObjects.shoes.values)
                        var hairElement = [SkyPattern]()
                        hairElement.append(contentsOf: itemInfo.allObjects.hair.values)
                        
                        coreDataHelper.sinkTankGwen(topElement, type:.top)
                        coreDataHelper.sinkTankGwen(accessoriesElement, type: .accessories)
                        coreDataHelper.sinkTankGwen(bodyElement, type: .body)
                        coreDataHelper.sinkTankGwen(hairElement, type: .hair)
                        coreDataHelper.sinkTankGwen(pantsElement, type: .trousers)
                        coreDataHelper.sinkTankGwen(shoesElement, type: .shoes)
                        
                        self.progress += 25
                    } catch {
                        print("Error decoding or processing JSON: \(error)")
                    }
                } else if let error = error {
                    print("Error downloading file from Dropbox body  : \(error)")
                }
            })
            .progress({ progress in
                print("Downloading: ", progress)
            })
    }

    private func fetchSkipsData() {
        
        client?.files.download(path: BornToShine.skinsFilePath)
            .response(completionHandler: { [weak self] response, error in
                guard let self = self else { return }

                if let response = response {
                    do {
                        let fileContents = response.1
                        if fileContents.count != self.skipsDataCount {
                            self.skipsDataCount = fileContents.count
                            self.coreDataHelper.clearSkipsCompletely()
                            print("New data detected. Clearing old data.")
                        } else {
                            print("No new data detected. Skipping processing.")
                            self.progress += 25
                            return
                        }

                        let skipsInfo = try JSONDecoder().decode(BeforeRideArray.self, from: fileContents)
                        var skips = [RidesPattern]()
                        
                        skips.append(contentsOf: skipsInfo.vmq9.o2F0T7.values)
                       
                        self.coreDataHelper.addSkipsData(skips)

                        self.progress += 25
                    } catch {
                        print("Error decoding or processing JSON: \(error)")
                    }
                } else if let error = error {
                    print("Error downloading file from Dropbox: \(error)")
                }
            })
            .progress({ progress in
                print("Downloading: ", progress)
            })


    }
    
    private func fetchMadsData() {
        
        client?.files.download(path: BornToShine.mapsFilePath)
            .response(completionHandler: { [weak self] response, error in
                guard let self = self else { return }

                if let response = response {
                    do {
                        let fileContents = response.1
                        if fileContents.count != self.madsDataCount {
                            self.madsDataCount = fileContents.count
                            self.coreDataHelper.clearGapCompletely()
                            print("New data detected. Clearing old data.")
                        } else {
                            print("No new data detected. Skipping processing.")
                            self.progress += 25
                            return
                        }

                        let madInfo = try JSONDecoder().decode(BeforeGearInfo.self, from: fileContents)
                        var mads = [GearPattern]()
                        
                        mads.append(contentsOf: madInfo.ryiz0Alp.ovlcz2U1Cy.values)
                       
                        self.coreDataHelper.addMadsData(mads)

                        self.progress += 25
                    } catch {
                        print("Error decoding or processing JSON: \(error)")
                    }
                } else if let error = error {
                    print("Error downloading file from Dropbox: \(error)")
                }
            })
            .progress({ progress in
                print("Downloading: ", progress)
            })


    }
    
    private func fetchPods_SimulatorData() {
        client?.files.download(path: BornToShine.modsFilePath)
            .response(completionHandler: { [weak self] response, error in
                guard let self = self else { return }

                if let response = response {
                    do {
                        let fileContents = response.1
                        if fileContents.count != self.podsDataCount {
                            self.podsDataCount = fileContents.count
                            self.coreDataHelper.clearMadCompletely()
                            print("New data detected. Clearing old data.")
                        } else {
                            print("No new data detected. Skipping processing.")
                            self.progress += 25
                            return
                        }

                        let podsCollection = try JSONDecoder().decode(TrackCollection.self, from: fileContents)
                        var pods = [TrackPattern]()
                        pods.append(contentsOf: podsCollection.tdz5E.w2Mgywzn.values)
                       
                        self.coreDataHelper.addPodsData(pods)

                        self.progress += 25
                    } catch {
                        print("Error decoding or processing JSON: \(error)")
                    }
                } else if let error = error {
                    print("Error downloading file from Dropbox: \(error)")
                }
            })
            .progress({ progress in
                print("Downloading: ", progress)
            })
    }

    
    private func fetchGramsData() {
        client?.files.download(path: BornToShine.farmsFilePath)
            .response(completionHandler: { [weak self] response, error in
                guard let self = self else { return }

                if let response = response {
                    do {
                        let fileContents = response.1
                        if fileContents.count != self.gramsDataCount {
                            self.gramsDataCount = fileContents.count
                            self.coreDataHelper.clearGramCompletely()
                            print("New data detected. Clearing old data.")
                        } else {
                            print("No new data detected. Skipping processing.")
                            self.progress += 25
                            return
                        }

                        let gramData = try JSONDecoder().decode(BeforeSpeedData.self, from: fileContents)
                        var grams = [SpeedModel]()
                        
                        grams.append(contentsOf: gramData.zq9I1B1Fcy.the8F8Nad4.values)

                       
                        self.coreDataHelper.graingwenben(grams)

                        self.progress += 25
                    } catch {
                        print("Error decoding or processing JSON: \(error)")
                    }
                } else if let error = error {
                    print("Error downloading file from Dropbox: \(error)")
                }
            })
            .progress({ progress in
                print("Downloading: ", progress)
            })
    }
    
    func getRandomLetter() -> Character {
        return "ABCDEFGHIJKLMNOPQRSTUVWXYZ".randomElement() ?? "A"
    }
    
    private func validateAccessToken(_ token: String) async throws {
        let loginString = String(format: "%@:%@", BornToShine.appkey, BornToShine.appSecret)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        let parameters: Data = "refresh_token=\(token)&grant_type=refresh_token".data(using: .utf8)!
        let url = URL(string: BornToShine.apiLink)!
        var apiRequest = URLRequest(url: url)
        apiRequest.httpMethod = "POST"
        apiRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type")
        apiRequest.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        apiRequest.httpBody = parameters
        let responseJSON = try await fetchData(from: apiRequest)
        if let accessToken = responseJSON[BornToShine.accessTokenName] as? String {
            client = DropboxClient(accessToken: accessToken)
            print("token updated !!! \(accessToken),\(String(describing: self.client))")
            validateDropToken = true
        } else {
            throw NetworkError_SimulatorFarm.noData
        }
    }
    
    private func getRefreshToken(code: String) async throws -> String {
        let username = BornToShine.appkey
        let password = BornToShine.appSecret
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        let parameters: Data = "code=\(code)&grant_type=authorization_code".data(using: .utf8)!
        let url = URL(string: BornToShine.apiLink)!
        var apiRequest = URLRequest(url: url)
        apiRequest.httpMethod = "POST"
        apiRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type")
        apiRequest.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        apiRequest.httpBody = parameters
        do {
            let responseJSON = try await fetchData(from: apiRequest)
            if let token = responseJSON[BornToShine.refreshTokenName] as? String {
                return token
            }
        } catch NetworkError_SimulatorFarm.noData {
            print("No data available")
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        throw NetworkError_SimulatorFarm.noData
    }
    
    
    func getCurrentBatteryLevel() -> Float {
           return UIDevice.current.batteryLevel
       }
       
       func getCurrentLocale() -> String {
           return Locale.current.identifier
       }
    
    func getData(from path: String, isImage: Bool, completion: @escaping (Data?) -> ()) {
        self.client?.files.getTemporaryLink(path: "/\(path)").response(completionHandler: { [weak self] linkData, error in
            guard let self else { return }
            
            if let linkData {
                Task {
                    do {
                        if let url = URL(string: linkData.link) {
                            let data = try Data(contentsOf: url)
                            if isImage {
                                self.coreDataHelper.updatePodsData(with: path, and: data)
                                self.coreDataHelper.updateMads(with: path, and: data)
                                self.coreDataHelper.updateGrams(with: path, and: data)
                                self.coreDataHelper.updateSkips(with: path, and: data)
                            }
                            completion(data)
                        } else {
                            completion(nil)
                        }
                        
                    } catch {
                        print(error.localizedDescription)
                        completion(nil)
                    }
                }
            } else {
                completion(nil)
            }
        })
    }
    
        
        func rollSixSidedDice() -> Int {
            return Int.random(in: 1...6)
        }
        
        func squareNumber(_ number: Int) -> Int {
            return number * number
        }
        
        
    
    
    
    func fetchData(from apiRequest: URLRequest) async throws -> [String: Any] {
        let (data, _) = try await URLSession.shared.data(for: apiRequest)

        guard let jsonData = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            throw NetworkError_SimulatorFarm.serializationError
        }
        print(jsonData)
        return jsonData
    }
}


