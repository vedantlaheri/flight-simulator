//
//  LoadingView_SimulatorFarm.swift
//  Farming Simulator 2022
//
//  Created by Systems
//

import Foundation
import SwiftUI

struct LoadingView_SimulatorFarm: View {
    @Binding var downloadProgress: Double
    var progress: Double
    var body: some View {
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

            VStack(spacing: 16) {
                VStack(spacing: 16) {
                    ZStack {
                        
                        CircleLoaderView_SimulatorFarm(progress: downloadProgress)
                                .frame(width: 40, height: 40)
                                .padding(.bottom, 35)
                        
                        Text(String(format: "%.0f%%", progress * 100.0))
                                           .font(Font.custom("Montserrat", size: 16).weight(.medium))
                                           .fontWeight(.bold)
                                           .foregroundColor(.gray)
                                           .padding(.top, 40)

                        Text("Please wait...")
                            .font(Font.custom("Montserrat", size: 16).weight(.medium))
                            .lineSpacing(19.20)
                            .foregroundColor(Color(red: 0.04, green: 0.05, blue: 0.03))
                            .padding(.top, 70)
                    }
                    .padding(20)
                    .frame(height: 115)
                    .background(Color.white)
                    .cornerRadius(24)
                }
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
        }
    }
}



