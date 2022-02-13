//
//  MovieDetailInteractor.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//  
//

import Foundation

protocol MovieDetailInteractorOutputs: AnyObject {
    
}

final class MovieDetailInteractor: BaseInteractor, Interactorable {
    weak var presenter: MovieDetailInteractorOutputs?
    weak var entities: MovieDetailEntities?
}
