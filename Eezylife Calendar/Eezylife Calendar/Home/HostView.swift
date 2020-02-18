//
//  HostView.swift
//  Eezylife Calendar
//
//  Created by Saurabh Bajaj on 18/02/20.
//  Copyright © 2020 Saurabh. All rights reserved.
//

import UIKit

class HostView: UIView {

    @IBOutlet weak var hostImageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!

    override func layoutSubviews() {
        super.layoutSubviews()
        hostImageView.layer.cornerRadius = hostImageView.frame.height/2

        for view in stackView.arrangedSubviews {
            view.layer.cornerRadius = view.frame.height/2
        }
    }

}
