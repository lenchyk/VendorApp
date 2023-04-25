//
//  VendorListView.swift
//  URLaunchTestTask
//
//  Created by Lena Soroka on 19.04.2023.
//

import SwiftUI

struct VendorListView: View {
    @StateObject private var viewModel = VendorListViewModel()
    @State var firstAppear: Bool = true

    var body: some View {
        VStack {
            SearchBarView(
                searchText: $viewModel.searchText,
                isSearching: $viewModel.isSearching
            )
                .frame(height: 40, alignment: .top)
                .background { Color.style.background }
            Spacer(minLength:  24)
            List {
                ForEach(viewModel.vendors, id: \.id) { vendor in
                    VendorListCell(vendor: vendor)
                        .listRowSeparator(.hidden)
                }
                if viewModel.searchText.isEmpty && !viewModel.isSearching {
                    Color.clear
                        .frame(height: 1)
                        .onAppear {
                            if firstAppear {
                                // load more only if apppears twice
                                firstAppear = false
                                return
                            }
                            viewModel.loadMore()
                        }
                        .listRowSeparator(.hidden)
                        .overlay {
                            if viewModel.isLoading {
                                ProgressView(Constants.loading)
                                    .progressViewStyle(.circular)
                                    .tint(Color.style.darkGreen)
                                    .listRowSeparator(.hidden)
                            }
                        }
                }
            }
            .listStyle(.plain)
        }
        .overlay(Group {
            if viewModel.vendors.isEmpty {
                EmptyListStateView()
            }
        })
    }
}

struct VendorListView_Previews: PreviewProvider {
    static var previews: some View {
        VendorListView()
    }
}
