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
    func onError(error: BaseErrorModel)
}

final class SearchInteractor: BaseInteractor, Interactorable {
    weak var presenter: SearchInteractorOutputs?
    weak var entities: SearchEntities?
    
    func searchMovie(searchedText: String, type: SearchTypes) {
        services.searchMovie(searchedText: searchedText, type: type) { movies in
            self.presenter?.onMoviesSearched(movies: movies)
        } errorCompletion: { error in
            self.presenter?.onError(error: error)
        }
    }
    
    func searchMovie(searchedText: String, pageNumber: Int, type: SearchTypes) {
        services.searchMovie(searchedText: searchedText, page: pageNumber, type: type) { movies in
            self.presenter?.onNextPageFetched(movies: movies)
        } errorCompletion: { error in
            self.presenter?.onError(error: error)
        }
    }
}
