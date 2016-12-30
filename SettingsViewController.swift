//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Madel Asistio on 12/18/16.
//  Copyright © 2016 Madel Asistio. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var bttn1Field: UITextField!
    @IBOutlet weak var bttn2Field: UITextField!
    @IBOutlet weak var bttn3Field: UITextField!
    @IBOutlet weak var bttn4Field: UITextField!
    
    var percentages = [0.0, 0.0, 0.0, 0.0]
    let multBy = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
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
    
    /*
    @IBAction func updatePercentage(_ sender: Any) {
        let main = self.storyboard?.instantiateViewController(withIdentifier: "mainVC") as! ViewController
        main.tipPercentages[0] = (Double(bttn1Field.text!) ?? 0) * shiftDec
        main.tipPercentages[1] = (Double(bttn2Field.text!) ?? 0) * shiftDec
        main.tipPercentages[2] = (Double(bttn3Field.text!) ?? 0) * shiftDec
        main.tipPercentages[3] = (Double(bttn4Field.text!) ?? 0) * shiftDec
        
        
        self.present(main, animated: true, completion: nil)
    } */
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let main: ViewController = segue.destination as! ViewController
        
        main.tipPercentages[0] = (Double(bttn1Field.text!) ?? 0) * shiftDec
        main.tipPercentages[1] = (Double(bttn2Field.text!) ?? 0) * shiftDec
        main.tipPercentages[2] = (Double(bttn3Field.text!) ?? 0) * shiftDec
        main.tipPercentages[3] = (Double(bttn4Field.text!) ?? 0) * shiftDec
        
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    } */

}
