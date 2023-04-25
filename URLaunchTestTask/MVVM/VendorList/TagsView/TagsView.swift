//
//  TagsView.swift
//  URLaunchTestTask
//
//  Created by Lena Soroka on 24.04.2023.
//

import SwiftUI

struct TagsView: View {
    var tags: String = ""
    
    var body: some View {
        Text(tags)
            .frame(maxWidth: .infinity,
                   alignment: .leading)
            .font(Font.OpenSans.regular(14))
            .foregroundColor(Color.style.greySecondary)
            .multilineTextAlignment(.leading)
            .fixedSize(horizontal: false, vertical: true)
    }
}
