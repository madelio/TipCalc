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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        
        let tipPercentages = [0.14, 0.16, 0.18, 0.20]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipController.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format:"$%.02f", tip)
        totalLabel.text = String(format:"$%.02f",total)
        
    }

   }

