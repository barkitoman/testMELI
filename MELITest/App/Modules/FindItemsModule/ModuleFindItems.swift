//
//  FindItemsModule.swift
//  MELITest
//
//  Created by Julian Barco on 14/03/22.
//

import Foundation
import UIKit

class ModuleFindItems {
    private let router: FindItemsRouterImpl
    private let viewController: FindItemsViewController
    
    private init(navController: UINavigationController){
        router = FindItemsRouterImpl(navigationController: navController)
        let worker = FindItemsManagerWorker()
        let presenter = FindItemsPresenterImpl()
        let interactor = FindItemsInteractorImpl(presenter: presenter, worker: worker)
        viewController = FindItemsViewController(interactor: interactor, router: router)
        presenter.viewController = self.viewController
        router.viewController = self.viewController
        
    }
    
    static func setupModule(navController: UINavigationController)-> ModuleFindItems {
        ModuleFindItems(navController: navController)
    }
    
    func showModule(){
        router.goToShow()
    }
}
