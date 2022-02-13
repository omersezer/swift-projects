//
//  SearchTypes.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//

import Foundation

public enum SearchTypes {
    case movie
    case music
    case app
    case book
    
    init(index: Int) {
        switch index {
        case 0:
            self = .movie
        case 1:
            self = .music
        case 2:
            self = .app
        case 3:
            self = .book
        default:
            self = .movie
        }
    }
    
    var type: String {
        switch self {
        case .movie:
            return "movie"
        case .music:
            return "music"
        case .app:
            return "software"
        case .book:
            return "audiobook"
        }
    }
}
