//
//  MovieDetailPresenter.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//  
//

import Foundation

typealias MovieDetailPresenterDependencies = (
    interactor: MovieDetailInteractor,
    router: MovieDetailRouterOutput
)

final class MovieDetailPresenter: Presenterable {
    internal var entities: MovieDetailEntities
    private weak var view: MovieDetailViewInputs?
    let dependencies: MovieDetailPresenterDependencies
    
    init(entities: MovieDetailEntities,
         dependencies: MovieDetailPresenterDependencies, view: MovieDetailViewInputs) {
        self.entities = entities
        self.dependencies = dependencies
        self.view = view
    }
}

extension MovieDetailPresenter: MovieDetailViewOutputs {
    func viewDidLoad() {
        setUI()
    }
    
    func setUI() {
        view?.prepareUI()
        view?.onMovieDetailReady(movie: entities.entryEntity.movieDetail)
    }
}

extension MovieDetailPresenter: MovieDetailInteractorOutputs {
}
