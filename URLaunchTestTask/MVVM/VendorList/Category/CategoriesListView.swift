//
//  CategoriesListView.swift
//  URLaunchTestTask
//
//  Created by Lena Soroka on 24.04.2023.
//

import SwiftUI
import WrappingHStackLayout

struct CategoriesListView: View {
    var categories: [VendorCategory] = []
        
    var body: some View {
        WrappingHStack(alignment: .leading, horizontalSpacing: 14, verticalSpacing: 8) {
            ForEach(categories, id: \.self) { category in
                CategoryView(category: category)
            }
        }
    }
}
