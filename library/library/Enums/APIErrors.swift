//
//  APIErrors.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//

import Foundation

public enum APIErrors: String {
    case Alamofire
    case Fatal
    case Service
    
    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
