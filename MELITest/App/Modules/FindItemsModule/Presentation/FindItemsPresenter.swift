//
//  FindItemsPresenter.swift
//  MELITest
//
//  Created by Julian Barco on 16/03/22.
//

import Foundation
import UIKit

protocol FindItemsPresentationLogic {
    func showLoading()
    func showResults(items: [Item])
    func showError()
}

class FindItemsPresenter: FindItemsPresentationLogic {
    weak var viewController: FindItemsViewController?
    
    func showLoading() {
        viewController?.viewEmptyData(show: false)
        let sections = [
            FindSection(items: []),
            FindSection(items:[FindItemLoading()])
        ]
        viewController?.applySnapshot(sections: sections)
    }
    
    func showResults(items: [Item]) {
        viewController?.viewEmptyData(show: false)
        if items.isEmpty {
            let sections = [
                FindSection(items: [])
            ]
            viewController?.applySnapshot(sections: sections)
            viewController?.viewEmptyData(show: true)
        }else{
            let items = items.map({ FindItemApply(viewModel: FindItemsViewModel(item: $0))})
            let section = FindSection(items: items)
            viewController?.applySnapshot(sections: [section])
        }
        
    }
    
    func showError() {
        let sections = [
            FindSection(items: [])
        ]
        viewController?.applySnapshot(sections: sections)
        viewController?.viewEmptyData(show: true)
    }
    
}
