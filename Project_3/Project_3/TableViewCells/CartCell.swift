//
//  CartCell.swift
//  Project_3
//
//  Created by admin on 6/4/21.
//

import UIKit

class CartCell: UITableViewCell
{

	@IBOutlet weak var ItemName: UILabel!
	@IBOutlet weak var ItemPrice: UILabel!
	
	override func awakeFromNib()
	{
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
	{
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
