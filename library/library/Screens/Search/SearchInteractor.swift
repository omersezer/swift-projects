//
//  SearchInteractor.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//  
//

import UIKit

protocol SearchInteractorOutputs: AnyObject {
    func onMoviesSearched(movies: MoviesModel?)
    func onNextPageFetched(movies: MoviesModel?)
    func onError(error: String)
}

final class SearchInteractor: BaseInteractor, Interactorable {
    weak var presenter: SearchInteractorOutputs?
    weak var entities: SearchEntities?
    
    func searchMovie(searchedText: String, type: SearchTypes) {
        Services.shared.search(searchedText: searchedText, type: type) { data in
            self.presenter?.onMoviesSearched(movies: data)
        } errorCompletion: { error in
            self.presenter?.onError(error: error)
        }
    }
    
    func searchMovie(searchedText: String, pageNumber: Int, type: SearchTypes) {
        Services.shared.search(searchedText: searchedText, page: pageNumber, type: type) { data in
            self.presenter?.onNextPageFetched(movies: data)
        } errorCompletion: { error in
            self.presenter?.onError(error: error)
        }
    }
}
