//
//  FindItemsRouter.swift
//  MELITest
//
//  Created by Julian Barco on 16/03/22.
//

import Foundation
import UIKit

protocol FindItemsRoutingLogic {
    func goToShow()
    func goToShowItemBy(id: String)
}

class FindItemsRouter: FindItemsRoutingLogic {
    weak var viewController: UIViewController?
    private let navController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navController = navigationController
    }
    
    func goToShow() {
        if let viewController = viewController {
            navController.pushViewController(viewController, animated: false)
        }
    }
    
    func goToShowItemBy(id: String) {
        //GoTO Detail
    }
    
}
