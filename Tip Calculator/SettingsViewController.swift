//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Prasanth Ramineni on 8/6/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var segmentController: UISegmentedControl!
    
    var userDefaults: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        segmentController.selectedSegmentIndex = userDefaults.integer(forKey: "defaultTip")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func segmentControllerChanged(_ sender: UISegmentedControl) {
        
        userDefaults.setValue(segmentController.selectedSegmentIndex, forKey: "defaultTip")
        
    }

}
