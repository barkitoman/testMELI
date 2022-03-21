//
//  FindItemsPresenterTest.swift
//  MELITestTests
//
//  Created by Julian Barco on 21/03/22.
//

import XCTest
import RxSwift
import SwiftyMocky
import RxTest
@testable import MELITest

class FindItemsPresenterTest: XCTestCase {

    func test_show_loading() {
        let presenter = FindItemsPresenterImpl()
        let interactor = FindItemsLoadingInteractorMock(presenter: presenter)
        let router = FindItemsRouterImpl(navigationController: UINavigationController())
        let sut = FindItemsViewController(interactor: interactor, router: router)
        presenter.viewController = sut
        
        sut.loadViewIfNeeded()
        
        interactor.find("")
        let numberOfItems = sut.collectionView.numberOfItems(inSection: 1)
        XCTAssertEqual(numberOfItems, 1)
        let emptyCell = sut.collectionView.dataSource?.collectionView(sut.collectionView, cellForItemAt: .init(row: 0, section: 1))
        XCTAssert(emptyCell is LoadingCollectionViewCell)
        
    }
    
    func test_show_Results() {
        let presenter = FindItemsPresenterImpl()
        let interactor = FindItemsInteractorMock(presenter: presenter)
        let router = FindItemsRouterImpl(navigationController: UINavigationController())
        let sut = FindItemsViewController(interactor: interactor, router: router)
        presenter.viewController = sut
        
        sut.loadViewIfNeeded()
        
        interactor.find("")
        let numberOfItemsInScreen = sut.collectionView.numberOfItems(inSection: 0)
        XCTAssertEqual(numberOfItemsInScreen, 10)
    }
    
    func test_is_empty_data(){
        let presenter = FindItemsPresenterImpl()
        let interactor = FindItemsEmptyInteractorMock(presenter: presenter)
        let router = FindItemsRouterImpl(navigationController: UINavigationController())
        let sut = FindItemsViewController(interactor: interactor, router: router)
        presenter.viewController = sut
        
        sut.loadViewIfNeeded()
        
        interactor.find("")
        let numberOfItems = sut.collectionView.numberOfItems(inSection: 0)
        XCTAssertEqual(numberOfItems, 0)
    }
    
    func test_error_presenter(){
        let presenter = FindItemsPresenterImpl()
        let interactor = FindItemsErrorsInteractorMock(presenter: presenter)
        let router = FindItemsRouterImpl(navigationController: UINavigationController())
        let sut = FindItemsViewController(interactor: interactor, router: router)
        presenter.viewController = sut
        
        sut.loadViewIfNeeded()
        
        interactor.find("")
        let numberOfItems = sut.collectionView.numberOfItems(inSection: 0)
        XCTAssertEqual(numberOfItems, 0)
    
    }
}

