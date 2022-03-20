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
    private let navController: UINavigationController
    weak var viewController: UIViewController?
    
    init(navigationController: UINavigationController) {
        self.navController = navigationController
    }
    
    func goToShow() {
        guard let viewController = viewController else {
            return
        }
        navController.pushViewController(viewController, animated: true)
        
    }
    
    func goToShowItemBy(id: String) {
        //GoTO Detail
        let detailModule = ModuleDetailItem.setupModule(navController: navController, itemId: id)
        detailModule.showModule()
    }
    
}
