//
//  VendorListViewModel.swift
//  URLaunchTestTask
//
//  Created by Lena Soroka on 23.04.2023.
//

import Foundation
import Combine

class VendorListViewModel: ObservableObject {
    enum Constants {
        static let searchDebouncingPeriod: Double = 0.5
        static let searchMinimumSymbols: Int = 3
        static let maximumPages: Int = 3
    }
    
    @Published var vendors: [Vendor] = []
    @Published var searchText: String = ""
    @Published var isSearching: Bool = false
    @Published var isLoading: Bool = false
    @Published var canLoadMore: Bool = true
    private var page: Int = 1
    
    private let dataService: DataService
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        dataService = DataService()
        fetchData()
        observeActions()
    }
    
    func observeActions() {
        dataService.$vendors
            .sink { [weak self] vendors in
                self?.vendors = vendors
                self?.isLoading = false
            }
            .store(in: &subscriptions)
        
        $searchText
            .debounce(for: .seconds(Constants.searchDebouncingPeriod),
                      scheduler: DispatchQueue.main)
            .map(filterVendors)
            .sink { [weak self] vendors in
                self?.vendors = vendors
            }
            .store(in: &subscriptions)
    }
    
    func loadMore() {
        if page <= Constants.maximumPages {
            guard searchText.isEmpty else { return }
            print("Loading page number = \(page)")
            DispatchQueue.main.async {
                self.isLoading = true
            }
            // to show that pagination actually works
            DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 2) {
                self.fetchData()
                self.page += 1
            }
        } else {
            DispatchQueue.main.async {
                self.canLoadMore = false
            }
        }
    }
    
    private func fetchData() {
        dataService.fetchData(for: page)
    }
    
    private func filterVendors(by text: String) -> [Vendor] {
        guard !text.isEmpty, text.count > Constants.searchMinimumSymbols else {
            return dataService.vendors
        }
        let lowercasedText = text.lowercased()
        return dataService.vendors.filter { $0.companyName.lowercased().contains(lowercasedText) }
    }

}
