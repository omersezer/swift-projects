//
//  ListViewController.swift
//  reference-types
//
//  Created by Ömer Sezer on 30.05.2022.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppDelegate.apartments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let apartment = AppDelegate.apartments[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(apartment?.apartmentName ?? "") \(apartment?.tenant?.tenantName ?? "") \(apartment?.number ?? 0)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            remove(indexPath.row)
            tableView.reloadData()
        }
    }
}

fileprivate extension ListViewController {
    func remove(_ index: Int) {
        AppDelegate.apartments.remove(at: index)
        AppDelegate.tenants.remove(at: index)
    }
}
