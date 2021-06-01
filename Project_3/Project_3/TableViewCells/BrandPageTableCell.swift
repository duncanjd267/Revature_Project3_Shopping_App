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
    
    @IBOutlet weak var BrandPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
