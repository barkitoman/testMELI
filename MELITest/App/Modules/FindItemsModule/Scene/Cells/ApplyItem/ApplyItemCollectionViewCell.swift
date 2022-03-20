//
//  ApplyItemCollectionViewCell.swift
//  MELITest
//
//  Created by Julian Barco on 17/03/22.
//

import UIKit

class ApplyItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var textTitle: UILabel!
    @IBOutlet weak var textPrice: UILabel!
    @IBOutlet weak var textDiscount: UILabel!
    @IBOutlet weak var viewContent: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configurateCell()
    }
    
    func configurateCell(){
        self.viewContent.layer.borderWidth = 1
        self.viewContent.layer.borderColor = UIColor(named: "G")?.cgColor
    }

    func setCellWithViewModel(_ viewModel: FindItemsViewModel){
        textTitle.text = viewModel.item.title
        textPrice.text = viewModel.getPrice()
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }
            
            if let url = URL(string: viewModel.item.thumbnail) {
                if let data = try? Data(contentsOf: url) {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.picture.image = image
                    }
                }
            }
        }
        
        if viewModel.hasDiscount {
            textDiscount.text = viewModel.discount
        }else{
            textDiscount.isHidden = true
        }
        
        
    }
}
