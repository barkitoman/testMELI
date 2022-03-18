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

class DetailtemInteractorImpl: DetailtemInteractor {
    
    private let presenter: DetailItemPresenter
    private let worker: DetailItemWorker
    private let disposeBag = DisposeBag()
    
    init(presenter: DetailItemPresenter, worker: DetailItemWorker) {
        self.presenter = presenter
        self.worker = worker
    }
    
    deinit {
//        MLLogger.instance.log("details interactor is being deallocated", level: .deallocation)
    }
    
    func getDetailtItem(id: String){
        self.presenter.showLoading()
        worker.getDetailtItem(itemId: id)
            .subscribe(onSuccess: { [weak self] detailItem in
                guard let self = self else { return }
                self.presenter.showDetails(detailItem: detailItem)
            }, onFailure: {[weak self] error in
                guard let _ = self else { return }
//                MLLogger.instance.log("Error Service", level: .error)
            }).disposed(by: disposeBag)
        
    }
    
    func goToLink(_ link: String) {
        if let url = URL(string: link) {
            UIApplication.shared.open(url)
        }
    }
}
