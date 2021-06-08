//
//  ItemCtrlTabelCell.swift
//  Project_3
//
//  Created by Kangseok Lee on 5/27/21.
//

import UIKit

class ItemCtrlTableCell: UITableViewCell {

    @IBOutlet weak var ReviewLB: UILabel!
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
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        self.clipsToBounds = false
    }
    
}
