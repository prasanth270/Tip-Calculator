//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Prasanth Ramineni on 8/6/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var toggleThemeSwitch: UISwitch!
    
    @IBOutlet weak var segmentController: UISegmentedControl!
    
    var userDefaults: UserDefaults = UserDefaults.standard
    
    var colorArray: [UIColor] = [UIColor(red: 216/255, green: 247/255, blue: 255/255, alpha: 1),
                                 UIColor(red: 216/255, green: 247/255, blue: 0/255, alpha: 1)]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if userDefaults.bool(forKey: "switchState") {
            toggleThemeSwitch.isOn = true
        } else {
            toggleThemeSwitch.isOn = false
        }
        
        self.view.backgroundColor = colorArray[userDefaults.integer(forKey: "changeTheme")]
        
        segmentController.selectedSegmentIndex = userDefaults.integer(forKey: "defaultTip")
    }
    
    @IBAction func segmentControllerChanged(_ sender: UISegmentedControl) {
        
        userDefaults.setValue(segmentController.selectedSegmentIndex, forKey: "defaultTip")
        
    }
    
    @IBAction func toggleTheme(_ sender: UISwitch) {
        if toggleThemeSwitch.isOn {
            self.view.backgroundColor = colorArray[1]
            userDefaults.setValue(1, forKey: "changeTheme")
            userDefaults.setValue(true, forKey: "switchState")
        } else {
            self.view.backgroundColor = colorArray[0]
            userDefaults.setValue(0, forKey: "changeTheme")
            userDefaults.setValue(false, forKey: "switchState")
        }
    }
    
}
