//
//  FilterCollapseTableViewCell.swift
//  Yelp
//
//  Created by Liem Ly Quan on 10/21/16.
//  Copyright © 2016 CoderSchool. All rights reserved.
//

import UIKit

@objc protocol FilterCollapseTableViewCellDelegate {
    @objc optional func collapseButtonDidTap(_ filterCollapseTableViewCell: FilterCollapseTableViewCell)
}

class FilterCollapseTableViewCell: UITableViewCell {
    @IBOutlet weak var collapseLabel: UILabel!
    @IBOutlet weak var collapseButton: UIButton!

    weak var delegate: FilterCollapseTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func onTapCollapseButton(sender: UIButton){
        delegate?.collapseButtonDidTap?(self)
    }

}
