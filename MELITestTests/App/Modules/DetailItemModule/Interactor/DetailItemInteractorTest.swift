//
//  DetailItemInteractorTest.swift
//  MELITestTests
//
//  Created by Julian Barco on 21/03/22.
//
import XCTest
import RxSwift
import SwiftyMocky
import RxTest
@testable import MELITest

class DetailtemsInteractorTest: XCTestCase {

    private var detailtemsInteractor: DetailtemInteractorImpl!

    var scheduler = TestScheduler(initialClock: 0)
    var disposeBag: DisposeBag!
    let obj = FindResult(results: [], paging: Pagination(total: 0, results: 0, offset: 0, limit: 0))
    
    func test_to_find_items() {
        let fakeWorker = FakeDetailtemsWorkerMock(scheduler: scheduler)
        let fakePresenter = DetailItemPresenterMock()
        detailtemsInteractor = DetailtemInteractorImpl(presenter: fakePresenter, worker: fakeWorker)
        detailtemsInteractor.getDetailtItem(id: "")
    }
    
    func test_to_next_page(){
        let fakeWorker = FakeDetailtemsWorkerMock(scheduler: scheduler)
        let fakePresenter = DetailItemPresenterMock()
        detailtemsInteractor = DetailtemInteractorImpl(presenter: fakePresenter, worker: fakeWorker)
        detailtemsInteractor.goToLink("")
    }

}
