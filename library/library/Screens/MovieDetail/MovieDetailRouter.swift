//
//  MovieDetailRouter.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//  
//

import UIKit

class MovieDetailRouterInput: NSObject {
    func view(entryEntity: MovieDetailEntryEntity) -> UIViewController {
        let view = MovieDetailViewController()
        let interactor = MovieDetailInteractor()
        let entities = MovieDetailEntities(entryEntity: entryEntity)
        let dependencies = MovieDetailPresenterDependencies(interactor: interactor, router: MovieDetailRouterOutput(view))
        let presenter = MovieDetailPresenter(entities: entities, dependencies: dependencies, view: view)
        view.presenter = presenter
        interactor.entities = entities
        interactor.presenter = presenter
        
        return view
    }
    
    func present(from: Viewable, entryEntity: MovieDetailEntryEntity) {
        from.push(view(entryEntity: entryEntity), animated: true)
    }
}

class MovieDetailRouterOutput: Routerable {
    private(set) weak var view: Viewable!

    init(_ view: Viewable) {
        self.view = view
    }
}
