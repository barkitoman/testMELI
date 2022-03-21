//
//  DetailItemWorkerTest.swift
//  MELITestTests
//
//  Created by Julian Barco on 21/03/22.
//
import XCTest
import RxSwift
@testable import MELITest

class DetailItemManagerWorkerTest: XCTestCase {

    private var detailtemManagerWorker = DetailtemManagerWorker()
    
    func test_to_get_articles(){
        
        let result = detailtemManagerWorker.getDetailtItem(itemId: "")
        result.subscribe(onSuccess: { _ in }, onFailure: { _ in }).disposed(by: DisposeBag())

        XCTAssertNotNil(result)
    }

}
