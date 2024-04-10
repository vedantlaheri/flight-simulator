//
//  MapsView_SimulatorFarm.swift
//  Farming Simulator 2022
//
//  Created by Systems
//

import Foundation
import SwiftUI

struct MapsView_SimulatorFarm: View {
    @Binding var isSearching: Bool
    @Binding var mapsSelectedFilter: FilterType_SimulatorFarm 
    @Binding var isFilterVisible: Bool
    @State private var searchText = ""
    @State private var circleOffset: CGFloat = 0
    @State private var selectedMap: MapPattern?
    @State private var maps: [MapPattern] = []
    @State private var isFilterButtonSelected = false
    @ObservedObject private var mapsViewModel = MapsViewModel_SimulatorFarm()
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State private var isShowingDetail = false
    @State private var scrollId = UUID()
    
    private func resetFilterVisibility() {
           isFilterVisible = false
       }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("loadscreen")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .ignoresSafeArea(.all)
                    .overlay(
                        Color.black.opacity(0.4)
                    )
                    .blur(radius: 4)
                
                VStack(spacing: 12) {
                    HStack(spacing: 0) {
                        Button(action: {
                            isFilterVisible.toggle()
                            isFilterButtonSelected.toggle()
                        }) {
                            Image(isFilterButtonSelected ? "filter1" : "filter")
                                .resizable()
                                .frame(width: horizontalSizeClass == .compact ? 24 : 32, height: horizontalSizeClass == .compact ? 24 : 32)
                                .opacity(isSearching ? 0 : 1)
                        }
                        Spacer()
                        Text("Maps")
                            .font(Font.custom("Montserrat", size: 28).weight(.bold))
                            .lineSpacing(20)
                            .foregroundColor(Color(red: 0.97, green: 0.97, blue: 0.97))
                            .opacity(isSearching ? 0 : 1)
                        
                        Spacer()
                        Button(action: {
                            isSearching.toggle()
                            isFilterVisible = false
                        }) {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .frame(width: horizontalSizeClass == .compact ? 24 : 32, height: horizontalSizeClass == .compact ? 24 : 32)
                                .foregroundColor(.white)
                                .opacity(isSearching ? 0 : 1)
                            
                        }
                    }
                    .padding(EdgeInsets(
                        top: horizontalSizeClass == .compact ? 20 : 40,
                        leading: horizontalSizeClass == .compact ? 20 : 85,
                        bottom: horizontalSizeClass == .compact ? 20 : 40 ,
                        trailing: horizontalSizeClass == .compact ? 20 : 85
                    ))
                    .frame(maxWidth: .infinity, minHeight: 64, maxHeight: 64)
                    .cornerRadius(20)
                    .shadow(radius: 4)
                    
                    if isSearching && mapsViewModel.filteredMaps.isEmpty && !searchText.isEmpty {
                        Spacer()
                        Text("Sorry, we didn’t find anything")
                            .foregroundColor(Color(red: 0.91, green: 0.56, blue: 0.02))
                            .font(Font.custom("Montserrat", size: 18).weight(.bold))
                            .multilineTextAlignment(.center)
                            .lineSpacing(5)
                            .padding(.bottom, 70)
                            Spacer()
                        
                    } else if mapsSelectedFilter == .favorite && mapsViewModel.filteredMaps.isEmpty {
                        Spacer()
                        Text("Your Favourites list is empty at the moment")
                            .foregroundColor(Color(red: 0.91, green: 0.56, blue: 0.02))
                            .font(Font.custom("Montserrat", size: 18).weight(.bold))
                            .multilineTextAlignment(.center)
                            .lineSpacing(5)
                            .padding(.bottom, 70)
                        Spacer()
                    } else {
                        ScrollView {
                            LazyVGrid(columns: getColumns(geometry: geometry), spacing: 16) {
                                ForEach(mapsViewModel.filteredMaps, id: \.id) { map in
                                    NavigationLink(destination: MapsDetailView(map: map, selectedMap: $selectedMap).onDisappear { isShowingDetail = false }) {
                                        MapItemView(map: map, resetFilterVisibility: resetFilterVisibility, viewModel: MapItemViewModel(map: map), mapsViewModel: mapsViewModel, isShowingDetail: $isShowingDetail, imageHeight: horizontalSizeClass == .compact ? geometry.size.height / 6.5 : geometry.size.height / 8)
                                            .frame(height: horizontalSizeClass == .compact ? geometry.size.height / 3 : geometry.size.height / 3.5 )
                                            .background(Color.white)
                                            .cornerRadius(20)
                                            .padding(.horizontal, horizontalSizeClass == .compact ? 5 : 10)
                                    }.simultaneousGesture(TapGesture().onEnded({
                                        isShowingDetail = true
                                    }))
                                }
                            }
                            .padding(EdgeInsets(
                                top: horizontalSizeClass == .compact ? 10 : 20,
                                leading: .zero,
                                bottom: horizontalSizeClass == .compact ? 100 : 80 ,
                                trailing: .zero
                            ))
                        }
                        .id(scrollId)
                        .onAppear {
                            scrollId = UUID()
                        }
                    }
                }
                
