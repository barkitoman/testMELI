//
//  FindEmptyView.swift
//  MELITest
//
//  Created by Julian Barco on 17/03/22.
//

import UIKit

class FindEmptyView: UIView {

    @IBOutlet weak var imageContentView: UIView!
    @IBOutlet weak var subtTile: UILabel!
    @IBOutlet weak var title: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib()
        self.setupUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
        self.setupUI()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setup()
    }
    
    private func setup() {
        guard let superview = self.superview else {
            return
        }
        
        let center = superview.convert(center, to: self)
        self.center = center
    }
    
    
    private func setupUI() {
        imageContentView.layer.cornerRadius = imageContentView.frame.width / 2
        title.text = "No encontramos publicaciones"
        subtTile.text = "Revisa que la palabra esté bien escrita. También puedes probar con menos términos o más generales."
    }

}
