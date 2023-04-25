//
//  VendorCategory.swift
//  URLaunchTestTask
//
//  Created by Lena Soroka on 19.04.2023.
//

import Foundation

struct VendorCategory: Decodable {
    let id: Int64
    let name: String
    let image: Photo
}

extension VendorCategory: Hashable, Equatable {
    static func == (lhs: VendorCategory, rhs: VendorCategory) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
}
