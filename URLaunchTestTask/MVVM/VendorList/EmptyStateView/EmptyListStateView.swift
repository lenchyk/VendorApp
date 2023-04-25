//
//  EmptyListStateView.swift
//  URLaunchTestTask
//
//  Created by Lena Soroka on 23.04.2023.
//

import SwiftUI

struct EmptyListStateView: View {
    enum Constants {
        enum Title {
            static let text = "Sorry! No results found..."
        }
        enum Subtitle {
            static let text = "Please try a different search request or browse businesses from the list"
            static let lineHeight: CGFloat = 22
        }
    }
    
    let font = UIFont.systemFont(ofSize: 16, weight: .regular)
    
    var body: some View {
        VStack(spacing: 8) {
            Text(Constants.Title.text)
                .foregroundColor(Color.style.darkGreen)
                .font(Font.OpenSans.bold(24))
            
            Text(Constants.Subtitle.text)
                .foregroundColor(Color.style.greyPrimary)
                .font(Font.OpenSans.regular(16))
                .lineSpacing(Constants.Subtitle.lineHeight - font.lineHeight)
                .padding(
                    .vertical,
                    (Constants.Subtitle.lineHeight - font.lineHeight)/2
                )
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 30)
    }
}

struct EmptyListStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListStateView()
    }
}
