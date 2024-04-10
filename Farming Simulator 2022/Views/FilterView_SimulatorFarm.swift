//
//  FilterView.swift
//  Farming Simulator 2022
//
//  Created by Systems
//

import Foundation
import SwiftUI

struct FilterView: View {
    @Binding var selectedFilter: FilterType_SimulatorFarm

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.clear
                
                VStack(alignment: .leading, spacing: 0) {
                    Button(action: {
                        withAnimation {
                            selectedFilter = .all
                        }
                    }) {
                        Text("All")
                            .font(Font.custom("Montserrat", size: UIDevice.current.userInterfaceIdiom == .phone ? 16 : 20).weight(.semibold))
                            .lineSpacing(16)
                            .foregroundColor(selectedFilter == .all ? Color(red: 0.91, green: 0.56, blue: 0.02) : Color(red: 0.04, green: 0.05, blue: 0.03))
                            .frame(maxWidth: 204, alignment: .leading)
                        
                        CategoryIndicatorView(isSelected: selectedFilter == .all)
                    }
                    .padding(UIDevice.current.userInterfaceIdiom == .phone ? 12 : 20)
                    .frame(maxWidth: .infinity)
                        Divider()
                            .background(Color.gray)
                            .padding(.leading, UIDevice.current.userInterfaceIdiom == .phone ? 12 : 20)
                            .padding(.trailing, UIDevice.current.userInterfaceIdiom == .phone ? 12 : 20)
                    
                    Button(action: {
                        withAnimation {
                            selectedFilter = .top
                        }
                    }) {
                        Text("Top")
                            .font(Font.custom("Montserrat", size: UIDevice.current.userInterfaceIdiom == .phone ? 16 : 20).weight(.semibold))
                            .lineSpacing(16)
                            .foregroundColor(selectedFilter ==  .top ? Color(red: 0.91, green: 0.56, blue: 0.02) : Color(red: 0.04, green: 0.05, blue: 0.03))
                            .frame(maxWidth: 204, alignment: .leading)
                        CategoryIndicatorView(isSelected: selectedFilter ==  .top)
                    }
                    .padding(UIDevice.current.userInterfaceIdiom == .phone ? 12 : 20)
                    .frame(maxWidth: .infinity)
                        Divider()
                            .background(Color.gray)
                            .padding(.leading, UIDevice.current.userInterfaceIdiom == .phone ? 12 : 20)
                            .padding(.trailing, UIDevice.current.userInterfaceIdiom == .phone ? 12 : 20)
                    
                    Button(action: {
                        withAnimation {
                            selectedFilter = .new
                        }
                    }) {
                        Text("New")
                            .font(Font.custom("Montserrat", size: UIDevice.current.userInterfaceIdiom == .phone ? 16 : 20).weight(.semibold))
                            .lineSpacing(16)
                            .foregroundColor(selectedFilter == .new ? Color(red: 0.91, green: 0.56, blue: 0.02) : .black)
                            .frame(maxWidth: 204, alignment: .leading)
                        CategoryIndicatorView(isSelected: selectedFilter == .new)
                    }
                    .padding(UIDevice.current.userInterfaceIdiom == .phone ? 12 : 20)
                    .frame(maxWidth: .infinity)
                        Divider()
                            .background(Color.gray)
                            .padding(.leading, UIDevice.current.userInterfaceIdiom == .phone ? 12 : 20)
                            .padding(.trailing, UIDevice.current.userInterfaceIdiom == .phone ? 12 : 20)
                    
                    Button(action: {
                        withAnimation {
                            selectedFilter = .favorite
                        }
                    }) {
                        Text("Favourite")
                            .font(Font.custom("Montserrat", size: UIDevice.current.userInterfaceIdiom == .phone ? 16 : 20).weight(.semibold))
                            .lineSpacing(16)
                            .foregroundColor(selectedFilter == .favorite ? Color(red: 0.91, green: 0.56, blue: 0.02) : Color(red: 0.04, green: 0.05, blue: 0.03))
                            .frame(maxWidth: 204, alignment: .leading)
                        CategoryIndicatorView(isSelected: selectedFilter == .favorite)
                    }
                    .padding(UIDevice.current.userInterfaceIdiom == .phone ? 12 : 20)
                    .frame(maxWidth: .infinity)
                        Divider()
                            .background(Color.gray)
                            .padding(.leading, UIDevice.current.userInterfaceIdiom == .phone ? 12 : 20)
                            .padding(.trailing, UIDevice.current.userInterfaceIdiom == .phone ? 12 : 20)
                }
                .padding(0)
                .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.28), radius: 4, x: 0, y: 4)
            }
        }
    }
}
