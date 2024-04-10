//
//  FarmDetailView.swift
//  Farming Simulator 2022
//
//  Created by Systems
//

import Foundation
import SwiftUI

struct FarmDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var farm: FarmModel
    @State private var imageData: Data? = nil
    @Binding var selectedFarm: FarmModel?
    @State private var isNavigatingToDetailView = false
    @State private var farmItemViewModel: FarmItemViewModel
    @ObservedObject var farmsViewModel: FarmsViewModel
    @EnvironmentObject var dropBoxManager: DropBoxManager_SimulatorFarm
    @State private var hideToolbar: Bool = false
    @State private var isInternetAvailable = true
    @ObservedObject var networkManager = NetworkManager_SimulatorFarm()
    
    init(farm: FarmModel, selectedFarm: Binding<FarmModel?>) {
        self.farm = farm
        self._selectedFarm = selectedFarm
        self._farmItemViewModel = State(initialValue: FarmItemViewModel(farm: farm))
        self._farmsViewModel = ObservedObject(initialValue: FarmsViewModel())
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
                        Text("Farms")
                            .font(Font.custom("Montserrat", size: horizontalSizeClass == .compact ? 28 : 32).weight(.bold))
                            .lineSpacing(20)
                            .foregroundColor(Color(red: 0.97, green: 0.97, blue: 0.97))
                        Spacer()
                        Button(action: {

                        }) {
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
                                if let imageData , let uiImage = UIImage(data: imageData) {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                                        .cornerRadius(20)
//                                        .clipShape(RoundedRectangle(cornerRadius: UIDevice.current.userInterfaceIdiom == .phone ? 20 : 32))
                                        .animation(.none, value: UUID())
                                        .transition(.opacity)
                                        .padding(horizontalSizeClass == .compact ? 12 : 20)
                                } else {
                                    ProgressView()
                                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                                        .tint(.black)
                                        .onAppear {
                                            if farm.imageData == nil && networkManager.checkInternetConnectivity_SimulatorFarm() {
                                                dropBoxManager.getData(from: "Buildings/" + farm.image, isImage: true, completion: { data in
                                                    Task {
                                                        await MainActor.run {
                                                            self.imageData = data
                                                            farmsViewModel.fetchFarmsFromCoreData()
                                                            farmsViewModel.pressingFilterFarms()
                                                        }
                                                    }
                                                })
                                            }
                                        }
                                        .onAppear {
                                            self.imageData = farm.imageData
                                        }
                                        .transition(.opacity)
                                        .onChange(of: isInternetAvailable, perform: { newValue in
                                                if newValue && farm.imageData == nil {
                                                    dropBoxManager.getData(from: "Buildings/" + farm.image, isImage: true, completion: { data in
                                                        Task {
                                                            await MainActor.run {
                                                                self.imageData = data
                                                                farmsViewModel.fetchFarmsFromCoreData()
                                                                farmsViewModel.pressingFilterFarms()
                                                            }
                                                        }
                                                    })
                                                }
                                            })
                                }
                                Button(action: {
                                    farmItemViewModel.relayFavorite()
                                }) {
                                    Image(farmItemViewModel.isFavorited ? "favorite2" : "favorite1")
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
                                Text(farm.title)
                                    .font(Font.custom("Montserrat", size: horizontalSizeClass == .compact ? 20 : 32).weight(.semibold))
                                    .lineSpacing(20)
                                    .foregroundColor(Color(red: 0.91, green: 0.56, blue: 0.02))
                                    .multilineTextAlignment(.leading)
                                    .padding(EdgeInsets(
                                        top: horizontalSizeClass == .compact ? 0 : 0,
                                        leading: horizontalSizeClass == .compact ? 12 : 20,
                                        bottom: horizontalSizeClass == .compact ? 8 : 20,
                                        trailing: horizontalSizeClass == .compact ? 12 : 20
                                    ))
                                ScrollView {
                                    Text(farm.description)
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
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            imageData = farm.imageData
            hideToolbar = true
        }
        .hideToolbar(isHidden: hideToolbar)
    }
    
}


