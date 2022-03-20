//
//  PictureCollectionViewCell.swift
//  MELITest
//
//  Created by Julian Barco on 18/03/22.
//

import UIKit

class PictureCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUI(viewModel: DetailPicturesViewModel) {
        if let url = URL(string: viewModel.picture.url) {
            DispatchQueue.global(qos: .userInitiated).async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else { return }
                        self.imageView.image = UIImage(data: data)
                    }
                }
            }
        }
    }

}
