//
//  BaseInteractor.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//

import UIKit

class BaseInteractor: NSObject {
    let services = Services()
    let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
}
