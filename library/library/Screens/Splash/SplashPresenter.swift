//
//  SplashPresenter.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//  
//

import Foundation

typealias SplashPresenterDependencies = (
    interactor: SplashInteractor,
    router: SplashRouterOutput
)

final class SplashPresenter: Presenterable {
    internal var entities: SplashEntities
    private weak var view: SplashViewInputs?
    let dependencies: SplashPresenterDependencies
    
    init(entities: SplashEntities,
         dependencies: SplashPresenterDependencies, view: SplashViewInputs) {
        self.entities = entities
        self.dependencies = dependencies
        self.view = view
    }
}

extension SplashPresenter: SplashViewOutputs {
    func viewDidLoad() {
        setUI()
    }
    
    func setUI() {
        view?.prepareUI()
        DispatchQueue.main.async {
            self.dependencies.router.presentSearch()
        }
    }
}

extension SplashPresenter: SplashInteractorOutputs {
}
