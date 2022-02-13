//
//  BaseErrorModel.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//

import Foundation

public class BaseErrorModel: Codable {
    public var errorCode: Int?
    public let message: String?
    public let errors: [ErrorData]?
    
    public init(errorCode: Int?, message: String?, errors: [ErrorData]?) {
        self.message = message
        self.errors = errors
        self.errorCode = errorCode
    }
}

public class ErrorData: Codable {
    public let field, message: String?
    
    public init(field: String?, message: String?) {
        self.field = field
        self.message = message
    }
}
