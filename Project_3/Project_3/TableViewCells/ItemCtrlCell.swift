//
//  ItemCtrlCell.swift
//  Project_3
//
//  Created by Kangseok Lee on 5/27/21.
//

import UIKit

class ItemCtrlCell: UICollectionViewCell {
    
    @IBOutlet weak var ItemImg: UIImageView!
    @IBOutlet weak var ItemImg2: UIImageView!
    @IBOutlet weak var ItemName: UILabel!
    @IBOutlet weak var ItemPrice: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 5, height: 10)
        
        self.clipsToBounds = false
    }
    
    
}
