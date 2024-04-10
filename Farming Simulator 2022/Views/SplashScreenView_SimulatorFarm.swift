//
//  SplashScreenView.swift
//  Farming Simulator 2022
//
//  Created by Systems
//

import SwiftUI

struct SplashScreenView_SimulatorFarm: View {
    @State private var showSplash = false
    @StateObject private var networkManager = NetworkManager_SimulatorFarm()
    @State private var showAlert = false
    
    var body: some View {
        if showSplash {
            FarmSimulation()
        } else {
            GeometryReader { geometry in
                ZStack() {
                    Image("loadscreen")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .ignoresSafeArea(.all)
                    
                    VStack(spacing: 10) {
                        Text("Loading...")
                            .font(.custom("Montserrat", size: fontSize).weight(.bold))
                            .lineSpacing(20)
                            .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
                            .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                            .cornerRadius(20)
                    }
                    .offset(y: geometry.size.height * 0.4)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .onAppear {
                    checkInternetAndShowSplash()
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("No Internet Connection"),
                        message: Text("Please check your internet connection and try again."),
                        dismissButton: .default(Text("OK")) {
                            withAnimation {
                                showSplash = true
                            }
                        }
                    )
                }
            }
        }
    }
    
    private func checkInternetAndShowSplash() {
        if networkManager.checkInternetConnectivity_SimulatorFarm() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0 ) {
                withAnimation {
                    showSplash = true
                }
            }
        } else {
            showAlert = true
        }
    }
    
    private var fontSize: CGFloat {
        return UIDevice.current.userInterfaceIdiom == .phone ? 28 : 40
    }
}

