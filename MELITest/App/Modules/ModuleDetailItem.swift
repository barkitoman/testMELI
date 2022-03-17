//
//  ModuleDetailItem.swift
//  MELITest
//
//  Created by Julian Barco on 17/03/22.
//

import Foundation
import UIKit

class ModuleDetailItem {
    private let router: DetailItemRouterLogic
    private let viewController: DetailItemViewController
    
    private init(navController: UINavigationController, itemId:String){
        router = DetailItemRouterLogic(navigationController: navController)
        let worker = DetailtemManagerWorker()
        let presenter = DetailItemPresenterLogic()
        let interactor = DetailtemInteractorLogic(presenter: presenter, worker: worker)
        self.viewController = DetailItemViewController(interactor: interactor, router: router, itemId: itemId)
        presenter.viewController = self.viewController
        router.viewController = self.viewController
        
    }
    
    static func setupModule(navController: UINavigationController, itemId: String)-> ModuleDetailItem {
        ModuleDetailItem(navController: navController, itemId: itemId)
    }
    
    func showModule(){
        router.goToshow()
    }
}
