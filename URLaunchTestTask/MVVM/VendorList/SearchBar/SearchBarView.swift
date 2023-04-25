//
//  SearchBarView.swift
//  URLaunchTestTask
//
//  Created by Lena Soroka on 23.04.2023.
//

import SwiftUI

struct SearchBarView: View {
    enum Constants {
        static let search = "Search..."
    }
    @Binding var searchText: String
    @Binding var isSearching: Bool 
    
    var body: some View {
        HStack(spacing: 8) {
            TextField(Constants.search,
                      text: $searchText,
                      onEditingChanged: { isSearching = $0 })
                .font(Font.OpenSans.regular(16))
                .foregroundColor(Color.style.greySecondary)
                .padding(.leading, 14)
                .padding(.vertical, 9)
            Image("search_icon")
                .padding(.top, 8)
                .padding(.trailing, 8)
                .padding(.bottom, 8)
                .frame(width: 24, height: 24)
        }
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(.white.shadow(
                            .drop(color: .black.opacity(0.05),
                                  radius: 14,
                                  x: 0,
                                  y: 6))
                )
        }
        .padding(.horizontal, 16)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""), isSearching: .constant(false))
    }
}
