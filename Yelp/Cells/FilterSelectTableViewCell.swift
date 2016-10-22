//
//  FilterSelectTableViewCell.swift
//  Yelp
//
//  Created by Liem Ly Quan on 10/21/16.
//  Copyright © 2016 CoderSchool. All rights reserved.
//

import UIKit

@objc protocol FilterSelectTableViewCellDelegate {
    @objc optional func selectButtonDidTap(_ filterSelectTableViewCell: FilterSelectTableViewCell)
}

class FilterSelectTableViewCell: UITableViewCell {
    @IBOutlet weak var selectLabel: UILabel!
    @IBOutlet weak var selectButton: UIButton!
    
    weak var delegate: FilterSelectTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func onTapCollapseButton(sender: UIButton){
        delegate?.selectButtonDidTap?(self)
    }
}
