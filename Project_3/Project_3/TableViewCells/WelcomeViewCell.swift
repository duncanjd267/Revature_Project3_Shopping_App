//
//  WelcomeViewCell.swift
//  Project_3
//
//  Created by Kangseok Lee on 5/25/21.
//

import UIKit

class WelcomeViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ReImage: UIImageView!
    @IBOutlet weak var ReText: UILabel!
    @IBOutlet weak var DealsImg: UIImageView!
    @IBOutlet weak var DealsText: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 5, height: 10)
        
        self.clipsToBounds = false
    }
    
}
