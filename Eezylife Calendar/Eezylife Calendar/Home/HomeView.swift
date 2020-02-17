//
//  HomeView.swift
//  Eezylife Calendar
//
//  Created by Saurabh Bajaj on 14/02/20.
//  Copyright © 2020 Saurabh. All rights reserved.
//

import UIKit

class HomeView: UIView {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var tableView: UITableView!

    fileprivate let timeSlots: [String] = ["Morning","noon","afternoon","evening","night"]
    fileprivate var selectedIndexpath: IndexPath?

    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 64
    }
}


extension HomeView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeSlots.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "homeViewCell") as? HomeTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.timeSlotLabel.text = self.timeSlots[indexPath.row].capitalized

        if indexPath == selectedIndexpath {
            cell.backgroundImageView.image = UIImage(named: "Group 4")
            cell.expandedViewHeightConstraint.constant = 450
            cell.expandedView.isHidden = false
            cell.collapsedView.isHidden = true
            cell.isExpanded = true
        } else {
            cell.backgroundImageView.image = UIImage(named: "Group 51")
            cell.collapsedViewHeightConstraint.constant = 40
            cell.expandedView.isHidden = true
            cell.collapsedView.isHidden = false
            cell.isExpanded = false
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == self.selectedIndexpath {
            selectedIndexpath = nil
        } else {
            self.selectedIndexpath = indexPath
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

}
