//
//  WishlistTableCell.swift
//  Project_3
//
//  Created by Kangseok Lee on 6/3/21.
//

import UIKit

class WishlistTableCell: UITableViewCell {

    @IBOutlet weak var hImage: UIImageView!
    @IBOutlet weak var hName: UILabel!
    @IBOutlet weak var hPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
