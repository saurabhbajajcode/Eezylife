//
//  CalenderCollectionViewCell.swift
//  Eezylife Calendar
//
//  Created by Saurabh Bajaj on 15/02/20.
//  Copyright © 2020 Saurabh. All rights reserved.
//

import UIKit

class CalenderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var weekdayLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var dotImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!

    override var isSelected: Bool {
        didSet {
            if isSelected {
                backgroundImageView.image = UIImage(named: "Oval")
            } else {
                backgroundImageView.image = UIImage(named: "Oval deselected")
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        dotImageView.layer.cornerRadius = dotImageView.frame.height/2
    }

}
