//
//  RouteProotocol.swift
//  BenificiariesAppApp
//
//  Created by Ahmad Qasim on 9/10/23.
//

import UIKit

protocol RouterProtocol {
    var viewController: UIViewController? {get set}
    func dismiss(animated: Bool)
    func pop(animated: Bool)
    func pop(to toViewController: UIViewController, animated: Bool)
    func popToRoot(animated: Bool)
    func route(to routeID: String, parameters: Any?)
}

extension RouterProtocol {
    func dismiss(animated: Bool) {
        viewController?.dismiss(animated: animated)
    }
    func pop(animated: Bool) {
        viewController?.navigationController?.popViewController(animated: animated)
    }
    func pop(to toViewController: UIViewController, animated: Bool) {
        viewController?.navigationController?.popToViewController(toViewController, animated: animated)
    }
    func popToRoot(animated: Bool) {
        viewController?.navigationController?.popToRootViewController(animated: animated)
    }
}
