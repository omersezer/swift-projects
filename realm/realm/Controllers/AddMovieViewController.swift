//
//  AddMovieViewController.swift
//  realm
//
//  Created by omersezer on 23.11.2021.
//

import UIKit

class AddMovieViewController: UIViewController {

    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var tfMovieName: UITextField!
    
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
    }
    
    @objc func onBtnAddClicked(_ sender: UIButton) {
        
    }
}
