//
//  Tenant.swift
//  reference-types
//
//  Created by Ömer Sezer on 30.05.2022.
//

import Foundation

class Tenant {
    let tenantName: String
    var apartment: Apartment?
    
    init(tenantName: String) {
        self.tenantName = tenantName
        print("Tenant \(tenantName) initialized")
    }
    
    deinit {
        print("Tenant \(tenantName) deinitialized")
    }
}
