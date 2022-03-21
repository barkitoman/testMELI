//
//  DetailItemPresenter.swift
//  MELITest
//
//  Created by Julian Barco on 17/03/22.
//

import Foundation

//sourcery: AutoMockable
protocol DetailItemPresenter {
    func showLoading()
    func showDetails(detailItem: DetailItem)
    func showError()
}

class DetailItemPresenterImpl: DetailItemPresenter {
    weak var  viewController: DetailItemViewController?
    
    deinit {
        Log.i("Details presenter is being deallocated")
    }
    
    func showLoading() {
        guard let viewController = viewController else {
            return
        }
        let emptySection = DetailSection(items: [])
        let loadingSection = DetailSection(
            items: [ DetailLoading() ]
        )
        viewController.applySnapshot(sections: [emptySection,loadingSection])
    }
    
    func showDetails(detailItem: DetailItem) {
        guard let viewController = viewController else {
            return
        }
        let headerSection = DetailSection(items: [DetailHeaderItem(viewModel: DetailViewModel(detail: detailItem))])
        
        let photos = detailItem.pictures.map({
            DetailPhotoItem(viewModel: DetailPicturesViewModel(picture: $0))
        })
        
        let photoSection = DetailSection(items: photos)
        
        let infoSection = DetailSection(items: [DetailInfoItem(viewModel: DetailViewModel(detail: detailItem))])
        
        let actionSection = DetailSection(items: [DetailActionItem(viewModel: DetailViewModel(detail: detailItem))])
        
        viewController.applySnapshot(
            sections: [
                headerSection,
                photoSection,
                infoSection,
                actionSection
            ]
        )
    }
    
    func showError() {
        guard let viewController = viewController else {
            return
        }
        let emptySection = DetailSection(items: [])
        viewController.applySnapshot(sections: [emptySection])
    }
    
}
