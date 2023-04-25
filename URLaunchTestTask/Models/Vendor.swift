//
//  Vendor.swift
//  URLaunchTestTask
//
//  Created by Lena Soroka on 19.04.2023.
//

import Foundation

struct Vendor: Decodable {
    let id: Int64
    let companyName: String
    let areaServed: String
    let shopType: String
    let favorited: Bool
    let follow: Bool
    let businessType: String
    let coverPhoto: Photo
    let categories: [VendorCategory]
    let tags: [VendorTag]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case companyName = "company_name"
        case areaServed = "area_served"
        case shopType = "shop_type"
        case favorited = "favorited"
        case follow = "follow"
        case businessType = "business_type"
        case coverPhoto = "cover_photo"
        case categories = "categories"
        case tags = "tags"
    }

    func getAllTags() -> String {
        var allTags: String = ""
        for tag in tags {
            let spacedTag = tag == tags.first ? "• \(tag.name)" : " • \(tag.name)"
            allTags += spacedTag
        }
        return allTags
    }
}

extension Vendor: Equatable {
    static func == (lhs: Vendor, rhs: Vendor) -> Bool {
        return lhs.id == rhs.id
    }
}
