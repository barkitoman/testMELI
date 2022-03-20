//
//  FooterCollectionViewCell.swift
//  MELITest
//
//  Created by Julian Barco on 19/03/22.
//

import UIKit

class FooterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var btnTap: UIButton!
    
    var onToap: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        
    }
    
    func setupUI() {
        btnTap.layer.cornerRadius = 8
        btnTap.setTitle("Comprar ahora", for: .normal)
       btnTap.addTarget(self, action: #selector(onTap), for: .touchUpInside)
    }
    
    @objc
    private func onTap() {
        self.onToap?()
    }

}
