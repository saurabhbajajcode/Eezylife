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

    override func awakeFromNib() {
        super.awakeFromNib()

        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "EZCalendarScene")
        let vcView = vc.view!
        var frame = vcView.frame
        frame.size.height = 149
        vcView.frame = frame
        self.tableView.tableHeaderView = vcView
        self.layoutIfNeeded()
    }

}


extension HomeView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
}
