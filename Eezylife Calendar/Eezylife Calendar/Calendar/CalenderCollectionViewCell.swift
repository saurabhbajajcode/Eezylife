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
    @IBOutlet weak var dotImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        dotImageView.layer.cornerRadius = dotImageView.frame.height/2
    }
}
