import SwiftUI
import MobileCoreServices
import Foundation

struct AboutInfoPageWithDownload: View {
    let bigSize = UIDevice.current.userInterfaceIdiom == .pad
    @State var titleItemName: String
    @State var favoriteState: Bool
    @Environment(\.dismiss) private var dismiss
    @State var imageData: Data?
    @State var linkDownloadItem: String?
    @State var textItem: String
    @State var navUpdateId: UUID = UUID()

    @State var savingState: AnyView = AnyView(EmptyView())
    @State var showSaveStateAfterCompletion: Bool = false
    @State var showSaveAlertWhenRequired: Bool = false
    @State var showDownloadProgress: Bool = false
    @State var progressDownload: Double = 0.0
    @State var idItemToLike: (Bool) -> ()
    @State var clearItemName: String
    @State var disableButton: Bool = false
    @State var isnew:Bool?
    @Environment(\.presentationMode) var presentationMode
    @State var workInternetState: Bool = true
    
    @EnvironmentObject private var networkManager: NetworkManaged
    @State var timer: Timer?

    @EnvironmentObject var CloudManager: CloudManagerFarm
    @State var isLoading: Bool = false
    @State var isDownloading: Bool = false
    @State var isFileDownloaded: Bool = false

    private func showShareSheet(withURL urlString: String) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let viewController = windowScene.windows.first?.rootViewController else {
            return
        }
        
        
        let activityViewController = UIActivityViewController(activityItems: [URL(fileURLWithPath: urlString)], applicationActivities: nil)

        if UIDevice.current.userInterfaceIdiom == .pad {
                let screenBounds = UIScreen.main.bounds
                let anchor = CGRect(x: screenBounds.width / 2, y: screenBounds.height, width: 0, height: 0)

                activityViewController.popoverPresentationController?.sourceRect = anchor
                activityViewController.popoverPresentationController?.sourceView = viewController.view
        }

        activityViewController.completionWithItemsHandler = { (activity, success, items, error) in
            DispatchQueue.main.async {
                if success {
                    savingState = AnyView(SuccessView())
                    showSaveStateAfterCompletion = true
                } else {
                    savingState = AnyView(FailedView())
                    showSaveStateAfterCompletion = true
                }
                isLoading = false
                disableButton = false
            }
        }
        if let presentedVC = viewController.presentedViewController {
            presentedVC.dismiss(animated: true) {
                viewController.present(activityViewController, animated: true, completion: nil)
            }
        } else {
            viewController.present(activityViewController, animated: true, completion: nil)
        }
    }

    private func URLStringMaker(from fileName: String) -> String {
        let fileArray = fileName.components(separatedBy: "/")

        return (try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(fileArray.last ?? "").path) ?? ""

    }

    
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            
            VStack {
                SectionOfHeader
                
                ZStack (alignment: .top){
                    Color.white
                    .clipShape(RoundedCornersShape(radius: 20, corners: [.topLeft, .topRight]))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.bottom)
                    .overlay(MainBodySection)
                    
                    
                    if showSaveStateAfterCompletion {
                        ZStack {
                            VisualEffectBlur(style: .systemMaterialLight, blurOpacity: 0.3)
                                .edgesIgnoringSafeArea(.all)
                                .transition(.opacity)
                                .animation(.easeInOut(duration: 0.3), value: showSaveStateAfterCompletion)
                            
                            ZStack {
                                savingState
                            }
                            .transition(.opacity)
                            .animation(.easeInOut(duration: 0.3), value: showSaveStateAfterCompletion)
                        }
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                withAnimation {
                                    showSaveStateAfterCompletion = false
                                }
                            }
                        }
                    }
                    
                    if showSaveAlertWhenRequired {
                        OkSaveEditorAlertDisplay(stateTapped: { state in
                            if state {
                                LibraryManager.shared.saveData(image: UIImage(data: imageData ?? Data()), saveCompletion: { error in
                                    if error == nil {
                                        savingState = AnyView(SuccessView())
                                        showSaveStateAfterCompletion = true
                                        showSaveAlertWhenRequired = false
                                    } else {
                                        savingState = AnyView(FailedView())
                                        showSaveStateAfterCompletion = true
                                        showSaveAlertWhenRequired = false
                                    }
                                })
                            } else {
                                showSaveAlertWhenRequired.toggle()
                            }
                        }, saveToHistory: true)
                    }
                    
                    if !workInternetState {
                        LostConnection {
                            workInternetState.toggle()
                        }
                    }
                }
                .onAppear {
                    workInternetState = networkManager.checkInternetConnectivity_SimulatorFarm()
                }
                .onDisappear {
                    timer?.invalidate()
                }
                .onChange(of: progressDownload) { newValue in
                    if newValue >= 1.0 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            self.showDownloadProgress = false
                            self.disableButton = false
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.top)
        }
    }

    

