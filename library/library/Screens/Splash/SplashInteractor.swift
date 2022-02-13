//
//  SplashInteractor.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//  
//

import Foundation

protocol SplashInteractorOutputs: AnyObject {
    
}

final class SplashInteractor: BaseInteractor, Interactorable {
    weak var presenter: SplashInteractorOutputs?
    weak var entities: SplashEntities?
}
