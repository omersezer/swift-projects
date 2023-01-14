//
//  ViewController.swift
//  custom-stack-table-view
//
//  Created by Ömer Sezer on 14.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var tableView: CustomStackTableView! {
        didSet {
            tableView.delegate = self
            tableView.configure()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: CustomStackTableViewDelegate {
    func itemPressedAtIndex(index: Int) {
        print("Item pressed at index \(index)")
    }
    
    func itemForRowAtIndex(index: Int) -> UIView {
        let label = UILabel()
        label.text = "\(index). User"
        return label
    }
    
    func numberOfItems() -> Int {
        return 1000
    }
}
