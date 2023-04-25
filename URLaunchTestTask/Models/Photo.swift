//
//  Photo.swift
//  URLaunchTestTask
//
//  Created by Lena Soroka on 19.04.2023.
//

import Foundation

struct Photo: Decodable {
    let id: Int64
    let mediaURL: String
    let mediaType: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case mediaURL = "media_url"
        case mediaType = "media_type"
    }
}
