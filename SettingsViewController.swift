//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Jie-Anne Asistio on 12/18/16.
//  Copyright © 2016 Jie-Anne Asistio. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    // button fields that hold the value for each segment control button in the main view controller
    @IBOutlet weak var bttn1Field: UITextField!
    @IBOutlet weak var bttn2Field: UITextField!
    @IBOutlet weak var bttn3Field: UITextField!
    @IBOutlet weak var bttn4Field: UITextField!
    
    // array that stores the value from main view controller to record changes
    var percentages = [0.0, 0.0, 0.0, 0.0]
    
    // converts to the right format to display
    let multBy = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // changes the value of the numbers inside the text field depending on the current values of tip percentages
    override func viewWillAppear(_ animated: Bool) {
        bttn1Field.text = String (format: "%.0f", percentages[0] * multBy)
        bttn2Field.text = String (format: "%.0f", percentages[1] * multBy)
        bttn3Field.text = String (format: "%.0f", percentages[2] * multBy)
        bttn4Field.text = String (format: "%.0f", percentages[3] * multBy)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be rcreated.
    }
}
