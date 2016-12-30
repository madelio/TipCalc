//
//  ViewController.swift
//  Tipper
//
//  Created by Jie-Anne Asistio on 12/12/16.
//  Copyright © 2016 Jie-Anne Asistio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
        
        var counter = 0
        
        // loops through the tip array and changes the segment control labels to settings
        for percent in tipPercentages {
            tipController.setTitle(String(format: "%.0f%%", percent * 100), forSegmentAt: counter)
            
            counter += 1
            
        }
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
        
        // puts the correct value on the tip and total labels
        tipLabel.text = String(format:"$%.02f", tip)
        totalLabel.text = String(format:"$%.02f",total)
    }
    
    // inputs the settings view controller with the values from the tip percentages
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "settingsSegue" {
            if let settingsVC = segue.destination as? SettingsViewController {
                settingsVC.percentages = tipPercentages
            }
        }
    }
    
    // changes the values depending on user input in settings
    @IBAction func updateFromSettings (segue:UIStoryboardSegue) {
        
        // instantiates the settings view controller
        let settingsVC = segue.source as! SettingsViewController
        
        // changes the tip percentages depending on the value of the button fields
        tipPercentages[0] = (Double(settingsVC.bttn1Field.text!) ?? 0) * shiftDec
        tipPercentages[1] = (Double(settingsVC.bttn2Field.text!) ?? 0) * shiftDec
        tipPercentages[2] = (Double(settingsVC.bttn3Field.text!) ?? 0) * shiftDec
        tipPercentages[3] = (Double(settingsVC.bttn4Field.text!) ?? 0) * shiftDec

    }
   }

