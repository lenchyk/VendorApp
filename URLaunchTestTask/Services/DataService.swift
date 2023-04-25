//
//  DataService.swift
//  URLaunchTestTask
//
//  Created by Lena Soroka on 19.04.2023.
//

import Foundation
import Combine

class DataService {
    private enum FetchError: Error {
        case invalidURL
        case invalidData
        
        var errorDescription: String {
            switch self {
            case .invalidData: return "Invalid Data"
            case .invalidURL: return "Invalid URL"
            }
        }
    }
    
    static var urlPath: (Int) -> String = { page in
        return "vendors\(page)"
    }
    private var subscriptions: AnyCancellable?
    
    @Published var vendors: [Vendor] = []
    
    func fetchData(for page: Int) {
        guard let url = Bundle.main.url(
            forResource: DataService.urlPath(page),
            withExtension: Constants.json) else {
            print(FetchError.invalidURL.errorDescription)
            return
        }
        
        subscriptions = NetworkManager.download(from: url )
            .decode(type: Vendors.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion,
                  receiveValue: { [weak self] vendors in
                self?.vendors.append(contentsOf: vendors.vendors)
                self?.subscriptions?.cancel()
            })
    }
}
