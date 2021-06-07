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
        self.clipsToBounds = false
    }
    
    
}
