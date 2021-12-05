//
//  MovieListViewController.swift
//  realm
//
//  Created by omersezer on 23.11.2021.
//

import UIKit
import RealmSwift

class MovieListViewController: UIViewController {

    @IBOutlet weak var tvMovieList: UITableView!
    
    let realm = try! Realm()
    lazy var movies: Results<Movie> = { self.realm.objects(Movie.self) }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tvMovieList.reloadData()
        
    }
    
    func setUI() {
        // MARK: Navigation Bar
        setNavBar()
        
        // MARK: title
        title = "Movie List"
        
        // MARK: tvMovieList
        tvMovieList.dataSource = self
        tvMovieList.delegate = self
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
    
    func deleteMovie(movie: Movie) {
        try! realm.write({
            realm.delete(movie)
        })
        tvMovieList.reloadData()
    }
}

extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = movies[indexPath.row].movieName
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteMovie(movie: movies[indexPath.row])
        }
    }
}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let addMovieDetailVC = AddMovieViewController()
        addMovieDetailVC.movie = movies[indexPath.row]
        navigationController?.pushViewController(addMovieDetailVC, animated: true)
    }
    
}
