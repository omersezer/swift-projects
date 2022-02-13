//
//  SearchEntities.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//  
//

import Foundation

struct SearchEntryEntity {
    
}

class SearchEntities {
    var entryEntity: SearchEntryEntity
    var source: SearchCollectionViewSource?
    var movies: MoviesModel?
    var searchedText: String?
    var selectedType: SearchTypes = .movie
    
    init(entryEntity: SearchEntryEntity) {
        self.entryEntity = entryEntity
    }
}
