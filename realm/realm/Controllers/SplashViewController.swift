//
//  SplashViewController.swift
//  realm
//
//  Created by omersezer on 23.11.2021.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.presentMovieList()
        }
    }
    
    func presentMovieList() {
        let navController = UINavigationController(rootViewController: MovieListViewController())
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
    }

}
