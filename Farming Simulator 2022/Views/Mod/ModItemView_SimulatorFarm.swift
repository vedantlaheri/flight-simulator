//
//  ModItemView.swift
//  Farming Simulator 2022
//
//  Created by Systems
//

import Foundation
import SwiftUI

struct ModItemView: View {
    
    var mod: ModPattern
    var resetFilterVisibility: () -> Void
    @ObservedObject var viewModel: ModItemViewModel
    @ObservedObject var modsViewModel: ModViewModel
    @EnvironmentObject var dropBoxManager: DropBoxManager_SimulatorFarm
    @Binding var isShowingDetail: Bool
    @ObservedObject var networkManager = NetworkManager_SimulatorFarm()
    @State private var triggerFetchData: Bool = false
    
    var imageHeight: CGFloat
    
    var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                ZStack(alignment: .topTrailing) {
                    if let imageData = mod.imageData, let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: imageHeight)
                            .clipped()
                            .cornerRadius(12)
                            .clipShape(RoundedRectangle(cornerRadius: UIDevice.current.userInterfaceIdiom == .phone ? 12 : 20))
                            .animation(.none, value: UUID())
                            .transition(.opacity)
                    } else {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                ProgressView()
                                    .frame(height: UIDevice.current.userInterfaceIdiom == .phone ? 120 : 240)
                                    .tint(.black)
                                    .onAppear {
                                        if mod.imageData == nil && networkManager.checkInternetConnectivity_SimulatorFarm() {
                                            dropBoxManager.getData(from: "Mods/" + mod.image, isImage: true, completion: { data in
                                                Task {
                                                    await MainActor.run {
                                                        if !isShowingDetail {
                                                            modsViewModel.fetchModsFromCoreData()
                                                            modsViewModel.pressingfilterMods()
                                                            triggerFetchData = true
                                                        }
                                                    }
                                                }
                                            })
                                        }
                                    }
                                    .onChange(of: triggerFetchData) { newValue in
                                                    
                                                    if newValue {
                                                        modsViewModel.fetchModsFromCoreData()
                                                        modsViewModel.pressingfilterMods()
                                                        triggerFetchData = false
                                                    }
                                                }
                                    .transition(.opacity)
                                Spacer()
                            }
                            Spacer()
                        }
                    }
                    Button(action: {
                        print("Button tapped")
                        viewModel.relayFavorite()
                        modsViewModel.pressingfilterMods()
                        resetFilterVisibility()
                    }) {
                        ZStack {
                            Image(viewModel.isFavorited ? "favorite2" : "favorite1")
                                .frame(width: UIDevice.current.userInterfaceIdiom == .phone ? 32 : 40, height: UIDevice.current.userInterfaceIdiom == .phone ? 32 : 40 )
                                .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                                .cornerRadius(100)
                                .padding(9)
                        }
                    }
                    .onChange(of: viewModel.isFavorited) { newValue in
                        if !newValue {
                            modsViewModel.removeIsFavoriteMods(with: mod.id)
                        }
                    }
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(mod.title)
                        .font(Font.custom("Montserrat", size: UIDevice.current.userInterfaceIdiom == .phone ? 16 : 20).weight(.semibold))
                        .lineSpacing(16)
                        .foregroundColor(Color(red: 0.91, green: 0.56, blue: 0.02))
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    
                    Text(mod.description)
                        .font(Font.custom("Montserrat", size: UIDevice.current.userInterfaceIdiom == .phone ? 12 : 14))
                        .foregroundColor(Color(red: 0.04, green: 0.05, blue: 0.03))
                        .multilineTextAlignment(.leading)
                }
                .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
                Spacer()
            }
            .padding(UIDevice.current.userInterfaceIdiom == .phone ? 12 : 20)
            .cornerRadius(20)
    }
}

