//
//  ContentView.swift
//  Farming Simulator 2022
//
//  Created by Systems
//

import SwiftUI
import CoreData

struct FarmSimulation: View {
    
    @EnvironmentObject private var networkManager: NetworkManager_SimulatorFarm
    @State private var isInternetConnected = true
    @State private var showAlert = false
    @State private var tabSelect = true
    @State private var previusTab = 0
    @State private var selectedTab = 0
    @State private var directoryName = "Mods"
    @State private var isFilterVisible = false
    @State private var isSearching = false
    @State private var modsSelectedFilter: FilterType_SimulatorFarm = .all
    @State private var mapsSelectedFilter: FilterType_SimulatorFarm = .all
    @State private var farmsSelectedFilter: FilterType_SimulatorFarm = .all
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .black.withAlphaComponent(0.7)
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
        UITabBar.appearance().scrollEdgeAppearance = appearance

    }
    
    var body: some View {
        VStack() {
            
                TabView(selection: $selectedTab) {
                    NavigationView {
                        ModsView(isSearching: $isSearching, modsSelectedFilter: $modsSelectedFilter, isFilterVisible: $isFilterVisible)
                    }
                    .toolbarBG()
                        .tabItem {
                            Text("Mods")
                                .font(Font.custom("Montserrat", size: UIDevice.current.userInterfaceIdiom == .phone ? 24 : 32 ))
                            
                                Image(selectedTab == 0 ? "tabler_tractor" : "tabler_tractor2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: UIDevice.current.userInterfaceIdiom == .phone ? 24 : 40, height: UIDevice.current.userInterfaceIdiom == .phone ? 24 : 40)
                           
                        }
                        .tag(0)
                        .onAppear {
                            modsSelectedFilter = .all
                            isSearching = false
                            isFilterVisible = false
                        }
                    NavigationView {
                        MapsView_SimulatorFarm(isSearching: $isSearching, mapsSelectedFilter: $mapsSelectedFilter, isFilterVisible: $isFilterVisible)
                    }
                    .toolbarBG()
                        .tabItem {
                            Text("Maps")
                                .font(Font.custom("Montserrat", size: UIDevice.current.userInterfaceIdiom == .phone ? 24 : 32 ))
                            Image(selectedTab == 1 ? "maps_active" : "maps_inactive")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIDevice.current.userInterfaceIdiom == .phone ? 24 : 40, height: UIDevice.current.userInterfaceIdiom == .phone ? 24 : 40)
                        }
                        .tag(1)
                        .onAppear {
                            mapsSelectedFilter = .all
                            isSearching = false
                            isFilterVisible = false
                        }
                    NavigationView {
                        FarmsView(isSearching: $isSearching, farmsSelectedFilter: $farmsSelectedFilter, isFilterVisible: $isFilterVisible)
                    }
                    .toolbarBG()
                        .tabItem {
                            Text("Farms")
                                .font(Font.custom("Montserrat", size: UIDevice.current.userInterfaceIdiom == .phone ? 24 : 32 ))
                            Image(selectedTab == 2 ? "farms_active" : "farms_inactive")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIDevice.current.userInterfaceIdiom == .phone ? 24 : 40, height: UIDevice.current.userInterfaceIdiom == .phone ? 24 : 40)
                        }
                        .tag(2)
                        .onAppear {
                            farmsSelectedFilter = .all
                            isSearching = false
                            isFilterVisible = false
                        }
                    NavigationView {
                        SettingsView_SimulatorFarm()
                    }
                    .toolbarBG()
                        .tabItem {
                            Text("Settings")
                                .font(Font.custom("Montserrat", size: UIDevice.current.userInterfaceIdiom == .phone ? 24 : 32 ))
                            Image(selectedTab == 3 ? "settings_active" : "settings_inactive")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIDevice.current.userInterfaceIdiom == .phone ? 24 : 40, height: UIDevice.current.userInterfaceIdiom == .phone ? 24 : 40)
                        }
                        .tag(3)
                    
                    
                }
                .accentColor(.white)
                .onChange(of: selectedTab) { newValue in
                    if tabSelect {
                            previusTab = selectedTab
                            tabSelect = false
                            Timer.scheduledTimer(withTimeInterval: 0.25, repeats: false) { _ in
                                tabSelect = true
                            }
                            isFilterVisible = false
                    } else {
                        selectedTab = previusTab
                    }
                }
                .onAppear(perform: {
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                        self.networkManager.checkInternetConnectivity_SimulatorFarm()
                    }
                })
                .onChange(of: networkManager.error) { _ in
                    isInternetConnected = networkManager.checkInternetConnectivity_SimulatorFarm()
                    if !isInternetConnected {
                        showAlert = true
                    }
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("No Internet Connection"),
                        message: Text("Please check your internet connection and try again."),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}



struct FarmSimulation_Previews: PreviewProvider {
    static var previews: some View {
        FarmSimulation()
    }
}
