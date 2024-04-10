//
//  CustomAlertsView.swift
//  Farming Simulator 2022
//
//  Created by Systems
//

import SwiftUI
import Foundation

struct CustomAlertView: View {
    @Binding var isPresented: Bool
    let networkManager: NetworkManager_SimulatorFarm
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.clear
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            isPresented = false
                        }
                    }
                
                VStack {
                    VStack(spacing: 16) {
                        ZStack() {
                            Button(action: {
                                withAnimation {
                                    isPresented = false
                                }
                            }) {
                                Image(systemName: "checkmark")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                            .foregroundColor(.black)
                            .cornerRadius(15)
                            .background(Color.white)
                            .clipShape(Circle())
                            .padding(.top, 20)
                        }
                        
                        Text("Loaded")
                            .font(Font.custom("Montserrat", size: 19).weight(.medium))
                            .lineSpacing(22.80)
                            .foregroundColor(Color(red: 0.04, green: 0.05, blue: 0.03))
                            .padding(.horizontal, 20)
                            .padding(.bottom, 20)
                    }
                    .frame(width: UIDevice.current.userInterfaceIdiom == .phone ? 160 : 280, height: UIDevice.current.userInterfaceIdiom == .phone ? 119 : 137 )
                    
                    .background(Color.white)
                    .cornerRadius(24)
                    .shadow(radius: 5)
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}


