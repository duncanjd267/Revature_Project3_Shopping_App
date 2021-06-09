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
    @IBOutlet weak var cellView: UIView!
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        cellView.layer.shadowRadius = 10
        cellView.layer.shadowOpacity = 0.5
        cellView.layer.shadowOffset = CGSize(width: 5, height: 10)

        self.clipsToBounds = false
    }
    
}
