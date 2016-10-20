//
//  BusinessTableViewCell.swift
//  Yelp
//
//  Created by Liem Ly Quan on 10/19/16.
//  Copyright © 2016 CoderSchool. All rights reserved.
//

import UIKit
import AFNetworking

class BusinessTableViewCell: UITableViewCell {
    @IBOutlet weak var businessImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!

    var business: Business! {
        didSet {
            if let businessImageUrl = business.imageURL {
                businessImageView.setImageWith(businessImageUrl)
            }
            nameLabel.text = business.name
            distanceLabel.text = business.distance
            if let ratingImageUrl = business.ratingImageURL {
                ratingImageView.setImageWith(ratingImageUrl)
            }
            if let reviewCount = business.reviewCount {
                reviewLabel.text = "\(reviewCount) reviews"
            }
            addressLabel.text = business.address
            categoryLabel.text = business.categories
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
