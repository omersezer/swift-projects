//
//  LoginViewController.swift
//  singleton
//
//  Created by Ömer Sezer on 27.02.2022.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onButtonLoginWithUsernameClicked(_ sender: Any) {
        AuthenticationUtil.shared.loginWithUsername(username: "test username", password: "test password")
    }
    
    @IBAction func onButtonLoginWithFaceIdClicked(_ sender: Any) {
        AuthenticationUtil.shared.loginWithFaceId()
    }
    
    @IBAction func onButtonLogoutClicked(_ sender: Any) {
        AuthenticationUtil.shared.logout()
    }
}
