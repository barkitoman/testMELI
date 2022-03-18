//
//  DetailItemPresenter.swift
//  MELITest
//
//  Created by Julian Barco on 17/03/22.
//

import Foundation


protocol DetailItemPresenter {
    func showLoading()
    func showDetails(detailItem: DetailItem)
}

class DetailItemPresenterImpl: DetailItemPresenter {
   
    weak var  viewController: DetailItemViewController?
    
    deinit {
//        MLLogger.instance.log("details presenter is being deallocated", level: .deallocation)
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
        viewController.applySnapshot(sections: [headerSection, photoSection])
    }
    
}
