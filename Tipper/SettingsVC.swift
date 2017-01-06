//
//  SettingsVC.swift
//  Tipper
//
//  Created by Madel Asistio on 1/1/17.
//  Copyright © 2017 Madel Asistio. All rights reserved.
//

import UIKit

class SettingsVC: UITableViewController {
    
    let defaults = UserDefaults.standard
    let shiftDecBack = 0.01
    let shiftDecFwd: Double = 100
    
    @IBOutlet weak var regionLabel: UILabel!
    
    @IBOutlet weak var bttn1: UITextField!
    
    @IBOutlet weak var bttn2: UITextField!
    
    @IBOutlet weak var bttn3: UITextField!
    
    @IBOutlet weak var bttn4: UITextField!
    
    let numberOfRowsAtSection: [Int] = [1, 4, 1]
    
    let defVals = [0.14, 0.16, 0.18, 0.20]
    
    override func viewWillAppear(_ animated: Bool) {
        
        let buttons = [bttn1, bttn2, bttn3, bttn4]
        
        var index = 0
        
        while (index < 4) {
            if defaults.double(forKey: "bttn\(index + 1)") == 0 {
                buttons[index]?.text = String (format: "%.0f",defVals[index] * shiftDecFwd)
                
            } else {
                
                buttons[index]?.text = String (format: "%.0f", (defaults.double(forKey: "bttn\(index + 1)")) * shiftDecFwd)
            }
            
            index += 1
        }
        
        regionLabel.text = defaults.string(forKey: "region") ?? "United States"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SettingsVC.hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        tableView.addGestureRecognizer(tapGesture)

        // Uncomment the following line to preserve selection between presentations
        //self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var rows = 0
        if section < numberOfRowsAtSection.count {
            rows = numberOfRowsAtSection[section]
        }
        
        return rows
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let row = indexPath.row
        let section = indexPath.section
        
        if section == 1 {
            
            switch row {
            
            case 0: bttn1.becomeFirstResponder()
            case 1: bttn2.becomeFirstResponder()
            case 2: bttn3.becomeFirstResponder()
            case 3: bttn4.becomeFirstResponder()
            
            default: break
         
            }
            
        } else if section == 2 {
            self.resetDefaults(Any.self)
            
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func resetDefaults(_ sender: Any) {
        
        let buttons = [bttn1, bttn2, bttn3, bttn4]
        
        for index in 0...3 {
            defaults.set(defVals[index], forKey: "bttn\(index)")
            buttons[index]?.text = String (format: "%.0f",defVals[index] * shiftDecFwd)
        }

        defaults.synchronize()
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)

        // Configure the cell...
       // cell.selectionStyle = .none // to not gray out?

        return cell
    }*/
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func hideKeyboard() {
        tableView.endEditing(true)
    }

    @IBAction func saveChanges(_ sender: Any) {
        
        let buttons = [bttn1, bttn2, bttn3, bttn4]
        
        for index in 0...3 {
            defaults.set((Double ((buttons[index]?.text!)!) ?? 0) * shiftDecBack, forKey: "bttn\(index+1)")
        }
            defaults.synchronize()
        
        _ = self.navigationController?.popViewController(animated: true)
    }
   }
