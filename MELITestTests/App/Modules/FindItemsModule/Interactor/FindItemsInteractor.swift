//
//  FindItemsInteractor.swift
//  MELITestTests
//
//  Created by Julian Barco on 21/03/22.
//

import XCTest
import RxSwift
import SwiftyMocky
import RxTest
@testable import MELITest

class FindItemsInteractorTest: XCTestCase {

    private var findItemsInteractor: FindItemsInteractorImpl!

    var scheduler = TestScheduler(initialClock: 0)
    var disposeBag: DisposeBag!
    let obj = FindResult(results: [], paging: Pagination(total: 0, results: 0, offset: 0, limit: 0))
    
    func test_to_find_items() {
        let fakeWorker = FakeFindItemsWorkerMock(scheduler: scheduler)
        let fakePresenter = FindItemsPresenterMock()
        findItemsInteractor = FindItemsInteractorImpl(presenter: fakePresenter, worker: fakeWorker)
        findItemsInteractor.find("")
    }
    
    func test_to_next_page(){
        let fakeWorker = FakeFindItemsWorkerMock(scheduler: scheduler)
        let fakePresenter = FindItemsPresenterMock()
        findItemsInteractor = FindItemsInteractorImpl(presenter: fakePresenter, worker: fakeWorker)
        findItemsInteractor.nextPage()
    }

}
