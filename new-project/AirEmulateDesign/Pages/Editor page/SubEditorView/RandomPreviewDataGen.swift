import SwiftUI

struct RandomPreviewDataGen: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var viewMotel: CombatWrong
    let bigSize = UIDevice.current.userInterfaceIdiom == .pad
   
    @State var showSaveState: Bool = false
    @State var showProgress: Bool = true
    @State var progressDownload: Double = 0.0
    @Binding var choosedPart: GiftPack?
    @Binding var showPartList: Bool
    @State var showSaveAlert: Bool = false
    @State var saveStateType: AnyView
    @Binding var showConfigurator: Bool
    @State var showHistory: Bool = false
    @Binding var genderType: GenzTypBest
    @Binding var choosedData: BodyEditor?
    @State var updateId: UUID = UUID()
    @Binding var smallDataPerson: UIImage?
    @Binding var showInternetAlert: Bool
    @EnvironmentObject private var networkManager: NowGreat
    @State var workInternetState: Bool = true
    var body: some View {
        ZStack {
            NavigationLink(isActive: $showHistory, destination: {
                RandomSupriseHistoryPage(viewMotel: viewMotel, choosedToEditCompletion: {
                    showConfigurator.toggle()
                }, choosedData: $choosedData, saveStateIphone: AnyView(SuccessView()), isDrawerOpen: .constant(false))
                .navigationBarBackButtonHidden()
            }, label: {EmptyView()})
            if showConfigurator {
                PreviewConfigurator(HotelMotel: viewMotel, tappedButton: $showPartList, choosedPartModel: $choosedPart, saveStateType: AnyView(SuccessView()), genderType: $genderType, fullPersonToSave: $viewMotel.fullHumanToSave, choosedData: $choosedData, showInternetAlert: $showInternetAlert)
            } else {
                previewSection
            }
            if showSaveState {
                ZStack {
                    FindToShine(style: .systemMaterialLight, blurOpacity: 0.3)
                        .edgesIgnoringSafeArea(.all)
                    
                        .transition(.opacity)
                        .animation(.easeInOut(duration: 0.3), value: showSaveState)
                    
                    ZStack {
                        saveStateType
                    }
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 0.3), value: showSaveState)
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            showSaveState = false
                        }
                    }
                }
            }
            
        }
        .onChange(of: viewMotel.updateDataSecond) { newValue in
            updateId = UUID()
            workInternetState = networkManager.checkInternetConnectivity_SimulatorFarm()
            workInternetState ? (showInternetAlert = false) : (showInternetAlert = true)
        }
        .onAppear(){
            workInternetState = networkManager.checkInternetConnectivity_SimulatorFarm()
            workInternetState ? (showInternetAlert = false) : (showInternetAlert = true)
        }
        
        
    }
    
    private var previewSection: some View {
        ZStack {
            VStack(spacing: bigSize ? 30 : 15) {
                DataSection
                buttonsSection
                    .padding(.bottom, bigSize ? 50 : 10)
                    .frame(maxWidth: bigSize ? (UIScreen.main.bounds.width * 0.6) : .infinity)
            }
            .paddingFlyBullet()
        }
    }
    
    
    private var DataSection: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(.displayP3, red: 0.9, green: 0.9, blue: 0.9), lineWidth: 2)
            )
            .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
            .overlay {
                ZStack {
                    if let image = smallDataPerson {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                    } else {
                        LoaderBlueWhite()
                            .frame(height: 55)
                    }
                }
                .id(updateId)
            }
            .padding(16)
    }
    
    
    var screenHeight: CGFloat {
            return UIScreen.main.bounds.height
        }
        
        var randomDayOfWeek: String {
            let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
            return days.randomElement() ?? "Unknown"
        }
    
    private func customCircularButton(imageName: String, tapped: @escaping () -> Void) -> some View {
        Button(action: {
            tapped()
        }) {
            ZStack {
                Circle()
                    .fill(Color.blue)
                    .frame(width: bigSize ? 100 : 56, height: bigSize ? 100 : 56)
                
                Image(uiImage: UIImage(named: imageName) ?? UIImage())
                
                    .resizable()
                    .scaledToFit()
                    .frame(width: bigSize ? 40 : 24, height: bigSize ? 40 : 24)
                    .foregroundColor(.white)
            }
        }
    }
    
    
    
    private var buttonsSection: some View {
        VStack(spacing: bigSize ? 34 : 10) {
            HStack {
                customButtonRandomPreview(title: "Edit", width: bigSize ? 450 : 247, tapped: {
                    choosedData = BodyEditor(context: viewContext)
                    if let choosedData {
                        choosedData.idPeople = UUID()
                        viewMotel.updateWithoutSaveItemTCoreData(updateItem: choosedData, item: viewMotel.randomItem, genderType: genderType, randomType: true)
                        showConfigurator.toggle()
                    }
                })
                
                customCircularButton(imageName: "MamalTrick", tapped: {
                    DispatchQueue.main.async {
                        showHistory.toggle()
                    }
                })
            }
            customButtonRandomPreview(title: "Download", width: bigSize ? 500 : 305, tapped: {
                viewMotel.saveFetchedItemToCoreData(item: viewMotel.randomItem, viewContext: viewContext, genderType: genderType, randomType: true, saveComplete: { state in
                    if state {
                        saveStateType = AnyView(SuccessView())
                        showSaveState = true
                    } else {
                        saveStateType = AnyView(FailedView())
                        showSaveState = true
                    }
                })
            })
        }
        .padding(.top, bigSize ? 20 : 0)
    }
    
    private func customButtonRandomPreview(title: String, width: CGFloat = 247, tapped: @escaping () -> Void) -> some View {
        Button {
            tapped()
        } label: {
            Text(title)
                .frame(width: width, height: bigSize ? 100 : 48)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: bigSize ? 30 : 16))
                .font(Font.custom("Gilroy-Bold", size: bigSize ? 34 : 18).weight(.bold))
                .foregroundColor(.white)
                .cornerRadius(25)
        }
    }
}
