//
//  LoadingCollectionViewCell.swift
//  MELITest
//
//  Created by Julian Barco on 17/03/22.
//
import NVActivityIndicatorView
import UIKit

class LoadingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var loader: NVActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
            loader.startAnimating()
    }

}
