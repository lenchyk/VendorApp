//
//  CategoryView.swift
//  URLaunchTestTask
//
//  Created by Lena Soroka on 23.04.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct CategoryView: View {
    var category: VendorCategory
    
    var body: some View {
        HStack(spacing: 6) {
            WebImage(url: URL(string: category.image.mediaURL),
                     context: [.imageThumbnailPixelSize : CGSize.zero])
                .resizable()
                .renderingMode(.template)
                .frame(width: 22, height: 22, alignment: .center)
                .foregroundColor(Color.style.greyPrimary)
            Text(category.name)
                .font(Font.OpenSans.regular(14))
                .foregroundColor(Color.style.greyPrimary)
                .lineLimit(1)
        }
    }
}