                if isFilterVisible {
                    VStack {
                        HStack {
                            FilterView(selectedFilter: $mapsSelectedFilter)
                                .frame(width: horizontalSizeClass == .compact ? 204 : geometry.size.width / 3, height: horizontalSizeClass == .compact ? 176 : geometry.size.height / 3 )
                                .padding(.top, horizontalSizeClass == .compact ? 56 : 0)
                                .onTapGesture {
                                    isFilterVisible = false
                                }
                            Spacer()
                        }
                        .padding(.leading, horizontalSizeClass == .compact ? 20 : 70)
                        Spacer()
                    }
                    .cornerRadius(20)
                    .shadow(radius: 4)
                }

                if isSearching {
                    SearchView(isSearching: $isSearching, searchText: $searchText, selectFilter: $mapsSelectedFilter)
                        .padding(EdgeInsets(
                            top: -geometry.size.height * 0.49,
                            leading: horizontalSizeClass == .compact ? 12 : 85,
                            bottom: horizontalSizeClass == .compact ? 8 : 40 ,
                            trailing: horizontalSizeClass == .compact ? 12 : 85
                        ))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                }
                
            }
            .onAppear {
                NotificationCenter.default.addObserver(forName: NSNotification.Name("MapPatternChanged"), object: nil, queue: nil) { notification in
                    if let updatedMap = notification.object as? MapPattern {
                        if let index = mapsViewModel.maps.firstIndex(where: { $0.id == updatedMap.id }) {
                            mapsViewModel.maps[index] = updatedMap
                            mapsViewModel.generateFavoriteMaps()
                        }
                    }
                }
                maps = PersistenceController.shared.getMaps_SimulatorFarm()
            }
            
            .onChange(of: isFilterVisible) { newValue in
                isFilterButtonSelected = newValue
            }
            
            .onChange(of: searchText) { _ in
                mapsViewModel.searchText = searchText
                mapsViewModel.pressingfilterMaps()
            }
            
            .onChange(of: mapsSelectedFilter) { _ in
                mapsViewModel.generateFavoriteMaps()
                mapsViewModel.mapsSelectedFilter = mapsSelectedFilter
                mapsViewModel.pressingfilterMaps()
            }
            
            .onDisappear {
                isSearching = false
            }
        }
        .onAppear {
            mapsViewModel.generateFavoriteMaps()
            searchText = ""
            isFilterVisible = false
            mapsViewModel.fetchMapsFromCoreData()
            mapsViewModel.pressingfilterMaps()
        }
        .onTapGesture {
            hideKeyboard_search()
            isFilterVisible = false
            isFilterButtonSelected = false
        }
        .ignoresSafeArea(.keyboard)
//        .ignoresSafeArea(edges: (mapsSelectedFilter == .favorite && mapsViewModel.filteredMaps.isEmpty) || (isSearching && mapsViewModel.filteredMaps.isEmpty && !searchText.isEmpty) ? [] : [.bottom])
        .ignoresSafeArea(edges: [.bottom])
    }

    func getColumns(geometry: GeometryProxy) -> [GridItem] {
        if horizontalSizeClass == .compact {
            return Array(repeating: .init(.fixed(geometry.size.width / 1.13)), count: 1)
        } else {
            return Array(repeating: .init(.adaptive(minimum: geometry.size.width / 3, maximum: geometry.size.width / 2.4)), count: 2)
        }
    }
}


