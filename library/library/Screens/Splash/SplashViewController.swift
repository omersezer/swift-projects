//
//  SplashViewController.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//  
//

import UIKit

protocol SplashViewInputs: AnyObject {
    func prepareUI()
}

protocol SplashViewOutputs: AnyObject {
    func viewDidLoad()
}

class SplashViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    internal var presenter: SplashViewOutputs?

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }
}

extension SplashViewController: SplashViewInputs {
    func prepareUI() {
        // MARK: activityIndicator
        if #available(iOS 13.0, *) {
            activityIndicator.style = .large
        } else {
            activityIndicator.style = .gray
        }
        activityIndicator.startAnimating()
    }
}

extension SplashViewController: Viewable { }
