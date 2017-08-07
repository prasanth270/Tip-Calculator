//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Prasanth Ramineni on 8/6/17.
//  Copyright © 2017 Prasanth Ramineni. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    
    @IBOutlet weak var inputMoney: UITextField!
    
    @IBOutlet weak var tipSegmentControll: UISegmentedControl!
    
    @IBOutlet weak var tipAmount: UILabel!
    
    @IBOutlet weak var totalAmount: UILabel!
    
    @IBOutlet weak var calculatedValuesView: UIView!
    
    let tipPercentageArray: Array = [0.1, 0.15, 0.20]
    
    var userDefaults: UserDefaults = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set Input to First Responder
        inputMoney.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tipSegmentControll.selectedSegmentIndex = userDefaults.integer(forKey: "defaultTip")
        updateValues()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    override func applicationFinishedRestoringState() {
        print(userDefaults.integer(forKey: "defaultTip"))
    }
    
    
    @IBAction func tipSegmentContollChanged(_ sender: UISegmentedControl) {
        
        // Hide the View before Calculations
        calculatedValuesView.isHidden = true
        
        userDefaults.set(tipSegmentControll.selectedSegmentIndex, forKey: "defaultTip")
        
        updateValues()
    }
    
    /*
    // Action for Text Feild
    */
    @IBAction func inputMoneyChanged(_ sender: Any) {
        print("Function Called")
        updateValues()
    }
    
    /*
    / Update the UI When the Bill amount is changed
    */
    func updateValues() {
        
        if(calculatedValuesView.isHidden) {
            calculatedValuesView.isHidden = false
        }
        
        
        
        if let text = inputMoney.text, !text.isEmpty {
            let billAmount: Float = Float(inputMoney.text!)!
            let tipPercentage:Float = Float(tipPercentageArray[tipSegmentControll.selectedSegmentIndex])
            
            let calculatedTip = billAmount * tipPercentage
            let calculatedTotal = billAmount + calculatedTip
            
            self.tipAmount.text = String(calculatedTip)
            self.totalAmount.text = String(calculatedTotal)
        } else {
            calculatedValuesView.isHidden = true
        }
        
//        guard let text = inputMoney.text, !text.isEmpty else {
//            billAmount = 0.0
//            return
//        }
        
        
    }


}

