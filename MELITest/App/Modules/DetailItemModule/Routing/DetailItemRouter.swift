//
//  DetailItemRouter.swift
//  MELITest
//
//  Created by Julian Barco on 17/03/22.
//

import Foundation
import UIKit

protocol DetailItemRouter {
    func goToshow()
    func goBack()
}

class DetailItemRouterLogic: DetailItemRouter {
    weak var viewController: UIViewController?
    private let navController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navController = navigationController
    }
    
    func goToshow() {
        guard let viewController = viewController else {
            return
        }
        self.navController.pushViewController(viewController, animated: true)
    }
    
    func goBack() {
        navController.popViewController(animated: true)
    }
}
