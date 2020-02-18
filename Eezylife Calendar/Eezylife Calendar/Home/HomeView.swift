//
//  HomeView.swift
//  Eezylife Calendar
//
//  Created by Saurabh Bajaj on 14/02/20.
//  Copyright © 2020 Saurabh. All rights reserved.
//

import UIKit

class HomeView: UIView {

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
            cell.collapsedViewBottomConstraint.constant = cell.expandedView.frame.height
            cell.expandedView.isHidden = false
            cell.collapsedView.alpha = 0
            cell.isExpanded = true
        } else {
            cell.backgroundImageView.image = UIImage(named: "Group 51")
            cell.collapsedViewBottomConstraint.constant = 16
            cell.expandedView.isHidden = true
            cell.collapsedView.alpha = 1
            cell.isExpanded = false
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var indexPathsToReload = [indexPath]
        if indexPath == self.selectedIndexpath {
            selectedIndexpath = nil
        } else {
            // collapse previous expanded cell and set new value for selectedIndexpath.
            selectedIndexpath != nil ? indexPathsToReload.append(selectedIndexpath!) : nil
            self.selectedIndexpath = indexPath
        }
        tableView.reloadRows(at: indexPathsToReload, with: .automatic)
    }

}
