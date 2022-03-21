//
//  ModuleDetailItemTest.swift
//  MELITestTests
//
//  Created by Julian Barco on 21/03/22.
//

import XCTest
@testable import MELITest

class ModuleDetailItemTest: XCTestCase {
    private var moduleDetailItem: ModuleDetailItem?
    
    override func setUp() {
        super.setUp()
        let navigationController = UINavigationController()
        moduleDetailItem =  ModuleDetailItem.setupModule(navController: navigationController, itemId: "")
    }
    
    func test_show_module_test() {
        XCTAssertTrue(((moduleDetailItem?.showModule()) != nil))
    }
}
