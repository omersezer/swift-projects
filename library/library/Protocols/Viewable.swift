//
//  Viewable.swift
//  library
//
//  Created by Ömer Sezer on 13.02.2022.
//

import UIKit

protocol Viewable: AnyObject {
    func push(_ vc: UIViewController, animated: Bool)
    func present(_ vc: UIViewController, animated: Bool)
    func present(_ vc: UIViewController, animated: Bool, _completion:  @escaping (() -> Void))
    func presentOverFullScreen(_ vc: UIViewController, animation: UIModalTransitionStyle)
    func pop(animated: Bool)
    func dismiss(animated: Bool)
    func dismiss(animated: Bool, _completion:  @escaping (() -> Void))
}

extension Viewable where Self: UIViewController {

    func push(_ vc: UIViewController, animated: Bool) {
        self.navigationController?.pushViewController(vc, animated: animated)
    }

    func present(_ vc: UIViewController, animated: Bool) {
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: animated, completion: nil)
    }
    
    func present(_ vc: UIViewController, animated: Bool, _completion: @escaping (() -> Void)) {
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: animated, completion: _completion)
    }
    
    func presentOverFullScreen(_ vc: UIViewController, animation: UIModalTransitionStyle) {
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = animation
        self.present(vc, animated: true, completion: nil)
    }

    func pop(animated: Bool) {
        self.navigationController?.popViewController(animated: animated)
    }

    func dismiss(animated: Bool) {
        self.dismiss(animated: animated, completion: nil)
    }

    func dismiss(animated: Bool, _completion: @escaping (() -> Void)) {
        self.dismiss(animated: animated, completion: _completion)
    }

    var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }

}
