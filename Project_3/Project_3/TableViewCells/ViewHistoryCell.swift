//
//  ViewHistoryCell.swift
//  Project_3
//
//  Created by Kangseok Lee on 6/2/21.
//

import UIKit

class ViewHistoryCell: UITableViewCell {

    @IBOutlet var ViewHistoryImg: UIImageView!
    @IBOutlet var ItemName: UILabel!
    @IBOutlet var ItemPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
