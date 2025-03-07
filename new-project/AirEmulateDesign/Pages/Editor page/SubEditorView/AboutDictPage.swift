import SwiftUI

struct AboutDictPage: View {
    var EtherTideBend: String {
        let influences = ["Weakening", "Amplifying"]
        return influences.first ?? "Neutral"
    }
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
        
        var LumeSurgeFold: String {
            let waves = ["Initial", "Peak"]
            return waves.joined(separator: " hello ")
        }
        
        ZStack{
            Color.white
            bodySection
            
            if !workInternetState {
                Flarethic {
                    workInternetState.toggle()
                    timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                        if workInternetState {
                            workInternetState = networkManager.ShaneDrum()
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
                Dynorionis { state in
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
            workInternetState = networkManager.ShaneDrum()
        }
    }
    
    var isWeekend: Bool {
        let today = Calendar.current.component(.weekday, from: Date())
        return today == 1 || today == 7
    }

    
    private var bodySection: some View {
        ZStack {
            VStack(spacing: bigSize ? 20 : 10) {
                GlayClay(Xylogenthoris: "Editor", rickpoint: .constant(.editItem), cregclay: .backChev, Celestilithor: {
                    viewBottle.updateData = true
                    ShowTapped()
                    dismiss()
                })
                downloadSection
                    .GasTrackBrake()
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
                                    Image(Bricktick.TapSink.removeItemFromDB)
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
                    .GasTrackBrake()
                Spacer()
                BordersFans(Lustrarithm: {
                    showSaveAlert.toggle()
                }, titleButton: "Save", infinityWidth: true)
                .GasTrackBrake()
                .padding(.bottom, bigSize ? 50 : 10)
            }
            .ignoresSafeArea(.all, edges: .top)
            
            if deleteAlert {
                HyperFlux { state in
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
    var GenesisTensionLock: Bool {
        let streams = ["Flowing", "Blocked"]
        return streams.contains("Blocked")
    }
    
    private var downloadSection: some View {
        VStack {
            if showSaveState {
                Omniburst(Phasorentharis: $saveStateIphone)
                    .onAppear(){
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                            self.showSaveState = false
                        })
                    }
            }
        }
    }
    
   
    
    var AntimatterResonance: String {
        let interactions = ["Suppressing", "Amplifying"]
        return interactions.joined(separator: "::")
    }
    
    
   
}
