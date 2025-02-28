import SwiftUI

struct RandomSupriseHistoryPage: View {
   
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \BodyEditor.date, ascending: false)],
                        predicate: NSPredicate(format: "randomKey == %@", NSNumber(value: true)))
        private var allData: FetchedResults<BodyEditor>
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewMotel: CombatWrong
    let bigSize = UIDevice.current.userInterfaceIdiom == .pad
    @State var choosedToEditCompletion: () -> Void
    @State var deleteAlert: Bool = false
    @Binding var choosedData: BodyEditor?
    @State var showSaveAlert: Bool = false
    @State var showSaveState: Bool = false
    @State var saveStateIphone:AnyView
    @Binding var isDrawerOpen: Bool
    
    @EnvironmentObject private var networkManager: NowGreat
    @State var workInternetState: Bool = true
    @State var timer: Timer?
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack() {
                HistoryheaderSection
                
                ZStack(alignment: .top) {
                    Color.white
                        .clipShape(GroundGrape(radius: 20, corners: [.topLeft, .topRight]))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.bottom)
                        .overlay(bodySectionMain.padding(.top, 20))
                    
                    
                    if !workInternetState {
                        LostConnection {
                            workInternetState.toggle()
                            timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                                if workInternetState {
                                    workInternetState = networkManager.ShaneDrum()
                                }
                            }
                        }
                    }
                }
                .onAppear(){
                    workInternetState = networkManager.ShaneDrum()
                }
                
                
            }
            .edgesIgnoringSafeArea(.top)
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
                                saveStateIphone
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
    
    
    private var HistoryheaderSection: some View {
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
                .padding(.leading, 30)

                Spacer()
                Text("History")
                    .font(Font.custom("Gilroy-Heavy", size: 24).weight(.heavy))
                    .foregroundColor(.white)
                    .padding(.trailing, 60)
                
                Spacer()
            }
        }
        .frame(height: 60)
        .padding(.top, 60)
        .padding(.bottom, 10)
    }

    private var bodySectionMain: some View {
        ZStack {
            VStack(spacing: bigSize ? 31 : 10) {
                bodySection
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
           

           
            if showSaveAlert {
                OkSaveEditorAlertDisplay { state in
                    if state {
                        viewMotel.requestPhotoLibraryPermission { granted in
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
    }
    

    
    private var bodySection: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: [GridItem(.flexible(), spacing:bigSize ? 30: 10), GridItem(.flexible(), spacing: bigSize ? 30:10)], spacing: bigSize ? 30: 10) {
                ForEach(allData, id: \ .idPeople) { item in
                    cellToCollection(item: item)
                }
            }
            .padding(.top, 10)
        }
    }
    
    private func cellToCollection(item: BodyEditor) -> some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(width: bigSize ? 300 :175, height: bigSize ? 445 :300)
            .shadow(radius: 10)
            .overlay {
                VStack(spacing: 0) {
                    HStack {
                        Button(action: {
                            choosedData = item
                            choosedToEditCompletion()
                            dismiss()
                        }) {
                            Text("EDIT")
                                .font(Font.custom("Gilroy-Bold",  size: bigSize ? 24 : 12).weight(.bold))
                                .foregroundColor(.white)
                                .frame(width: bigSize ? 180 :103, height:bigSize ? 50 : 30)
                                .background(Color.blue)
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                        }
                        Button(action: {
                            choosedData = item
                            DispatchQueue.main.async {
                                deleteAlert.toggle()
                            }
                        }) {
                            Image(systemName: "trash")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.white)
                                .padding(10)
                                .frame(width:bigSize ? 50 :30,height: bigSize ? 50 :30)
                                .background(Color.blue)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal, 5)
                    .padding(.top, 10)

                    Image(uiImage: UIImage(data: item.smallPreviewImage ?? Data()) ?? UIImage())
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 10)
                        .padding(.top, 5)

                    Spacer()

                    Button(action: {
                        choosedData = item
                        showSaveAlert = true
                    }) {
                        Text("DOWNLOAD")
                            .font(Font.custom("Gilroy-Bold",size: bigSize ? 24 : 12).weight(.bold))
                            .foregroundColor(.white)
                            .frame(width: bigSize ? 200 :138, height: bigSize ? 50 :30)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: bigSize ? 30 :25))
                    }
                    .padding(.bottom, 10)
                }
            }
    }

    
    
    private func buttonCustom(tapped: @escaping () -> Void, iconType: Bricktick.TapSink, redColor: Bool = false) -> some View {
        Button {
            tapped()
        } label: {
            RoundedRectangle(cornerRadius: bigSize ? 31 : 14)
                .fill(redColor ? Color.red.opacity(0.74) : Color.white.opacity(0.55))
                .frame(width: bigSize ? 93 : 40, height: bigSize ? 93 : 40)
                .overlay {
                    Image(iconType.BillGill())
                        .resizable()
                        .scaledToFit()
                        .padding( bigSize ? 20 : 10)
                }
        }
        .frame(maxWidth: .infinity)
    }
    
    var randomRGBColor: (red: CGFloat, green: CGFloat, blue: CGFloat) {
          return (CGFloat.random(in: 0...1), CGFloat.random(in: 0...1), CGFloat.random(in: 0...1))
      }
      
      var reversedAppName: String {
          let appName = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? "Unknown"
          return String(appName.reversed())
      }

}


