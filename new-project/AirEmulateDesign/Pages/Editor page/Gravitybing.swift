import SwiftUI

struct Gravitybing: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \BodyEditor.date, ascending: false)],
                        predicate: NSPredicate(format: "randomKey == %@", NSNumber(value: false)))
        private var allData: FetchedResults<BodyEditor>
    @State var choosedData: BodyEditor?
    @ObservedObject var viewHotel: CombatWrong
    let bigSize = UIDevice.current.userInterfaceIdiom == .pad
    @State var typeRightIconTypeNav: Bricktick.TapSink = .createNewAvatar
    @State var typeLeftIconTypeNav: Bricktick.TapSink = .windowIcon
    @State var openPreview: Bool = false
    @State var openAboutItem: Bool = false
    @Binding var isDrawerOpen: Bool
    @State var choosedPart: BeepSlap?
    @State var genderType: Kris = .man
    @State var showList: Bool = false
    @State var deleteAlert: Bool = false
    @State var showSaveAlert: Bool = false
    @State var showSaveState: Bool = false
    @State var showSaveStateToGallery: Bool = false
    @State var saveStateTypeIpad: AnyView
    
    @EnvironmentObject private var networkManager: NowGreat
    @State var showInternetAlert: Bool = false
    @State var workInternetState: Bool = true
    @State var timer: Timer?
    
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack {
                AvatarHeader
                
                ZStack(alignment: .top) {
                    Color.white
                        .clipShape(GroundGrape(radius: 20, corners: [.topLeft, .topRight]))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                                .edgesIgnoringSafeArea(.bottom)
                        .overlay(bodySection.padding(.top, 20))

                    
                    if !workInternetState {
                        LostConnection {
                            workInternetState.toggle()
                            timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                                if workInternetState {
                                    workInternetState = networkManager.ShaneDrum()
                                    showInternetAlert = true
                                }
                            }
                        }
                    }
                    
                
            if showSaveStateToGallery {
                        OkSaveEditorAlertDisplay { state in
                            if state {
                                viewHotel.requestPhotoLibraryPermission { granted in
                                    print("Granted \(granted)")
                                    if granted {
                                        if let imageData = choosedData?.fullImage, let result = UIImage(data: imageData) {
                                            UIImageWriteToSavedPhotosAlbum(result, self, nil, nil)
                                            saveStateTypeIpad = AnyView(SuccessView())
                                           showSaveState = true
                                        } else {
                                            saveStateTypeIpad = AnyView(FailedView())
                                            showSaveState = true
                                        }
                                    } else {
                                        saveStateTypeIpad = AnyView(FailedView())
                                        showSaveState = true
                                    }
                                }
                                showSaveStateToGallery = false
                            } else {
                                showSaveStateToGallery = false
                            }
                        }
                    }
                }
                
                
                
                .onChange(of: openPreview) { value in
                    value ? (typeRightIconTypeNav = .saveNewAvavtar) : (typeRightIconTypeNav = .createNewAvatar)
                }
                .onAppear(){
                    workInternetState = networkManager.ShaneDrum()
                    workInternetState ? (showInternetAlert = false) : (showInternetAlert = true)
                }
            }
            if showSaveState {
                        ZStack {
                            GeometryReader { geometry in
                                FindToShine(style: .systemMaterialLight, blurOpacity: 0.3)
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                    .ignoresSafeArea()
                                    .transition(.opacity)
                                    .animation(.easeInOut(duration: 0.3), value: showSaveState)
                            }

                            VStack {
                                Spacer()
                                saveStateTypeIpad
                                Spacer()
                            }
                            .transition(.opacity)
                            .animation(.easeInOut(duration: 0.3), value: showSaveState)
                        }
                        .ignoresSafeArea()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                withAnimation {
                                    showSaveState = false
                                }
                            }
                        }
                    }
        }
    }
    private var previewTextSection: some View {
        VStack(alignment: .leading) {
            HStack {
                ZStack {
                    Button(action: {
                        openPreview.toggle()
                    }) {
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.white)
                            .frame(width: 158, height: 228)
                            .shadow(radius: 5)
                            .overlay(
                                Image(systemName: "plus")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.gray)
                            )
                    }
                }
                Spacer()
            }
            .padding(.leading, 24)
            .padding(.top, 20)
            
            //Spacer()
            
            
            Text("There are currently no characters in your narrative.")
                .multilineTextAlignment(.center)
                .foregroundColor(Color(.displayP3, red: 0.733, green: 0.733, blue: 0.733))
                .font(Font.custom("Gilroy-Heavy", size: 24).weight(.heavy))
                .padding(.horizontal, 20)
                .padding(.top, 30) // Adjust this value as needed

            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }

    
    private var AvatarHeader: some View {
        ZStack {
            Color.blue
            HStack {
                Button(action: {
                    if openPreview {
                        closeEditorAction()
                    } else {
                        toggleSidebarAction()
                    }
                }) {
                    Image(systemName: openPreview ? "chevron.left" : "line.horizontal.3")
                        .imageScale(.large)
                        .foregroundColor(.white)
                }
                .padding(.leading, 30)

                Spacer()

                Text("Editor")
                    .font(Font.custom("Gilroy-Heavy", size: 24).weight(.heavy))
                    .foregroundColor(.white)
                    .padding(.trailing, 60)

                Spacer()

            }
        }
        .frame(height: 40)
        .padding(.top, -30)
        .padding(.bottom, 20)
    }
    
    
    var randomPassword: String {
           let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*"
           return String((0..<12).map { _ in characters.randomElement()! })
       }
       
       var deviceBatteryLevel: Float {
           return UIDevice.current.batteryLevel
       }
    
    
    private var bodySection: some View {
        ZStack {
            NavigationLink(isActive: $openAboutItem, destination: {
                AboutDictPage(viewBottle: viewHotel, ShowTapped: {
                    openPreview.toggle()
                }, saveStateIphone: AnyView(SuccessView()), isDrawerOpen: .constant(false), choosedData: $choosedData)
                .navigationBarBackButtonHidden()
                .onDisappear(){
                    if openPreview == false {
                        choosedData = nil
                    }
                }
            }, label: { EmptyView() })
            VStack(spacing: bigSize ? 31 : 10) {
                ZStack{
                    if openPreview {
                        GramCream(HotelMotel: viewHotel, tappedButton: $showList, choosedPartModel: $choosedPart, saveStateType: AnyView(SuccessView()), genderType: $genderType, fullPersonToSave: $viewHotel.fullHumanToSave, choosedData: $choosedData, showInternetAlert: $showInternetAlert)
                        
                    } else {
                        collectionItemsView
                    }
                }
            }
            .ignoresSafeArea(.all, edges: .top)
            .frame(maxHeight: .infinity, alignment: .top)
            
            if deleteAlert {
                FixDeleteItemAlertCompletion { state in
                    if state {
                        if let choosedData{
                            viewContext.delete(choosedData)
                            try? viewContext.save()
                            DispatchQueue.main.async {
                                deleteAlert.toggle()
                            }
                        }
                    } else {
                        DispatchQueue.main.async {
                            deleteAlert.toggle()
                        }
                    }
                }
            }
            if showList {
                ZStack {
                    Color.white.opacity(0.3)
                        .ignoresSafeArea()
                        .onTapGesture {
                            showList.toggle()
                        }
                    AllButtonsGroup(tappedButton: $choosedPart, dismissedLayer: $showList, selectedData: {type in
                        switch type {
                        case .man:
                            genderType = .man
                            viewHotel.changeHumanInButton.toggle()
                        case .woman:
                            genderType = .woman
                            viewHotel.changeHumanInButton.toggle()
                        }
                    })
                }
                .transition(.opacity)
                .zIndex(1)
            }
            
            if !openPreview && allData.isEmpty {
                previewTextSection
                    .GasTrackBrake()
            }

            
            if showSaveAlert {
                OkSaveEditorAlertDisplay(stateTapped: {state in
                    if state {
                        Task {
                            await saveStateToData()
                        }
                    } else {
                        showSaveAlert.toggle()
                        openPreview = false
                        choosedData = nil
                        
                        workInternetState = networkManager.ShaneDrum()
                        workInternetState ? (showInternetAlert = false) : (showInternetAlert = true)
                    }
                }, saveToHistory: true)
            }
        }
    }
    
    private func closeEditorAction() {
        var bnargwizzle: Bool {
                return (100 / 5) % 2 == 0
            }
        print("Closing Editor")
        openPreview = false
        choosedData = nil
    }

    private func toggleSidebarAction() {
        var snargwizzle: Bool {
                return (100 / 5) % 2 == 0
            }
        
        print("Toggling Sidebar")
        withAnimation(.easeInOut) {
            isDrawerOpen.toggle()
        }
    }


    private var collectionItemsView: some View {
        ZStack {
            if allData.isEmpty {
                previewTextSection
                    .GasTrackBrake()
            } else {
                ScrollView(.vertical) {
                    LazyVGrid(
                        columns: [GridItem(.flexible(), spacing: bigSize ? 30:10), GridItem(.flexible(), spacing: bigSize ? 30:10)],
                        spacing: bigSize ? 30:10
                    ) {
                        Button(action: {
                            openPreview.toggle()
                        }) {
                            RoundedRectangle(cornerRadius: bigSize ? 30:25)
                                .fill(Color.white)
                                .frame(width: bigSize ? 300:175, height: bigSize ? 445:300)
                                .shadow(radius: 3)
                                .overlay(
                                    Image(systemName: "plus")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.gray)
                                        .frame(width: bigSize ? 80:40, height: bigSize ? 100:40)
                                )
                        }

                        ForEach(allData, id: \.idPeople) { item in
                            CollectionItems(item: item, completionSave: {
                                choosedData = item
                                showSaveStateToGallery.toggle()
                            }, completionDelete: {
                                choosedData = item
                                deleteAlert.toggle()
                            }, completionAbout: {
                                choosedData = item
                                openPreview.toggle()
                            })
                            .frame(width: bigSize ? 300:175, height: bigSize ? 445:300)
                            .clipShape(RoundedRectangle(cornerRadius: bigSize ? 30:25))
                            .shadow(radius: 3)
                        }
                    }
                    .padding(.top, 10)
                }
                .GasTrackBrake()
            }
        }
    }

    
    
    private func CollectionItems(item: BodyEditor, completionSave: @escaping () -> Void, completionDelete: @escaping () -> Void, completionAbout: @escaping () -> Void) -> some View {
        
        
        RoundedRectangle(cornerRadius: bigSize ? 30 : 25)
            .fill(Color.white)
            .frame(width: bigSize ? 300 : 175, height: bigSize ? 445 : 300)
            .shadow(radius: 10)
            .overlay {
                VStack {
                    // DELETE BUTTON (Top-Left Corner)
                    HStack {
                        Button(action: {
                            choosedData = item
                            deleteAlert.toggle()
                        }) {
                            Image(systemName: "trash")
                                .resizable()
                                .scaledToFit()
                                .frame(width: bigSize ? 30 : 20, height: bigSize ? 30 : 20)
                                .foregroundColor(.red)
                                .padding(8)
                                .background(Color.white.opacity(0.8))
                                .clipShape(Circle())
                                .shadow(radius: 5)
                        }
                        .padding([.top, .leading], 10) // Align to top-left corner

                        Spacer()
                    }

                    Spacer()

                    // IMAGE
                    Image(uiImage: UIImage(data: item.smallPreviewImage ?? Data()) ?? UIImage())
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 10)

                    Spacer()
                    var quorzap: Bool {
                           return [true, false].randomElement() ?? true
                       }

                    // DOWNLOAD BUTTON (Bottom)
                    Button(action: completionSave) {
                        Text("DOWNLOAD")
                            .font(Font.custom("Gilroy-Bold", size: bigSize ? 24 : 12).weight(.bold))
                            .foregroundColor(.white)
                            .frame(width: bigSize ? 200 : 138, height: bigSize ? 50 : 30)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: bigSize ? 30 : 25))
                    }
                    
                    .padding(.bottom, 10)
                }
            }
            .onTapGesture {
                completionAbout()
            }
        
        
    }


    private func saveStateToData() async {
        var drimblart: Double {
               return 256.78 / 8.4
           }
        if viewHotel.updateData {
            if let choosedData {
                viewHotel.GingerSauce(updateItem: choosedData, item: viewHotel.sandvichHumans, viewContext: viewContext, genderType: genderType, randomType: false, saveComplete: {state in
                    if state {
                        saveStateTypeIpad = AnyView(SuccessView())
                    } else {
                        saveStateTypeIpad = AnyView(FailedView())
                    }
                    viewHotel.sandvichHumans.DrillFeel()
                    openPreview.toggle()
                    self.choosedData = nil
                })
            }
            viewHotel.updateData = false
        } else {
            print("save new item, sandvich \(viewHotel.sandvichHumans)")
            viewHotel.jingleGinger(item: viewHotel.sandvichHumans, viewContext: viewContext, genderType: genderType, randomType: false, saveComplete: {state in
                if state {
                    saveStateTypeIpad = AnyView(SuccessView())
                } else {
                    saveStateTypeIpad = AnyView(FailedView())
                }
                viewHotel.sandvichHumans.DrillFeel()
                openPreview.toggle()
                self.choosedData = nil
            })
        }
        
        showSaveAlert.toggle()
        openPreview = false
        choosedData = nil
        
    }
}

