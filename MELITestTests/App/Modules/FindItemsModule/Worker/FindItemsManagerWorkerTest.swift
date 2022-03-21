//
//  FindItemsManagerWorkerTest.swift
//  MELITestTests
//
//  Created by Julian Barco on 21/03/22.
//

import XCTest
import RxSwift
@testable import MELITest

class FindItemsManagerWorkerTest: XCTestCase {

    private var findItemsManagerWorker = FindItemsManagerWorker()
    
    func test_to_get_articles(){
        
        let result = findItemsManagerWorker.getArticles(from: "", offset: 0, limit: 0)
        result.subscribe(onSuccess: { _ in }, onFailure: { _ in }).disposed(by: DisposeBag())

        XCTAssertNotNil(result)
    }

}



