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
    
    var colorArray: [UIColor] = [UIColor(red: 216/255, green: 247/255, blue: 255/255, alpha: 1),
                                 UIColor(red: 216/255, green: 247/255, blue: 0/255, alpha: 1)]

    override func viewDidLoad() {
        super.viewDidLoad()
    
        //Set Input to First Responder
        inputMoney.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let color: Int = userDefaults.integer(forKey: "changeTheme")
    
        self.view.backgroundColor = colorArray[color]
        
        if color == 1 {
            self.calculatedValuesView.backgroundColor = UIColor(red: 200/255, green: 247/255, blue: 100/255, alpha: 1)
        } else {
            self.calculatedValuesView.backgroundColor = UIColor(red: 200/255, green: 247/255, blue: 255/255, alpha: 1)
        }
        
        tipSegmentControll.selectedSegmentIndex = userDefaults.integer(forKey: "defaultTip")
        updateValues()
    }
    
    @IBAction func tipSegmentContollChanged(_ sender: UISegmentedControl) {
        
        // Hide the View before Calculations
        calculatedValuesView.alpha = 0
        
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
        
        if calculatedValuesView.alpha == 0  {
            //calculatedValuesView.alpha = 1
            
            UIView.animate(withDuration: 0.4, animations: { 
                self.calculatedValuesView.alpha = 1
            })
        }
        
        if let text = inputMoney.text, !text.isEmpty {
            
            let billAmount: Float = Float(inputMoney.text!)!
            let tipPercentage:Float = Float(tipPercentageArray[tipSegmentControll.selectedSegmentIndex])
            
            let calculatedTip = billAmount * tipPercentage
            let calculatedTotal = billAmount + calculatedTip
            
            self.tipAmount.text = String(calculatedTip)
            self.totalAmount.text = String(calculatedTotal)
            
        } else {
            
            self.calculatedValuesView.alpha = 0
        }
        
    }
}

