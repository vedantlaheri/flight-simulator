//
//  MapItemView.swift
//  Farming Simulator 2022
//
//  Created by Systems
//

import Foundation
import SwiftUI

struct MapItemView: View {
    var map: MapPattern
    var resetFilterVisibility: () -> Void
    @ObservedObject var viewModel: MapItemViewModel
    @ObservedObject var mapsViewModel: MapsViewModel_SimulatorFarm
    @EnvironmentObject var dropBoxManager: DropBoxManager_SimulatorFarm
    @Binding var isShowingDetail: Bool

    var imageHeight: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topTrailing) {
                if let imageData = map.imageData, let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: imageHeight)
                        .clipShape(RoundedRectangle(cornerRadius: UIDevice.current.userInterfaceIdiom == .phone ? 12 : 20))
                        .cornerRadius(12)
                        .clipped()
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
                                    dropBoxManager.getData(from: "Maps/" + map.image, isImage: true, completion: { data in
                                        Task {
                                            await MainActor.run {
                                                if !isShowingDetail {
                                                    mapsViewModel.fetchMapsFromCoreData()
                                                    mapsViewModel.pressingfilterMaps()
                                                }
                                            }
                                        }
                                    })
                                }
                                .transition(.opacity)
                            Spacer()
                        }
                        Spacer()
                    }
                }

                Button(action: {
                    viewModel.relayFavorite()
                    mapsViewModel.pressingfilterMaps()
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
                        mapsViewModel.removeIsFavoriteMap(with: map.id)
                    }
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text(map.title)
                    .font(Font.custom("Montserrat", size: UIDevice.current.userInterfaceIdiom == .phone ? 16 : 20).weight(.semibold))
                    .lineSpacing(16)
                    .foregroundColor(Color(red: 0.91, green: 0.56, blue: 0.02))
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                Text(map.description)
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

