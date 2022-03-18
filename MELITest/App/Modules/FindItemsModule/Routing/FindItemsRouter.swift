//
//  FindItemsRouter.swift
//  MELITest
//
//  Created by Julian Barco on 16/03/22.
//

import Foundation
import UIKit

protocol FindItemsRouter {
    func goToShow()
    func goToShowItemBy(id: String)
}

class FindItemsRouterImpl: FindItemsRouter {
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
        let detailModule = ModuleDetailItem.setupModule(navController: navController, itemId: id)
        detailModule.showModule()
    }
    
}
