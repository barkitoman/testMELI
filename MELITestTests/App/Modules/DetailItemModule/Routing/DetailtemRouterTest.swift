//
//  DetailtemRouterTest.swift
//  MELITestTests
//
//  Created by Julian Barco on 21/03/22.
//
import XCTest
@testable import MELITest

class DetailItemRouterTest: XCTestCase {
    
    private var detailItemRouter: DetailItemRouterImpl!
    let navigationController = UINavigationController()
    override func setUp() {
        super.setUp()
        detailItemRouter = DetailItemRouterImpl(navigationController: navigationController)
    }

    func test_to_validate_show_view() {
        detailItemRouter.goToshow()
        XCTAssertNil(detailItemRouter.viewController)
    }
    
    func test_to_go_to_back(){
        XCTAssertTrue(((detailItemRouter.goBack()) != nil))
    }
    
    func test_to_go_to_show(){
        XCTAssertTrue(((detailItemRouter.goToshow()) != nil))
    }

}
