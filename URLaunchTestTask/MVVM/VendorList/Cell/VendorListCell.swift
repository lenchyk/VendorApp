//
//  VendorListCell.swift
//  URLaunchTestTask
//
//  Created by Lena Soroka on 23.04.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct VendorListCell: View {
    
    var vendor: Vendor
    
    @State private var isPressed = false
    private let favorited = true
    
    
    var body: some View {
        VStack(spacing: 10) {
            ZStack {
                WebImage(url: URL(string: vendor.coverPhoto.mediaURL))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 170, alignment: .center)
                    .cornerRadius(10)
                    .overlay(Group {
                        ZStack {
                            Button(action: { isPressed.toggle() },
                                   label: {
                                isPressed ? Image("save_active") : Image("save_inactive")
                            })
                            .padding(.trailing, -5)
                            .padding(.top, 5)
                        }
                        .frame(
                            maxWidth: .infinity,
                            maxHeight: .infinity,
                            alignment: .topTrailing
                        )
                        
                        ZStack {
                            Text(vendor.areaServed)
                                .foregroundColor(Color.style.greyPrimary)
                                .font(Font.OpenSans.regular(14))
                                .padding(.vertical, 2)
                                .padding(.horizontal, 8)
                                .background {
                                    RoundedRectangle(
                                        cornerRadius: 16,
                                        style: .continuous
                                    )
                                    .fill(.white.opacity(0.9))
                                }
                                .padding([.bottom, .leading], 8)
                        }
                        .frame(
                            maxWidth: .infinity,
                            maxHeight: .infinity,
                            alignment: .bottomLeading
                        )
                        .background {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(
                                LinearGradient(
                                      gradient: .init(colors: [
                                        Color(0x323232, alpha: 0),
                                        .black
                                      ]),
                                      startPoint: .init(x: 0.5, y: 0.5),
                                      endPoint: .bottom
                                    )
                                .opacity(0.8)
                            )
                        }
                    })
            }
            VStack(alignment: .leading, spacing: 8) {
                Text(vendor.companyName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.OpenSans.bold(16))
                    .foregroundColor(Color.style.greyPrimary)
                CategoriesListView(categories: vendor.categories)
                TagsView(tags: vendor.getAllTags())
            }
        }
    }
}
