//
//  SplashRouter.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//  
//

import UIKit
import RxCocoa
import RxSwift

class SplashRouterInput: NSObject {
    func view(entryEntity: SplashEntryEntity) -> UIViewController {
        let view = SplashViewController()
        let interactor = SplashInteractor()
        let entities = SplashEntities(entryEntity: entryEntity)
        let dependencies = SplashPresenterDependencies(interactor: interactor, router: SplashRouterOutput(view))
        let presenter = SplashPresenter(entities: entities, dependencies: dependencies, view: view)
        view.presenter = presenter
        interactor.entities = entities
        interactor.presenter = presenter
        
        return view
    }
    
    func present(from: Viewable, entryEntity: SplashEntryEntity) {
        from.present(view(entryEntity: entryEntity), animated: true)
    }
}

class SplashRouterOutput: Routerable {
    private(set) weak var view: Viewable!
    var navControllerObserver: Disposable?

    init(_ view: Viewable) {
        self.view = view
    }
    
    func presentSearch() {
        let navController = UINavigationController(rootViewController: SearchRouterInput().view(entryEntity: SearchEntryEntity()))
        navController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navController.navigationBar.tintColor = UIColor.primaryColor
        navController.navigationBar.topItem?.title = ""
        navController.navigationBar.isTranslucent = true
        navController.navigationBar.shadowImage = UIImage()
        navControllerObserver = navController.rx.willShow.asObservable().subscribe { (event) in
            let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
            navController.viewControllers[navController.viewControllers.count - 1].navigationItem.backBarButtonItem = item
        }
        view.present(navController, animated: true)
    }
}
