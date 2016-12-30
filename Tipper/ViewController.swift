//
//  ViewController.swift
//  Tipper
//
//  Created by Madel Asistio on 12/12/16.
//  Copyright © 2016 Madel Asistio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipController: UISegmentedControl!
    
    var tipPercentages = [0.14, 0.16, 0.18, 0.20]
    let shiftDec = 0.01
    
    override func viewWillAppear(_ animated: Bool) {
        var counter = 0
        
        for percent in tipPercentages {
            tipController.setTitle(String(format: "%.0f%%", percent * 100), forSegmentAt: counter)
            
            counter += 1
            
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // maybe create a loop that checks the array!! if it's 0.0 or not
        // look at how to do persistence
        var counter = 0
        
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
    
    @IBAction func calculateTip(_ sender: AnyObject) {
    
        // need to fix percentage amount but otherwise is good
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipController.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format:"$%.02f", tip)
        totalLabel.text = String(format:"$%.02f",total)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "settingsSegue" {
            if let settingsVC = segue.destination as? SettingsViewController {
                settingsVC.percentages = tipPercentages
            }
        }
    }
    

    
    @IBAction func updateFromSettings (segue:UIStoryboardSegue) {
        
        let settingsVC = segue.source as! SettingsViewController
        tipPercentages[0] = (Double(settingsVC.bttn1Field.text!) ?? 0) * shiftDec
        tipPercentages[1] = (Double(settingsVC.bttn2Field.text!) ?? 0) * shiftDec
        tipPercentages[2] = (Double(settingsVC.bttn3Field.text!) ?? 0) * shiftDec
        tipPercentages[3] = (Double(settingsVC.bttn4Field.text!) ?? 0) * shiftDec

    }


   }

