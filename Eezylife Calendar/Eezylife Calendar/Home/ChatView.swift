//
//  ChatView.swift
//  Eezylife Calendar
//
//  Created by Saurabh Bajaj on 18/02/20.
//  Copyright © 2020 Saurabh. All rights reserved.
//

import UIKit

class ChatView: UIView {

    @IBOutlet weak var senderImageView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        commentLabel.text = """
        Kate Wilson

        Thank you for making this plan Marc. These are just the places I was wanting to go to...
        """
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        senderImageView.layer.cornerRadius = senderImageView.frame.height/2
        userImageView.layer.cornerRadius = userImageView.frame.height/2
    }
}
