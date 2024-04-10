//
//  SettingsView_SimulatorFarm.swift
//  Farming Simulator 2022
//
//  Created by Systems
//

import SwiftUI

struct SettingsView_SimulatorFarm: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var screenHeight: CGFloat = 0

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
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    Button(action: {
                        UIApplication.shared.open(termsOfUseURL)
                    }) {
                        HStack(spacing: 20) {
                            
                            Text("Terms of use")
                                .font(Font.custom("Montserrat", size: 16).weight(.semibold))
                                .lineSpacing(16)
                                .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
                            
                        }
                        .padding(EdgeInsets(top: 20, leading: 17, bottom: 20, trailing: 17))
                        .frame(width: geometry.size.width - 40, alignment: .leading)
                        .background(Color(red: 0.04, green: 0.05, blue: 0.03).opacity(0.90))
                        .cornerRadius(20)
                    }
                    
                    Button(action: {
                        UIApplication.shared.open(privacyPolicyURL)
                    }){
                        HStack(spacing: 20) {
                            
                            Text("Privacy policy")
                                .font(Font.custom("Montserrat", size: 16).weight(.semibold))
                                .lineSpacing(16)
                                .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
                            
                        }
                        .padding(EdgeInsets(top: 20, leading: 16, bottom: 20, trailing: 16))
                        .frame(width: geometry.size.width - 40, alignment: .leading)
                        .background(Color(red: 0.04, green: 0.05, blue: 0.03).opacity(0.90))
                        .cornerRadius(20)
                    }
                }
                .offset(x: 0, y: -geometry.size.height * 0.3)
                
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {

                        
                    }
                    .foregroundColor(.white)
                    .frame(width: 24, height: 24)
                    
                    Spacer()
                    
                    Text("Settings")
                        .font(Font.custom("Montserrat", size: 28).weight(.bold))
                        .lineSpacing(20)
                        .foregroundColor(Color(red: 0.97, green: 0.97, blue: 0.97))
                    
                    Spacer()
                }
                .padding(EdgeInsets(top: UIDevice.current.userInterfaceIdiom == .phone ? 0 : 40, leading: UIDevice.current.userInterfaceIdiom == .phone ? 20 : 85, bottom: UIDevice.current.userInterfaceIdiom == .phone ? 0 : 40, trailing: UIDevice.current.userInterfaceIdiom == .phone ? 20 : 85))
                .frame(width: geometry.size.width, height: 64)
                .offset(x: 0, y: -geometry.size.height * 0.45)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(Color(red: 0.80, green: 0.80, blue: 0.80))
        }
    }
}
