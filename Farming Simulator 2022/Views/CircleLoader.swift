//
//  CircleLoader.swift
//  Farming Simulator 2022
//
//  Created by Systems
//

import SwiftUI
import Foundation

struct CircleLoaderView_SimulatorFarm: View {
    var progress: Double

    var body: some View {
        VStack {
            ZStack {
                ForEach(0..<8) { index in
                    Circle()
                        .frame(width: 15, height: 15)
                        .foregroundStyle(.black)
                        .scaleEffect(progress >= Double(index) / 8.0 ? 1.0 : 0.1)
                        .offset(
                            x: cos(Double(index) * .pi / 4) * 20,
                            y: sin(Double(index) * .pi / 4) * 20
                        )
                }
            }
        }
    }
}




