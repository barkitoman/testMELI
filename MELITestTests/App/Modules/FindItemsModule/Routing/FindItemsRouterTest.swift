//
//  FindItemsRouterTest.swift
//  MELITestTests
//
//  Created by Julian Barco on 21/03/22.
//

import XCTest
@testable import MELITest

class FindItemsRouterTest: XCTestCase {
    
    private var findItemsRouter: FindItemsRouterImpl!
    let navigationController = UINavigationController()
    override func setUp() {
        super.setUp()
        findItemsRouter =  FindItemsRouterImpl(navigationController: navigationController)
    }

    func test_to_validate_show_view() {
        findItemsRouter.goToShow()
        XCTAssertNil(findItemsRouter.viewController)
    }
    
    func test_to_go_to_show_item_by_id(){
        XCTAssertTrue(((findItemsRouter.goToShowItemBy(id: "")) != nil))
    }

}
