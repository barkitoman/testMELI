//
//  DetailItemInteractor.swift
//  MELITest
//
//  Created by Julian Barco on 17/03/22.
//

import Foundation
import RxSwift

protocol DetailtemInteractor {
    func getDetailtItem(id: String)
    func goToLink(_ link : String)
}

class DetailtemInteractorLogic: DetailtemInteractor {
    private let presenter: DetailItemPresenter
    private let worker: DetailItemWorker
    
    init(presenter: DetailItemPresenter, worker: DetailItemWorker) {
        self.presenter = presenter
        self.worker = worker
    }
    
    deinit {
//        MLLogger.instance.log("details interactor is being deallocated", level: .deallocation)
    }
    
    func getDetailtItem(id: String) {
        
    }
    
    func goToLink(_ link: String) {
        if let url = URL(string: link) {
            UIApplication.shared.open(url)
        }
    }
}
