//
//  DetailItemPresenterTest.swift
//  MELITestTests
//
//  Created by Julian Barco on 21/03/22.
//
import XCTest
import RxSwift
import SwiftyMocky
import RxTest
@testable import MELITest

class DetailItemPresenterTest: XCTestCase {

    func test_show_loader() {
        let presenter = DetailItemPresenterImpl()
        let interactor = DetailItemLoadingInteractorMock(presenter: presenter)
        let router = DetailItemRouterImpl(navigationController: UINavigationController())
        let sut = DetailItemViewController(interactor: interactor, router: router, itemId: "")
        presenter.viewController = sut
        
        sut.loadViewIfNeeded()
        
        interactor.getDetailtItem(id: "")
        let numberOfItems = sut.collectionView.numberOfItems(inSection: 1)
        XCTAssertEqual(numberOfItems, 1)
        
        let emptyCell = sut.collectionView.dataSource?.collectionView(sut.collectionView, cellForItemAt: .init(row: 0, section: 1))
        XCTAssert(emptyCell is LoadingCollectionViewCell)
    }
    
    func test_show_item_data() {
        let presenter = DetailItemPresenterImpl()
        let interactor = DetailItemDataInteractorMock(presenter: presenter)
        let router = DetailItemRouterImpl(navigationController: UINavigationController())
        let sut = DetailItemViewController(interactor: interactor, router: router, itemId: "")
        presenter.viewController = sut
        
        sut.loadViewIfNeeded()
        
        interactor.getDetailtItem(id: "")
        let numberOfSections = sut.collectionView.numberOfSections
        XCTAssertEqual(numberOfSections, 4)
        
        let headerCell = sut.collectionView.dataSource?.collectionView(sut.collectionView, cellForItemAt: .init(row: 0, section: 0))
        XCTAssert(headerCell is HeaderDetailCollectionViewCell)
        let photoCell = sut.collectionView.dataSource?.collectionView(sut.collectionView, cellForItemAt: .init(row: 0, section: 1))
        XCTAssert(photoCell is PictureCollectionViewCell)
        let priceCell = sut.collectionView.dataSource?.collectionView(sut.collectionView, cellForItemAt: .init(row: 0, section: 2))
        XCTAssert(priceCell is InfoItemCollectionViewCell)
        let buyCell = sut.collectionView.dataSource?.collectionView(sut.collectionView, cellForItemAt: .init(row: 0, section: 3))
        XCTAssert(buyCell is FooterCollectionViewCell)
    }
}
