//
//  SearchRouter.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//  
//

import UIKit

import UIKit

class SearchRouterInput: NSObject {
    func view(entryEntity: SearchEntryEntity) -> UIViewController {
        let view = SearchViewController()
        let interactor = SearchInteractor()
        let entities = SearchEntities(entryEntity: entryEntity)
        let dependencies = SearchPresenterDependencies(interactor: interactor, router: SearchRouterOutput(view))
        let presenter = SearchPresenter(entities: entities, dependencies: dependencies, view: view)
        view.presenter = presenter
        interactor.entities = entities
        interactor.presenter = presenter
        
        return view
    }
    
    func present(from: Viewable, entryEntity: SearchEntryEntity) {
        from.present(view(entryEntity: entryEntity), animated: true)
    }
}

class SearchRouterOutput: Routerable {
    private(set) weak var view: Viewable!

    init(_ view: Viewable) {
        self.view = view
    }
    
    func presentMovieDetail(movie: MovieDetailModel?) {
        MovieDetailRouterInput().present(from: view, entryEntity: MovieDetailEntryEntity(movieDetail: movie))
    }
}
