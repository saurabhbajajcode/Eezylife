//
//  EZCalendarViewController.swift
//  Eezylife Calendar
//
//  Created by Saurabh Bajaj on 14/02/20.
//  Copyright © 2020 Saurabh. All rights reserved.
//

import UIKit

class EZCalendarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension EZCalendarViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalenderCell", for: indexPath) as! CalenderCollectionViewCell
        cell.dateLabel.text = "\(indexPath.row+1)"
        cell.weekdayLabel.text = "M"
        return cell
    }

}
