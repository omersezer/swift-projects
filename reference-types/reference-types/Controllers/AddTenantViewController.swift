//
//  AddTenantViewController.swift
//  reference-types
//
//  Created by Ömer Sezer on 29.05.2022.
//

import UIKit

class AddTenantViewController: UIViewController {

    @IBOutlet private weak var tfTenantName: UITextField!
    @IBOutlet private weak var tfApartmentName: UITextField!
    @IBOutlet private weak var tfNumber: UITextField!
    @IBOutlet private weak var buttonSave: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    @IBAction private func onButtonSaveClicked(_ sender: Any) {
        addApartment()
    }
    
    @IBAction private func onButtonListClicked(_ sender: Any) {
        presentList()
    }
}

fileprivate extension AddTenantViewController {
    func configure() {
        title = "Add Tenant"
    }
    
    func addApartment() {
        let tenant = Tenant(tenantName: tfTenantName.text ?? "")
        let apartment = Apartment(apartmentName: tfApartmentName.text ?? "", number: Int(tfNumber.text ?? "0") ?? 0)
        tenant.apartment = apartment
        apartment.tenant = tenant
        AppDelegate.apartments.append(apartment)
        AppDelegate.tenants.append(tenant)
    }
    
    func presentList() {
        navigationController?.pushViewController(ListViewController(), animated: true)
    }
}
