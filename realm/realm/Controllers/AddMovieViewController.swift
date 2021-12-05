//
//  AddMovieViewController.swift
//  realm
//
//  Created by omersezer on 23.11.2021.
//

import UIKit
import RealmSwift

class AddMovieViewController: UIViewController {

    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var tfMovieName: UITextField!
    
    var movie: Movie?
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        // MARK: Title
        title = "Add Movie"
        
        // MARK: btnAdd
        btnAdd.layer.cornerRadius = 20
        btnAdd.addTarget(self, action: #selector(onBtnAddClicked(_:)), for: .touchUpInside)
        btnAdd.setTitle(movie != nil ? "Update" : "Add", for: .normal)
        
        // MARK: tfMovieName
        tfMovieName.text = movie?.movieName
    }
    
    @objc func onBtnAddClicked(_ sender: UIButton) {
        if (tfMovieName.text?.count ?? 0) > 0 {
            try! realm.write {
                if movie != nil {
                    movie?.movieName = tfMovieName.text ?? ""
                    navigationController?.popViewController(animated: true)
                } else {
                    let newMovie = Movie.create(movieName: tfMovieName.text ?? "")
                    realm.add(newMovie)
                    navigationController?.popViewController(animated: true)
                }
            }
        } else {
            // TODO: handle error
        }
    }
}
