//
//  FilterSwitchTableViewCell.swift
//  Yelp
//
//  Created by Liem Ly Quan on 10/20/16.
//  Copyright © 2016 CoderSchool. All rights reserved.
//

import UIKit

@objc protocol FilterSwitchTableViewCellDelegate {
    @objc optional func switchDidChange(_ filterSwitchTableViewCell: FilterSwitchTableViewCell)
}

class FilterSwitchTableViewCell: UITableViewCell {
    @IBOutlet weak var filterLabel: UILabel!
    @IBOutlet weak var filterSwitch: UISwitch!

    weak var delegate:FilterSwitchTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func onChangeSwitch(sender: UISwitch){
        delegate?.switchDidChange?(self)
    }

}
