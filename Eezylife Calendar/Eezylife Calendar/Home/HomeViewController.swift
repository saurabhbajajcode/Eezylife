//
//  ViewController.swift
//  Eezylife Calendar
//
//  Created by Saurabh Bajaj on 13/02/20.
//  Copyright © 2020 Saurabh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
