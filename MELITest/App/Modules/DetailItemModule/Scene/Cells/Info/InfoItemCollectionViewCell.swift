//
//  InfoItemCollectionViewCell.swift
//  MELITest
//
//  Created by Julian Barco on 19/03/22.
//

import UIKit

class InfoItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var originalPrice: UILabel!
    @IBOutlet weak var warrantyLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imgMercadoPago: UIImageView!
    @IBOutlet weak var discount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUI(viewModel: DetailViewModel) {
        if viewModel.hasDiscount {
            discount.text = viewModel.discount
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: viewModel.originalPrice)
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
            self.originalPrice.attributedText = attributeString
        } else {
            self.originalPrice.isHidden = true
        }
        self.priceLabel.text = viewModel.price
        self.warrantyLabel.text = viewModel.detail.warranty
        self.imgMercadoPago.isHidden = !viewModel.canPayMercadoPego
    }

}
