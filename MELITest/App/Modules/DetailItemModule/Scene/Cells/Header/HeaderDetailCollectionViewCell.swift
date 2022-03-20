//
//  HeaderDetailCollectionViewCell.swift
//  MELITest
//
//  Created by Julian Barco on 18/03/22.
//

import UIKit

class HeaderDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUI(_ viewModel: DetailViewModel) {
        self.conditionLabel.text = viewModel.conditionText
        self.titleLabel.text = viewModel.detail.title
    }

}
