//
//  ViewController.swift
//  Tipper
//
//  Created by Jie-Anne Asistio on 12/12/16.
//  Copyright © 2016 Jie-Anne Asistio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let formatter = NumberFormatter()
    let defaults = UserDefaults.standard

    // label that shows the tip
    @IBOutlet weak var tipLabel: UILabel!
    
    // label that shows the total
    @IBOutlet weak var totalLabel: UILabel!
    
    // field where user types in bill amount
    @IBOutlet weak var billField: UITextField!
    
    // tip segments
    @IBOutlet weak var tipController: UISegmentedControl!
    
    // array of tip percentages
    var tipPercentages = [0.14, 0.16, 0.18, 0.20]
    
    // shifts the decimal value to change to
    // the proper type for display
    let shiftDec = 0.01
    
    // changes the button labels to proper values
    // on the segment control every time it appears
    override func viewWillAppear(_ animated: Bool) {
        
        // makes it so that the keypad is visible from the start
        billField.becomeFirstResponder()

        var defVals = [0.14, 0.16, 0.18, 0.20]
        var index = 0
        
        // loops through the tip array and changes the segment control labels to settings
        while (index < 4) {
            
            if defaults.double(forKey: "bttn\(index + 1)") == 0 {
                tipPercentages[index] = defVals[index]
            } else {
                tipPercentages[index] = defaults.double(forKey: "bttn\(index + 1)")
            }
            
            tipController.setTitle(String(format: "%.0f%%", tipPercentages[index] * 100), forSegmentAt: index)
            
            index += 1
            
        }
        
        self.calculateTip(UIButton())

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var counter = 0
        
        // loops through the tip percentages array to load the correct numbers
        for percent in tipPercentages {
            tipController.setTitle(String(format: "%.0f%%", percent * 100), forSegmentAt: counter)
            
            counter += 1

        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func OnTap(_ sender: AnyObject) {
        
        // gets rid of the keyboard on tap
        view.endEditing(true)
    }
    
    // function calculates tip
    @IBAction func calculateTip(_ sender: AnyObject) {
    
        // calculates the tip and total using the tip percentages array and the input bill
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipController.selectedSegmentIndex]
        let total = bill + tip
        
        let formatted = chgFormat (tipVal: tip, totalVal: total)
        
        // puts the correct value on the tip and total labels
        tipLabel.text = formatted.tipFormatted
        totalLabel.text = formatted.totalFormatted
    }
    
    func chgFormat (tipVal: Double, totalVal: Double) -> (tipFormatted: String, totalFormatted: String) {
 
        let tip = tipVal as NSNumber
        let total = totalVal as NSNumber
    
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: defaults.string(forKey: "updatedRegion") ?? "United States")
        return (formatter.string(from: tip)!, formatter.string(from:total)!)
    }
    
    // inputs the settings view controller with the values from the tip percentages 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "settingVCSeg" {
                
                defaults.set(defaults.string(forKey: "updatedRegion") ?? "en_US", forKey: "region")
            
                defaults.set(defaults.integer(forKey: "updateCheck"), forKey: "lastChecked")
            
                defaults.synchronize()

        }
    }
}

