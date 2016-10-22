//
//  FilterSliderTableViewCell.swift
//  Yelp
//
//  Created by Liem Ly Quan on 10/22/16.
//  Copyright © 2016 CoderSchool. All rights reserved.
//

import UIKit

@objc protocol FilterSliderTableViewCellDelegate {
    @objc optional func sliderDidChange(_ filterSliderTableViewCell: FilterSliderTableViewCell, newValue: Float)
}

class FilterSliderTableViewCell: UITableViewCell {
    @IBOutlet weak var sliderIndicatorLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    weak var delegate: FilterSliderTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        slider.minimumValue = 0
        slider.maximumValue = 40000
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func onChangeSlider(sender: UISlider){
        let value = sender.value
        sliderIndicatorLabel.text = String(format: "%.0f m", value)
        delegate?.sliderDidChange?(self, newValue: sender.value)
    }

}
