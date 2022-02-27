//
//  AuthenticationUtil.swift
//  singleton
//
//  Created by Ömer Sezer on 27.02.2022.
//

import Foundation

class AuthenticationUtil {
    
    static let shared = AuthenticationUtil()
    
    var isLoggedIn = false
    
    func loginWithUsername(username: String, password: String) {
        print("login successful")
    }
    
    func loginWithFaceId() {
        print("login successful")
    }
    
    func logout() {
        print("logout")
    }
}
