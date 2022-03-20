//
//  DetailResult.swift
//  MELITest
//
//  Created by Julian Barco on 18/03/22.
//

import Foundation

class DetailSectionItem: Hashable {
    var id: String = UUID().uuidString
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: DetailSectionItem, rhs: DetailSectionItem) -> Bool {
        false
    }
}

class DetailPhotoItem: DetailSectionItem {
    let viewModel: DetailPicturesViewModel
    
    init(viewModel: DetailPicturesViewModel){
        self.viewModel = viewModel
    }
}

class DetailHeaderItem: DetailSectionItem {
    let viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
}

class DetailInfoItem: DetailSectionItem {
    let viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
}

class DetailActionItem: DetailSectionItem {
    let viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
}

class DetailLoading: DetailSectionItem {}
