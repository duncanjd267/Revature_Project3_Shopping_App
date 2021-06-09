//
//  CartCell.swift
//  Project_3
//
//  Created by admin on 6/4/21.
//

import UIKit

protocol DataCollectionProtocol{
    func deleteData(indx: Int)
}

class CartCell: UITableViewCell {

	@IBOutlet weak var ItemName: UILabel!
	@IBOutlet weak var ItemPrice: UILabel!
    @IBOutlet weak var ItemImage: UIImageView!
    
    var delegate: DataCollectionProtocol?
    var index: IndexPath?
    
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
    @IBAction func removeBttn(_ sender: Any) {
        delegate?.deleteData(indx: (index?.row)!)
    }
    
}
