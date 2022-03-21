//
//  ModuleFindItemsTest.swift
//  MELITestTests
//
//  Created by Julian Barco on 21/03/22.
//

import XCTest
@testable import MELITest

class ModuleFindItemsTest: XCTestCase {
    private var moduleFindItems: ModuleFindItems?
    
    override func setUp() {
        super.setUp()
        let navigationController = UINavigationController()
        moduleFindItems =  ModuleFindItems.setupModule(navController: navigationController)
    }
    
    func test_show_module_test() {
        XCTAssertTrue(((moduleFindItems?.showModule()) != nil))
    }
}
