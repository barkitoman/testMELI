//
//  DetailItemPresenter.swift
//  MELITest
//
//  Created by Julian Barco on 17/03/22.
//

import Foundation


protocol DetailItemPresenter {
    func showLoading()
    func showDetails()
}
class DetailItemPresenterLogic:DetailItemPresenter {
   
    weak var  viewController: DetailItemViewController?
    
    deinit {
//        MLLogger.instance.log("details presenter is being deallocated", level: .deallocation)
    }
    func showLoading() {
        
    }
    
    func showDetails() {
        
    }
    
}
