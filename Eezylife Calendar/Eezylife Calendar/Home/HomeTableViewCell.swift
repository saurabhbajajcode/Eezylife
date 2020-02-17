//
//  HomeTableViewCell.swift
//  Eezylife Calendar
//
//  Created by Saurabh Bajaj on 16/02/20.
//  Copyright © 2020 Saurabh. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var timeSlotLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var collapsedView: UIView!
    @IBOutlet weak var expandedView: UIView!
    @IBOutlet weak var combinedImageView: UIImageView!
    @IBOutlet weak var collapsedViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var expandedViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var collapsedViewBottomConstraint: NSLayoutConstraint!

     var isExpanded: Bool = false

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        collapsedView.backgroundColor = UIColor.red
//        expandedView.backgroundColor = UIColor.purple
//        backgroundImageView.backgroundColor = UIColor.yellow

        backgroundImageView.contentMode = .topLeft
        backgroundImageView.clipsToBounds = true

        combinedImageView.layer.shadowColor = UIColor.gray.cgColor
        combinedImageView.layer.shadowOffset = CGSize.zero
        combinedImageView.layer.shadowRadius = 1
        combinedImageView.layer.shadowOpacity = 0.2

        expandedView.isHidden = true
        expandedViewHeightConstraint.constant = 0
    }



    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state

    }
}
