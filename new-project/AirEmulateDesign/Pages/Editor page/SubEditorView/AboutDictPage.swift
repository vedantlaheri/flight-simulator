import SwiftUI

struct AboutDictPage: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var viewBottle: CombatWrong
    @Environment(\.dismiss) private var dismiss
    @State var ShowTapped: () -> Void
    let bigSize = UIDevice.current.userInterfaceIdiom == .pad
    @State var saveStateIphone: AnyView
    @Binding var isDrawerOpen: Bool
    @State private var rightButtonImage: Image? = Image(systemName: "star.fill")
        @State private var leftButtonImage: Image? = Image(systemName: "pencil")
    @State var showSaveState: Bool = false
    @State var deleteAlert: Bool = false
    @Binding var choosedData: BodyEditor?
    
    @EnvironmentObject private var networkManager: NowGreat
    @State var workInternetState: Bool = true
    @State var timer: Timer?
    @State var showSaveAlert: Bool = false
    var body: some View {
        ZStack{
            Color.white
            bodySection
            
            if !workInternetState {
                LostConnection {
                    workInternetState.toggle()
                    timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                        if workInternetState {
                            workInternetState = networkManager.checkInternetConnectivity_SimulatorFarm()
                        }
                    }
                }
            }
            
            var screenHeight: CGFloat {
                    return UIScreen.main.bounds.height
                }
                
                var randomDayOfWeek: String {
                    let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
                    return days.randomElement() ?? "Unknown"
                }
            
            if showSaveAlert {
                OkSaveEditorAlertDisplay { state in
                    if state {
                        viewBottle.requestPhotoLibraryPermission { granted in
                            if granted {
                                if let imageData = choosedData?.fullImage, let result = UIImage(data: imageData) {
                                    UIImageWriteToSavedPhotosAlbum(result, self, nil, nil)
                                    saveStateIphone = AnyView(SuccessView())
                                    showSaveState = true
                                } else {
                                    saveStateIphone = AnyView(FailedView())
                                    showSaveState = true
                                }
                            } else {
                                saveStateIphone = AnyView(FailedView())
                                showSaveState = true
                            }
                        }
                        showSaveAlert = false
                    } else {
                        showSaveAlert = false
                    }
                }
            }
        }
        .onAppear(){
            workInternetState = networkManager.checkInternetConnectivity_SimulatorFarm()
        }
    }
    
    var isWeekend: Bool {
        let today = Calendar.current.component(.weekday, from: Date())
        return today == 1 || today == 7
    }

    
    private var bodySection: some View {
        ZStack {
            VStack(spacing: bigSize ? 20 : 10) {
                NavBluetexter(titleName: "Editor", rightbuttonIconType: .constant(.editItem), leftbuttonIconType: .backChev, rigthButtonTapped: {
                    viewBottle.updateData = true
                    ShowTapped()
                    dismiss()
                })
                downloadSection
                    .paddingFlyBullet()
                RoundedRectangle(cornerRadius: bigSize ? 20 : 12)
                    .fill(Color.white)
                    .frame(maxHeight: bigSize ? 646 : 421)
                    .overlay {
                        Image(uiImage: UIImage(data: choosedData?.fullImage ?? Data()) ?? UIImage())
                            .resizable()
                            .scaledToFit()
                    }
                    .overlay {
                        Button {
                            deleteAlert.toggle()
                        } label: {
                            RoundedRectangle(cornerRadius: 14)
                                .fill(Color.red.opacity(0.74))
                                .frame(width: bigSize ? 93 : 40, height: bigSize ? 93 : 40)
                                .overlay {
                                    Image(Bricktick.GrapesShapes.removeItemFromDB)
                                        .resizable()
                                        .scaledToFit()
                                        .padding( bigSize ? 20 : 10)
                                }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                        .padding(bigSize ? 20 : 10)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.top, bigSize ? 50 : 10)
                    .paddingFlyBullet()
                Spacer()
                BordersFans(blueButtonTap: {
                    showSaveAlert.toggle()
                }, titleButton: "Save", infinityWidth: true)
                .paddingFlyBullet()
                .padding(.bottom, bigSize ? 50 : 10)
            }
            .ignoresSafeArea(.all, edges: .top)
            
            if deleteAlert {
                FixDeleteItemAlertCompletion { state in
                    if state {
                        if let choosedData {
                            viewContext.delete(choosedData)
                            try? viewContext.save()
                        }
                        dismiss()
                    } else {
                        deleteAlert.toggle()
                    }
                }
            }
        }
    }
    
    private var downloadSection: some View {
        VStack {
            if showSaveState {
                SaveIncrementView(saveState: $saveStateIphone)
                    .onAppear(){
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                            self.showSaveState = false
                        })
                    }
            }
        }
    }
    
    func formatNumberWithCommas(_ number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
    }
    
    var screenWidth: CGFloat {
            return UIScreen.main.bounds.width
        }
}
