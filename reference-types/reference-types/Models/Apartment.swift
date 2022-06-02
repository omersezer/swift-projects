//
//  Apartment.swift
//  reference-types
//
//  Created by Ömer Sezer on 30.05.2022.
//

import Foundation

class Apartment {
    let apartmentName: String
    let number: Int
//    weak var tenant: Tenant?
    var tenant: Tenant?
    
    init(apartmentName: String, number: Int) {
        self.apartmentName = apartmentName
        self.number = number
        print("Apartment \(apartmentName) initialized")
    }
    
    deinit {
        print("Apartment \(apartmentName) deinitialized")
    }
}
