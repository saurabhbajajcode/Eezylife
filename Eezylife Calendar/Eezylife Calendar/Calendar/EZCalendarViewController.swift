//
//  EZCalendarViewController.swift
//  Eezylife Calendar
//
//  Created by Saurabh Bajaj on 14/02/20.
//  Copyright © 2020 Saurabh. All rights reserved.
//

import UIKit

class EZCalendarViewController: UIViewController {

    fileprivate lazy var weekdaySymbols: [String] = {
        var symbols = Calendar.current.weekdaySymbols.map { return String($0.first!) }
        return symbols.shiftRight(amount: Calendar.current.firstWeekday)
    }()

    fileprivate lazy var totalDays: Int = numberOfDaysInMonth(month: currentMonth)
    fileprivate var currentMonth = Calendar.current.component(.month, from: Date())

    fileprivate var selectedIndex: Int = 0

    @IBOutlet weak var collectionView: UICollectionView!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollToCurrentDay()
    }

    // MARK: Helpers
    fileprivate func scrollToCurrentDay() {
        let index = Calendar.current.component(.day, from: Date())
        self.selectedIndex = index-1
        let indexPath = IndexPath(row: index, section: 0)
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
        updateCollectionViewOffset()
    }

    /// Sets collection view's content offset such a way that selected date is visible along with other days of the same week.
    fileprivate func updateCollectionViewOffset() {
        let pagesToOffset =  CGFloat(selectedIndex/7)
        let offset = pagesToOffset * collectionView.frame.width
        collectionView.setContentOffset(CGPoint(x: offset, y: 0), animated: false)
    }

    fileprivate func numberOfDaysInMonth(month: Int) -> Int {
        var dateComponents = DateComponents()
        dateComponents.year = Calendar.current.component(.year, from: Date())
        dateComponents.month = month
        // Set day as more than 1 to avoid timezone issues.
        dateComponents.day = 2
        let date = Calendar.current.date(from: dateComponents)!
        return Calendar.current.range(of: .day, in: .month, for: date)?.count ?? 30
    }
}

extension EZCalendarViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalDays
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalenderCell", for: indexPath) as! CalenderCollectionViewCell
        cell.dateLabel.text = "\(indexPath.row+1)"
        cell.weekdayLabel.text = weekdaySymbols[indexPath.row%7]
        if indexPath.row == selectedIndex {
            // make cell as selected
            cell.isSelected = true
        } else {
            // show cell as deselected
            cell.isSelected = false
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int((collectionView.contentOffset.x / collectionView.frame.width)+1)
        if selectedIndex < currentPage*7 {
            selectedIndex += 7
        } else {
            selectedIndex -= 7
        }
        let indexPath = IndexPath(row: selectedIndex, section: 0)
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .left)
        updateCollectionViewOffset()
    }
}
