//
//  CategoryIndicatorView.swift
//  Farming Simulator 2022
//
//  Created by Systems
//

import Foundation
import SwiftUI

struct CategoryIndicatorView: View {
    var isSelected: Bool

    var body: some View {
        ZStack {
            Circle()
                .fill(isSelected ? Color(red: 0.91, green: 0.56, blue: 0.02) : Color.clear)
                .frame(width: 16, height: 16)
        }
        .frame(width: 20, height: 20)
    }
}
