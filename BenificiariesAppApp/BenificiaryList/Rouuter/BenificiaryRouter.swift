//
//  BenificiaryRouter.swift
//  BenificiariesAppApp
//
//  Created by Ahmad Qasim on 9/10/23.
//

import Foundation

import Foundation
import UIKit

enum BenificiaryRoute: String {
    case benificiaryDetail
    
}

final class BenificiaryRouter {
    weak var viewController: UIViewController?
}
extension BenificiaryRouter: RouterProtocol {
    
    func route(to routeID: String, parameters: Any?) {
        guard let benificiaryroute = BenificiaryRoute(rawValue: routeID) else { return }
        switch benificiaryroute {
        case .benificiaryDetail:
            benificiaryDetail(parameters: parameters )
        }
    }
}
extension BenificiaryRouter {
    private func benificiaryDetail(parameters: Any?) {
        
        
        let storyBoard =  UIStoryboard(name: "Main", bundle: nil)
        guard let benificiaryDetaillVC = storyBoard.instantiateViewController(withIdentifier: "BenificiaryDetailVC") as? BenificiaryDetailVC else { return  }
        guard let benificiaryDetail = parameters as? Benificiary else { return }
        
        benificiaryDetaillVC.benificiaryDetail = benificiaryDetail
        viewController?.navigationController?.pushViewController(benificiaryDetaillVC, animated: true)
    }

}