private var SectionOfHeader : some View {
    
    ZStack {
        Color.blue
        HStack {
            Button(action: {
                dismiss()
            }) {
                
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .foregroundColor(.white)
                                                
            }
            .padding(.leading, 45)
            
            Spacer()
            
            Text(titleItemName)
                .font(Font.custom("Gilroy-Heavy", size: 24).weight(.heavy))
                .foregroundColor(.white)
                .lineLimit(1)
                .padding(.trailing, 40)
            
            Spacer()
            
        }
        .padding(.trailing, 30)
    }
    .frame(height: 62)
    .padding(.top, 62)
    .padding(.bottom, 10)
}

private var MainBodySection : some View {
    VStack(spacing: bigSize ? 31 : 10) {
        DataSection
            .padding(.top, bigSize ? 10 : 10)
            .padding(.bottom, bigSize ? 10 : 10)
            .padding(.leading, bigSize ? 10 : 10)
            .padding(.trailing, bigSize ? 10 : 10)
        
        if !titleItemName.isEmpty || !textItem.isEmpty {
            ScrollView(.vertical, showsIndicators: false) {
                textSection
                    .paddingFlyBullet()
            }
        }
        
        VStack {
                                   if showDownloadProgress {
                                       downloadProgess
                                           .paddingFlyBullet()
                                   } else {
                                       downloadButton
                                           .paddingFlyBullet()
                                   }
                               }
    }
}
    

   private var DataSection: some View {
         ZStack {
           RoundedRectangle(cornerRadius: bigSize ? 36 : 20)
               .fill(Color.white)
              .frame(maxHeight: bigSize ? (linkDownloadItem == nil ? 700 : 578) : (linkDownloadItem == nil ? 500 : 318))
               .overlay {
                  ZStack {
                      Image(uiImage: UIImage(data: imageData ?? Data()) ?? UIImage())
                          .resizable()
                          .scaledToFill()
                      if imageData == nil {
                           ColorRide.colorPicker(.darkGray)
                           LoaderBlueWhite()
                               .frame(height: 55)
                       }
                  }
               }
               .clipShape(RoundedRectangle(cornerRadius: 20))
               .zIndex(1)
                          
             Button(action: {
                 // Toggle the favorite state
                 updateFavoriteState()
             }) {
                 if favoriteState {
             
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
     .offset(x: calculateRibbonOffsetX(), y: calculateRibbonOffsetY())
     .zIndex(2)
                    
      }
       .padding(.top, 0)
   }
       
    private func updateFavoriteState() {
        favoriteState.toggle()
        idItemToLike(favoriteState) // If you need to notify the parent view
    }
    
  
   private var textSection: some View {
        VStack(alignment: .leading, spacing: bigSize ? 31 : 17) {
           HStack(alignment: .center, spacing: 4) {
               Text(titleItemName)
                   .font(.custom("Gilroy-Bold", size: bigSize ? 40:24))
                 .fontWeight(.bold)
                 .foregroundColor(.black)
                    .multilineTextAlignment(.center)
               if isnew ?? false {
                   Text("NEW")
                       .font(.custom("Gilroy-Bold", size:bigSize ? 24 : 12))
                       .fontWeight(.bold)
                       .foregroundColor(.blue)
                       .padding(.top, -4)
                       .padding(.vertical, 2)
               }
           }
           .frame(maxWidth: .infinity)
           .multilineTextAlignment(.center)

          Text(textItem)
                .font(.custom("Gilroy-Regular", size:bigSize ? 30 : 16))
            .fontWeight(.regular)
              .foregroundColor(.black)
             .frame(maxWidth: .infinity)
             .multilineTextAlignment(.center)
        }
      .foregroundColor(.black)
   }

    private var downloadSection: some View {
        VStack {
            if showSaveStateAfterCompletion {
                SaveIncrementView(saveState: $savingState)
                    .onAppear(){
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                            self.showSaveStateAfterCompletion = false
                        })
                    }
            }
           
        }
    }
    
    private var downloadProgess: some View {
        VStack {
            if showDownloadProgress {
                DownloadLoadingProgresserView(progressDownload: $progressDownload)
            }        }
    }
    
    
    private func startLoadingAfterTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if progressDownload < 100 {
                progressDownload += 6
            } else {
                timer?.invalidate()
            }
        }
    }

    private var downloadButton: some View {
        VStack {
            if let fileName = linkDownloadItem, !fileName.isEmpty {
                BordersFans(blueButtonTap: {
                    disableButton = true

                    guard networkManager.checkInternetConnectivity_SimulatorFarm() else {
                        workInternetState = false
                        disableButton = false
                        return
                    }

                    if FileManager.default.fileExists(atPath: URLStringMaker(from: clearItemName)) {
                        progressDownload = 100
                        showShareSheet(withURL: URLStringMaker(from: clearItemName))
                        disableButton = false
                        return
                    }

                    isLoading = true
                    isDownloading = true
                    showDownloadProgress = true

                    startLoadingAfterTimer()

                    var correctedFileName = fileName
                    if !correctedFileName.hasPrefix("/") {
                        correctedFileName = "/" + correctedFileName
                    }

                    CloudManager.downloadFileAll(fileName: correctedFileName) { progressData in
                        DispatchQueue.main.async {
                            progressDownload = (progressData.fractionCompleted * 100).rounded() / 100
                        }
                    } completion: { downloadedData in
                        DispatchQueue.main.async {
                            if let isFile = downloadedData {
                                let finalFileName = (correctedFileName as NSString).lastPathComponent
                                let fileManager = FileManager.default

                                let docsURL = try! fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                                var myURLString = docsURL.appendingPathComponent(finalFileName).absoluteString
                                myURLString = myURLString.replacingOccurrences(of: "file://", with: "")

                                fileManager.createFile(atPath: myURLString, contents: isFile, attributes: nil)

                                if fileManager.fileExists(atPath: myURLString) {
                                    isFileDownloaded = true
                                    progressDownload = 100
                                    showShareSheet(withURL: myURLString)
                                } else {
                                    savingState = AnyView(FailedView())
                                    showSaveStateAfterCompletion = true
                                }
                            } else {
                                savingState = AnyView(FailedView())
                                showSaveStateAfterCompletion = true
                            }

                            isDownloading = false
                            isLoading = false
                            disableButton = false
                        }
                    }
                }, titleButton: "Download", infinityWidth: true)
                .padding(.bottom, bigSize ? 50 : 50)
                .disabled(disableButton || isDownloading)
                .opacity((disableButton || isDownloading) ? 0.5 : 1.0)

            } else {
                BordersFans(blueButtonTap: {
                    showSaveAlertWhenRequired = true
                }, titleButton: "Download", infinityWidth: true)
                .padding(.bottom, bigSize ? 50 : 50)
            }
        }
    }
    
    private func calculateRibbonOffsetX() -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        let referenceWidth: CGFloat = 402

        let referenceOffsetX: CGFloat = 165
        let scaleFactor = screenWidth / referenceWidth
        return referenceOffsetX * scaleFactor
    }

    private func calculateRibbonOffsetY() -> CGFloat {
        let screenHeight = UIScreen.main.bounds.height
        let referenceHeight: CGFloat = 874

        let referenceOffsetY: CGFloat = -140
        let scaleFactor = screenHeight / referenceHeight
        return referenceOffsetY * scaleFactor
    }

}

#Preview {
    AboutInfoPageWithDownload(titleItemName: "Name", favoriteState: true, textItem: "Test text", idItemToLike: {_ in}, clearItemName: "")
}
