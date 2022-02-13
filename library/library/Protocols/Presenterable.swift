//
//  Presenterable.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//

import Foundation

protocol Presenterable {
    associatedtype I: Interactorable
    associatedtype R: Routerable
    var dependencies: (interactor: I, router: R) { get }
}
