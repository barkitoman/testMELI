//
//  DetailItemViewController.swift
//  MELITest
//
//  Created by Julian Barco on 17/03/22.
//

import UIKit

class DetailItemViewController: UIViewController {

    
    
//    private var dataSource: DataSource!
    
    init(interactor: DetailtemInteractorLogic, router: DetailItemRouterLogic, itemId: String) {
//        self.interactor = interactor
//        self.router = router
//        self.itemId = itemId
        let nibName = String(describing: Self.self)
        super.init(nibName: nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
//        MLLogger.instance.log("details view is being deallocated", level: .deallocation)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
