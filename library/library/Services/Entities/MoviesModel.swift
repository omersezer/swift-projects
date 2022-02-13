//
//  MoviesModel.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//

import Foundation

struct MoviesModel: Decodable {
    var results: [MovieDetailModel?]?
    let resultCount: Int?
    var sectionedMovies: [SectionedMovies?]? {
        get {
            return getSectionedMovies()
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
        case resultCount = "resultCount"
    }
    
    mutating func appendNextPage(movies: [MovieDetailModel?]?) {
        results?.append(contentsOf: movies ?? [])
    }
    
    private func getSectionedMovies() -> [SectionedMovies?]? {
        var array: [SectionedMovies?]? = []
        for movie in results ?? [] {
            if let index = array?.firstIndex(where: { $0?.wrapperType == (movie?.wrapperType ?? "") }) {
                if index < 0 {
                    array?.append(SectionedMovies(wrapperType: movie?.wrapperType, movies: [movie]))
                } else {
                    array?[index]?.movies?.append(movie)
                }
            } else {
                array?.append(SectionedMovies(wrapperType: movie?.wrapperType, movies: [movie]))
            }
        }
        return array
    }
}

struct SectionedMovies: Decodable {
    var wrapperType: String?
    var movies: [MovieDetailModel?]?
}
