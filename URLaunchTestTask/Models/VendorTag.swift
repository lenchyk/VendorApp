//
//  VendorTag.swift
//  URLaunchTestTask
//
//  Created by Lena Soroka on 19.04.2023.
//

import Foundation

struct VendorTag: Decodable {
    let id: Int64
    let name: String
    let purpose: String
}

extension VendorTag: Equatable {
    static func == (lhs: VendorTag, rhs: VendorTag) -> Bool {
        return lhs.id == rhs.id
    }
}
