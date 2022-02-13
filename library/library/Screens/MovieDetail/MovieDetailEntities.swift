//
//  MovieDetailEntities.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//  
//

import Foundation

struct MovieDetailEntryEntity {
    let movieDetail: MovieDetailModel?
}

class MovieDetailEntities {
    var entryEntity: MovieDetailEntryEntity
    
    init(entryEntity: MovieDetailEntryEntity) {
        self.entryEntity = entryEntity
    }
}

