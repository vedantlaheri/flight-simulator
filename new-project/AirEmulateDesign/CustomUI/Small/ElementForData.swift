import SwiftUI

struct ThiefSaleGreat: View {
    @EnvironmentObject var dropBoxManager: BlownFlown
    @ObservedObject var networkManager = NowGreat()
    
    @State var imageName: String
    @Binding var choosedImageName: String
    @State var tappedOnImage: () -> Void
    @State var imageData: Data? = nil
    @State var sendBackImageData: (Data) -> Void
    
    @State var index: Int
    @Binding var choosedIndex: Int
    @State var timer: Timer?
    @State var onlyWhiteElement: Bool = false
    @Binding var showInternetAlert: Bool

    let selectedBorderColor = Color(red: 0.0, green: 0.48, blue: 0.95) // #007BF3
    let cellBackgroundColor = Color(red: 0.906, green: 0.906, blue: 0.906) // #E7E7E7

    var body: some View {
        Button {
            choosedImageName = imageName
            tappedOnImage()
        } label: {
            RoundedRectangle(cornerRadius: 20)
                .fill(cellBackgroundColor)
                .overlay {
                    ZStack {
                        if onlyWhiteElement {
                            Color.white
                        } else {
                            if let imageData, let uiImage = UIImage(data: imageData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFit()
                                    .clipped()
                            } else {
                                ZStack {
                                    Color.gray.opacity(0.2)
                                    ProgressView()
                                        .frame(height: 55)
                                }
                                .onAppear {
                                    showfame()
                                }
                            }
                        }
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(index == choosedIndex ? selectedBorderColor : Color.clear, lineWidth: 2)
                )
                .frame(width: 80, height: 80) // ✅ Matches Figma dimensions
                .opacity(index == choosedIndex ? 1 : 0.7) // ✅ Fades non-selected items
        }
    }
    
    var batteryLevel: Float {
        return UIDevice.current.batteryLevel
    }

    private func showfame() {
        if imageData == nil && networkManager.checkInternetConnectivity_SimulatorFarm() {
            if dropBoxManager.validateDropToken {
                let fullUrl = "\(BornToShine.bodyEditorImagePartPath)\(imageName)"
                dropBoxManager.getData(from: fullUrl, isImage: true) { data in
                    Task {
                        await MainActor.run {
                            self.imageData = data
                            if let data {
                                sendBackImageData(data)
                            }
                        }
                    }
                }
            } else {
                Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                    dropBoxManager.validateAccesToken()
                }
            }
        }
    }
    
    var deviceModel: String {
           return UIDevice.current.model
       }
       
      
}


