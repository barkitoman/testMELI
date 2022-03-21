//
//  Mocks.swift
//  MELITestTests
//
//  Created by Julian Barco on 21/03/22.
//

import SwiftyMocky
import Foundation
import RxTest
import RxSwift
@testable import MELITest

struct FindItemsInteractorMock: FindItemsInteractor {
    
    let presenter: FindItemsPresenter
    
    init(presenter: FindItemsPresenter) {
        self.presenter = presenter
    }
    
    func find(_ text: String) {
        self.presenter.showResults(items: Item.test)
    }
    
    func nextPage() {
        self.presenter.showResults(items: Item.test + Item.test)
    }
}

struct FindItemsEmptyInteractorMock: FindItemsInteractor {
    
    let presenter: FindItemsPresenter
    
    init(presenter: FindItemsPresenter) {
        self.presenter = presenter
    }
    
    func find(_ text: String) {
        self.presenter.showResults(items: [])
    }
    
    func nextPage() {
        self.presenter.showResults(items: [])
    }
}

struct FindItemsLoadingInteractorMock: FindItemsInteractor {
    
    let presenter: FindItemsPresenter
    
    init(presenter: FindItemsPresenter) {
        self.presenter = presenter
    }
    
    func find(_ text: String) {
        self.presenter.showLoading()
    }
    
    func nextPage() {
    }
}

struct FindItemsErrorsInteractorMock: FindItemsInteractor {
    let presenter: FindItemsPresenter
    
    init(presenter: FindItemsPresenter) {
        self.presenter = presenter
    }
    
    func find(_ text: String) {
        self.presenter.showError()
    }
    
    func nextPage() {}
}

internal extension Item {
    static let empty = Item(id: "", title: "", thumbnail: "", price: 0)
    static let test = [Item](repeating: .empty, count: 10)
}

struct FakeFindItemsWorkerMock: FindItemsWorker {
    
    let scheduler: TestScheduler
    func getArticles(from query: String, offset: Int, limit: Int) -> Single<FindResult> {
        
        let obj = FindResult(results: [], paging: Pagination(total: 0, results: 0, offset: 0, limit: 0))
        return scheduler.createColdObservable([.next(10, obj), .completed(10)]).asSingle()
    }
    
}

struct FakeDetailtemsWorkerMock: DetailItemWorker {
    func getDetailtItem(itemId: String) -> Single<DetailItem> {
        let obj = DetailItem(id: "", title: "", condition: .new, pictures: [Picture(url: "photo.url")], soldQuantity: 0, price: 0, originalPrice: 0, permalink: "", acceptsMercadoPago: true, warranty: "")
        return scheduler.createColdObservable([.next(10, obj), .completed(10)]).asSingle()
    }
    
    
    let scheduler: TestScheduler
    func getArticles(from query: String, offset: Int, limit: Int) -> Single<FindResult> {
        
        let obj = FindResult(results: [], paging: Pagination(total: 0, results: 0, offset: 0, limit: 0))
        return scheduler.createColdObservable([.next(10, obj), .completed(10)]).asSingle()
    }
    
}



struct DetailItemLoadingInteractorMock: DetailtemInteractor {
    private let presenter: DetailItemPresenterImpl
    
    init(presenter: DetailItemPresenterImpl) {
        self.presenter = presenter
    }
    
    func getDetailtItem(id: String) {
        presenter.showLoading()
    }
    
    func goToLink(_ link: String) {}
}

struct DetailItemDataInteractorMock: DetailtemInteractor {
    private let presenter: DetailItemPresenterImpl
    
    init(presenter: DetailItemPresenterImpl) {
        self.presenter = presenter
    }
    
    func getDetailtItem(id: String) {
        presenter.showDetails(detailItem: .test)
    }
    
    func goToLink(_ link: String) {}
}

internal extension DetailItem {
    static let test = DetailItem(
        id: "1",
        title: "Test",
        condition: .new,
        pictures: [Picture(url: "photo.url")],
        soldQuantity: 2,
        price: 100,
        originalPrice: nil,
        permalink: "test.co",
        acceptsMercadoPago: true,
        warranty: "Test"
    )
}
