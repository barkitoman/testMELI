//
//  FindItemsInteractor.swift
//  MELITest
//
//  Created by Julian Barco on 16/03/22.
//

import Foundation
import RxSwift

protocol FindItemsBusinessLogic{
    func find(_ text:String)
    func nextPage()
}
class FindItemsInteractor: FindItemsBusinessLogic {
    
    private let presenter: FindItemsPresentationLogic
    private let worker: FindItemsManagerWorker
    
    private let disposeBag = DisposeBag()
//    private var pagination: Pagination
    private var query = ""
    private var items: [Item] = []
    
    init(presenter: FindItemsPresentationLogic, worker: FindItemsManagerWorker) {
        self.presenter = presenter
        self.worker = worker
    }
    
    func find(_ text: String) {
        self.query = text
        presenter.showLoading()
//        self.pagination = Pagination(total: 0, results: 0, offset: 0, limit: 15)
        self.worker.getArticles(from: self.query, offset: 15, limit: 15)
            .subscribe(onSuccess: { [weak self] result in
                guard let self = self else { return }
//                self.pagination = result.pagin
                self.items = result.results
                DispatchQueue.main.async { [self] in
                    self.presenter.showResults(items: self.items)
                }
            }, onFailure: { [weak self] error  in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.presenter.showError()
                }
            }).disposed(by: self.disposeBag)
    }
    
    func nextPage() {
        
    }
    
    
}
