//
//  WelcomeViewNotUserTableCell.swift
//  Project_3
//
//  Created by Kangseok Lee on 6/1/21.
//

import UIKit

class WelcomeViewNotUserTableCell: UITableViewCell {

    @IBOutlet weak var BestSellingImage: UIImageView!
    @IBOutlet weak var BestSellingItem: UILabel!
    @IBOutlet weak var BestSellingPrice: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
