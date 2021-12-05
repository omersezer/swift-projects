//
//  Movie.swift
//  realm
//
//  Created by omersezer on 27.11.2021.
//

import RealmSwift

class Movie: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var movieName: String = ""
    @objc dynamic var createdData: Date = Date()
    
    static func create(movieName: String) -> Movie {
        let movie = Movie()
        movie.movieName = movieName
        return movie
    }
}
