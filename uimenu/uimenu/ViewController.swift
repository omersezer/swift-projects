//
//  ViewController.swift
//  uimenu
//
//  Created by Ömer Sezer on 5.05.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

fileprivate extension ViewController {
    func configure() {
        self.title = "UIMenu Sample"
        setMoreButton()
    }
    
    func setMoreButton() {
        let actionShare = UIAction(title: "Share", image: .share) { action in
            print("action share clicked")
        }
        let actionAdd = UIAction(title: "Add", image: .add) { action in
            print("action add clicked")
        }
        let actionEdit = UIAction(title: "Edit", image: .edit) { action in
            print("action edit clicked")
        }
        let actionReport = UIAction(title: "Report", image: .report) { action in
            print("action report clicked")
        }
        let actionDelete = UIAction(title: "Delete", image: .delete) { action in
            print("action delete clicked")
        }
        let menu = UIMenu(title: "", children: [actionShare, actionAdd, actionEdit, actionReport, actionDelete])
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil, image: .more, primaryAction: nil, menu: menu)
    }
}
