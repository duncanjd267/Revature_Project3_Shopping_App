//
//  CartTableCell.swift
//  Project_3
//
//  Created by admin on 6/1/21.
//

import UIKit

class CartTableCell: UITableViewCell
{

	@IBOutlet weak var ItemPic: UIImageView!
	@IBOutlet weak var ItemCost: UILabel!
	@IBOutlet weak var ItemName: UILabel!
	
	@IBAction func Removal(_ sender: UIButton)
	{
		//self.remove
	}
	
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
