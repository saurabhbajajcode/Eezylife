//
//  PlanView.swift
//  Eezylife Calendar
//
//  Created by Saurabh Bajaj on 18/02/20.
//  Copyright © 2020 Saurabh. All rights reserved.
//

import UIKit

class PlanView: UIView {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var declineButton: UIButton!

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 8
    }

    // MARK: IBActions
    @IBAction func acceptButtonTapped(sender: UIButton) {
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.declineButton.isHidden = true
            self?.acceptButton.setTitle("", for: .normal)
            self?.acceptButton.setBackgroundImage(UIImage(named: "Group 5"), for: .normal)
            self?.acceptButton.isUserInteractionEnabled = false
        }
    }

    @IBAction func declineButtonTapped(sender: UIButton) {
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.acceptButton.isHidden = true
            self?.declineButton.setTitle("Declined", for: .normal)
            self?.declineButton.isUserInteractionEnabled = false
        }
    }

}
