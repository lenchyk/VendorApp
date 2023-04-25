//
//  NetworkManager.swift
//  URLaunchTestTask
//
//  Created by Lena Soroka on 25.04.2023.
//

import Foundation
import Combine

class NetworkManager {
    static func download(from url: URL) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .userInitiated))
            .tryMap { $0.data }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print("Error! \(error.localizedDescription )")
        }
    }
}
