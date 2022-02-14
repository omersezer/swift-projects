//
//  APIConstants.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//

import Foundation

struct K {
    static let prodUrl = "https://itunes.apple.com/"
    static let limit = 25
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
