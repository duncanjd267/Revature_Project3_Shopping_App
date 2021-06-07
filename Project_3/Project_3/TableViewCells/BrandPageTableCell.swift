//
//  BrandPageTableCell.swift
//  Project_3
//
//  Created by Kangseok Lee on 6/1/21.
//

import UIKit

class BrandPageTableCell: UITableViewCell {

    @IBOutlet weak var BrandImg: UIImageView!
    
    @IBOutlet weak var BrandName: UILabel!
    
    @IBOutlet weak var BrandDP: UILabel!
    
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        cellView.layer.shadowRadius = 10
        cellView.layer.shadowOpacity = 0.5
        cellView.layer.shadowOffset = CGSize(width: 5, height: 10)

        BrandImg.layer.shadowRadius = 10
        BrandImg.layer.shadowOpacity = 0.5
        BrandImg.layer.shadowOffset = CGSize(width: 5, height: 10)

        
        self.clipsToBounds = false
    }
    

}
