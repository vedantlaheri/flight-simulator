//
//  SearchView.swift
//  Farming Simulator 2022
//
//  Created by Systems
//

import Foundation
import SwiftUI

struct SearchView: View {
    @Binding var isSearching: Bool
    @Binding var searchText: String
    @Binding var selectFilter: FilterType_SimulatorFarm

    var body: some View {
        HStack {
            ZStack {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color.black)
            }

            if isSearching {
                TextField("", text: $searchText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .accentColor(Color(red: 0.80, green: 0.80, blue: 0.80))
                    .foregroundColor(Color.black)
                    .onTapGesture {
                        if searchText == "Search" {
                            withAnimation {
                                searchText = ""
                            }
                        }
                    }
                    .disableAutocorrection(true)
                    .overlay(
                        Group {
                            if searchText.isEmpty {
                                Text("Search")
                                    .font(Font.custom("Montserrat", size: 16).weight(.semibold))
                                    .lineSpacing(16)
                                    .foregroundColor(Color(red: 0.80, green: 0.80, blue: 0.80))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .multilineTextAlignment(.leading)
                                    
                            }
                        }
                    )
            }

            Spacer()

            if !searchText.isEmpty {
                Button(action: {
                    searchText = ""
                }) {
                }
            }

            Button(action: {
                isSearching = false
                searchText = ""
                hideKeyboard_search()
            }) {
                Image(systemName: "xmark")
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color.black)
            }
        }
        .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 0.98, green: 0.98, blue: 0.98))
        .cornerRadius(20)
        .onTapGesture {
            if isSearching {
                isSearching = false
                searchText = ""
                hideKeyboard_search()
            }
        }
    }
    
}

typealias View_SimulatorFarm = View
extension View_SimulatorFarm {
     func hideKeyboard_search() {
         UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
     }
}

