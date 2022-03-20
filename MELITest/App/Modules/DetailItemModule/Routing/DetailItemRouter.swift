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

class DetailItemRouterImpl: DetailItemRouter {
    
    private let navController: UINavigationController
    weak var viewController: UIViewController?
    
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
        self.navController.popViewController(animated: true)
    }
}
