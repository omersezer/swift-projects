//
//  MovieDetailModel.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//

import Foundation

struct MovieDetailModel: Decodable {
    let trackName, wrapperType, primaryGenreName: String?
    let longDescription, artworkUrl100, artistName: String?
    
    enum MovieDetailModel: String, CodingKey {
        case trackName = "trackName"
        case wrapperType = "wrapperType"
        case primaryGenreName = "primaryGenreName"
        case longDescription = "longDescription"
        case artworkUrl100 = "artworkUrl100"
        case artistName = "artistName"
    }
}
