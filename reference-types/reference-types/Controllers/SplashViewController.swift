//
//  SplashViewController.swift
//  reference-types
//
//  Created by Ömer Sezer on 29.05.2022.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presentAddTenant()
    }
}

fileprivate extension SplashViewController {
    func presentAddTenant() {
        let navigationController = UINavigationController(rootViewController: AddTenantViewController())
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
}
