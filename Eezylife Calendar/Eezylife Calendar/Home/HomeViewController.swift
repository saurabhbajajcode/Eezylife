//
//  ViewController.swift
//  Eezylife Calendar
//
//  Created by Saurabh Bajaj on 13/02/20.
//  Copyright © 2020 Saurabh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var homeView: HomeView!

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupCalendarView()
    }

    fileprivate func setupCalendarView() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "EZCalendarScene")
        self.addChild(vc)
        let vcView = vc.view!
        var frame = vcView.frame
        frame.size.height = 149
        vcView.frame = frame
        homeView.tableView.tableHeaderView = vcView
        homeView.layoutIfNeeded()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if #available(iOS 13, *)
        {
            let statusBar = UIView(frame: (UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame)!)
            statusBar.backgroundColor = UIColor.black
            UIApplication.shared.keyWindow?.addSubview(statusBar)
        }
    }
}
