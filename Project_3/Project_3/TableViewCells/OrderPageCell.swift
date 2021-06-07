//
//  OrderPageCell.swift
//  Project_3
//
//  Created by Kangseok Lee on 6/7/21.
//

import UIKit

class OrderPageCell: UITableViewCell {

    @IBOutlet weak var ItemImg: UIImageView!
    @IBOutlet weak var ItemName: UILabel!
    @IBOutlet weak var ItemPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
