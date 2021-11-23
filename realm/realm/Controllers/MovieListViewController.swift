//
//  MovieListViewController.swift
//  realm
//
//  Created by omersezer on 23.11.2021.
//

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak var tvMovieList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        // MARK: Navigation Bar
        setNavBar()
        
        // MARK: title
        title = "Movie List"
    }
    
    func setNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(onBtnAddTapped))
        navigationItem.rightBarButtonItem?.tintColor = .blue
    }
    
    @objc func onBtnAddTapped() {
        presentAddMovie()
    }
    
    func presentAddMovie() {
        self.navigationController?.pushViewController(AddMovieViewController(), animated: true)
    }
    
    
}
