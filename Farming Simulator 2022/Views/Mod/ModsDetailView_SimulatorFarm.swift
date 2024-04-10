//
//  ModsDetailView.swift
//  Farming Simulator 2022
//
//  Created by Systems
//

import Foundation
import SwiftUI
import MobileCoreServices

struct ModsDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var mod: ModPattern
    @Binding var selectedMod: ModPattern?
    @State private var isNavigatingToDetailView = false
    @State private var modItemViewModel: ModItemViewModel
    @EnvironmentObject var dropBoxManager: DropBoxManager_SimulatorFarm
    @ObservedObject var modsViewModel: ModViewModel
    @State private var imageData: Data? = nil
    @State private var showAlert = false
    @State private var showCustomAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var isLoading = false
    @State private var downloadProgress: Double = 0.0
    @State private var hideToolbar: Bool = false
    @State private var isFileDownloaded = false
    @State private var isInternetAvailable = true
    @ObservedObject var networkManager = NetworkManager_SimulatorFarm()
    

    init(mod: ModPattern, selectedMod: Binding<ModPattern?>) {
        self.mod = mod
        self._selectedMod = selectedMod
        self._modItemViewModel = State(initialValue: ModItemViewModel(mod: mod))
        self._modsViewModel = ObservedObject(initialValue: ModViewModel())
    }
    private func showAlert(title: String, message: String) {
        alertTitle = title
        alertMessage = message
        showAlert = true
    }
    private func showShareSheet(withURL urlString: String) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let viewController = windowScene.windows.first?.rootViewController else {
            return
        }

        let activityViewController = UIActivityViewController(activityItems: [URL(fileURLWithPath: urlString)], applicationActivities: nil)

        if UIDevice.current.userInterfaceIdiom == .pad {
            if #available(iOS 15.0, *) {
                let screenBounds = UIScreen.main.bounds
                let anchor = CGRect(x: screenBounds.width / 2, y: screenBounds.height, width: 0, height: 0)

                activityViewController.popoverPresentationController?.sourceRect = anchor
                activityViewController.popoverPresentationController?.sourceView = viewController.view
            } else {
                // Adjustments for iOS 14 and below
                // Your existing code here
            }
        }

        activityViewController.completionWithItemsHandler = { (activity, success, items, error) in
            if success {
                DispatchQueue.main.async {
                    // Show a success alert here
                    showCustomAlert = true
                    isLoading = false
                }
            } else {
                DispatchQueue.main.async {
                    isLoading = false
                }
            }
        }

        viewController.present(activityViewController, animated: true, completion: nil)
    }
    
    private func makeMyURLString(from fileName: String) -> String {
            let fileArray = fileName.components(separatedBy: "/")
            return (try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent(fileArray.last ?? "").path) ?? ""
        }



    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                Image("loadscreen")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea(.all)
                    .overlay(
                        Color.black.opacity(0.3)
                    )
                    .blur(radius: 4)

                VStack(spacing: 0) {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                            hideToolbar = false
                        }) {
                            Image(systemName: "chevron.left")
                                .font(Font.system(size: horizontalSizeClass == .compact ? 24 : 32, weight: .regular))
                        }
                        .foregroundColor(.white)
                        Spacer()
                        Text("Mods")
                            .font(Font.custom("Montserrat", size: horizontalSizeClass == .compact ? 28 : 32).weight(.bold))
                            .lineSpacing(20)
                            .foregroundColor(Color(red: 0.97, green: 0.97, blue: 0.97))
                        Spacer()
                        Button(action: {
                            guard networkManager.checkInternetConnectivity_SimulatorFarm() else {
                                    showAlert(title: "No Internet Connection", message: "Please check your internet connection and try again.")
                                    return
                                }
                            if FileManager.default.fileExists(atPath:makeMyURLString(from: mod.file)) {
                                // Show the share sheet directly
                                showShareSheet(withURL: makeMyURLString(from: mod.file))
                                return
                            }
                                
                            isLoading = true
                               let fileName = mod.file
                               guard !fileName.isEmpty else {
                                   print("Error: File name is empty")
                                   showAlert(title: "Error", message: "File name is empty")
                                   isLoading = false
                                   return
                               }

                            dropBoxManager.downloadFile_SimulatorFarm(fileName: "/Mods/" + fileName) { progressData in
                                downloadProgress = progressData.fractionCompleted
                                
                            } completion: { downloadedData in
                                   if let isFile = downloadedData {
                                       
                                       let downloadFile_SimulatorFarmname: String = fileName
                                       let fileArray = downloadFile_SimulatorFarmname.components(separatedBy: "/")
                                       let finalFileName = fileArray.last ?? ""
                                       let fileManager = FileManager.default
                                       
                                       let docsURL = try! fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                                       var myURLString = docsURL.appendingPathComponent(finalFileName).absoluteString
                                       myURLString = myURLString.replacingOccurrences(of: "file://", with: "")
                                       
                                       fileManager.createFile(atPath: myURLString, contents: isFile, attributes: nil)
                                       
                                       if fileManager.fileExists(atPath: myURLString) {
                                           print("File Exists at \(myURLString)")
                                           
                                           isFileDownloaded = true
                                           showShareSheet(withURL: myURLString)
                                       } else {
                                           print("File not found")
                                           // Show an error alert here
                                           showAlert(title: "Error", message: "File not found.")
                                           isLoading = false
                                       }
                                   } else {
                                       isLoading = false
                                   }
                               }
                        }) {
                            Image("download")
                                    .resizable()
                                    .frame(width: horizontalSizeClass == .compact ? 24 : 32, height: horizontalSizeClass == .compact ? 24 : 32)
                                    .padding(10)
                                
                        }
                        .foregroundColor(.primary)
                        
                        
                        
                    }
                    .padding(EdgeInsets(
                        top: horizontalSizeClass == .compact ? 0 : 40,
                        leading: horizontalSizeClass == .compact ? 20 : 85,
                        bottom: horizontalSizeClass == .compact ? 0 : 40,
                        trailing: horizontalSizeClass == .compact ? 20 : 85
                    ))

                    ScrollView {
                        VStack(alignment: .leading, spacing: 12) {
                            ZStack(alignment: .topTrailing) {
                                if let imageData, let uiImage = UIImage(data: imageData) {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                                        .cornerRadius(20)
                                        .animation(.none, value: UUID())
                                        .transition(.opacity)
                                        .padding(horizontalSizeClass == .compact ? 12 : 20)
                                    
                                } else {
                                    ProgressView()
                                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                                        .tint(.black)
                                        .onAppear {
                                            if mod.imageData == nil && networkManager.checkInternetConnectivity_SimulatorFarm() {
                                                dropBoxManager.getData(from: "Mods/" + mod.image, isImage: true, completion: { data in
                                                    Task {
                                                        await MainActor.run {
                                                            self.imageData = data
                                                            modsViewModel.fetchModsFromCoreData()
                                                            modsViewModel.pressingfilterMods()
                                                        }
                                                    }
                                                })
                                            }
                                        }
                                        .onAppear {
                                            self.imageData = mod.imageData
                                        }
                                        .transition(.opacity)
                                        .onChange(of: isInternetAvailable, perform: { newValue in
                                            if newValue && mod.imageData == nil {
                                                dropBoxManager.getData(from: "Mods/" + mod.image, isImage: true, completion: { data in
                                                    Task {
                                                        await MainActor.run {
                                                            self.imageData = data
                                                            modsViewModel.fetchModsFromCoreData()
                                                            modsViewModel.pressingfilterMods()
                                                        }
                                                    }
                                                })
                                            }
                                        })
                                }
                                
                                
                                Button(action: {
                                    modItemViewModel.relayFavorite()
                                }) {
                                    Image(modItemViewModel.isFavorited ? "favorite2" : "favorite1")
                                        .frame(width: horizontalSizeClass == .compact ? 32 : 40, height: horizontalSizeClass == .compact ? 32 : 40)
                                        .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                                        .cornerRadius(100)
                                        .padding(horizontalSizeClass == .compact ? 20 : 40)
                                }
                            }
                            .onAppear {
                                isInternetAvailable = networkManager.checkInternetConnectivity_SimulatorFarm()
                            }
                            .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
                                isInternetAvailable = networkManager.checkInternetConnectivity_SimulatorFarm()
                            }
                            VStack(alignment: .leading, spacing: 8) {
                                Text(mod.title)
                                    .font(Font.custom("Montserrat", size: horizontalSizeClass == .compact ? 20 : 32).weight(.semibold))
                                    .lineSpacing(20)
                                    .foregroundColor(Color(red: 0.91, green: 0.56, blue: 0.02))
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(EdgeInsets(
                                        top: horizontalSizeClass == .compact ? 0 : 0,
                                        leading: horizontalSizeClass == .compact ? 12 : 20,
                                        bottom: horizontalSizeClass == .compact ? 8 : 20,
                                        trailing: horizontalSizeClass == .compact ? 12 : 20
                                    ))

                                    
                                ScrollView {
                                    Text(mod.description)
                                        .font(Font.custom("Montserrat", size: horizontalSizeClass == .compact ? 14 : 20).weight(.medium))
                                        .foregroundColor(Color(red: 0.04, green: 0.05, blue: 0.03))
                                        .multilineTextAlignment(.leading)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(EdgeInsets(
                                            top: horizontalSizeClass == .compact ? 0 : 0,
                                            leading: horizontalSizeClass == .compact ? 12 : 20,
                                            bottom: horizontalSizeClass == .compact ? 8 : 20,
                                            trailing: horizontalSizeClass == .compact ? 12 : 20
                                        ))
                                    Spacer()
                                }
                            }
                            .padding(EdgeInsets(top: 0, leading: horizontalSizeClass == .compact ? 10 : 20, bottom: 10, trailing: horizontalSizeClass == .compact ? 10 : 20))
                            .frame(width: geometry.size.width - (horizontalSizeClass == .compact ? 40 : 170), height: 382)
                            
                        }
                        .background(.white)
                        .cornerRadius(16)
                        .padding(EdgeInsets(top: 16, leading: horizontalSizeClass == .compact ? 16 : 85, bottom: 16, trailing: horizontalSizeClass == .compact ? 16 : 85))

                    }
                }
                .background(Color.clear.ignoresSafeArea(.all, edges: .top))
                .overlay(
                    isLoading ?
                    LoadingView_SimulatorFarm(downloadProgress: $downloadProgress, progress: downloadProgress)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.black.opacity(0.5))
                            .cornerRadius(10)
                            .padding()
                            .foregroundColor(.white)
                            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
                            .ignoresSafeArea() : nil
                )
                
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text(alertTitle),
                        message: Text(alertMessage),
                        dismissButton: .default(Text("OK")) {
                            // Handle dismiss action
                            showAlert = false
                        }
                    )
                }
                
                if showCustomAlert {
                    Color.black.opacity(0.5)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)
                        .overlay(
                            CustomAlertView(isPresented: $showCustomAlert, networkManager: networkManager)
                                .cornerRadius(10)
                                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.3)
                                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
                                .task {
                                    try? await Task.sleep(nanoseconds: 3_000_000_000)
                                    withAnimation {
                                        showCustomAlert = false
                                    }
                                }
                        )
                }
            }
            .navigationBarBackButtonHidden(true)
            .onAppear {
                hideToolbar = true
                imageData = mod.imageData
            }
            .hideToolbar(isHidden: hideToolbar)
        }
    }
}




@available(iOS 16, *)
struct ToolbarModifier: ViewModifier {
    
    var isHidden: Bool
    
    func body(content: Content) -> some View {
        content
            .toolbar(isHidden ? .hidden : .visible, for: .tabBar)
            .animation(.easeInOut, value: isHidden)
    }
}

@available(iOS 16, *)
struct ToolbarModifierBG: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .toolbarBackground(Color.black.opacity(0.7), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
    }
}

extension View {
    @ViewBuilder
    func hideToolbar(isHidden: Bool = true) -> some View {
        if #available(iOS 16, *) {
            self
                .modifier(ToolbarModifier(isHidden: isHidden))
        } else {
            
        }
    }
    
    @ViewBuilder
    func toolbarBG() -> some View {
        if #available(iOS 16, *) {
            self
                .modifier(ToolbarModifierBG())
        } else {
            
        }
    }
}


