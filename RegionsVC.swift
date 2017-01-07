//
//  RegionsVC.swift
//  Tipper
//
//  Created by Madel Asistio on 1/5/17.
//  Copyright © 2017 Madel Asistio. All rights reserved.
//

import UIKit

class RegionsVC: UITableViewController {
    
    let defaults = UserDefaults.standard
    
    var lastSelected: IndexPath = [0,0]
    
    var initIndPath: IndexPath = [0,0]

    let regionType = ["en_US", "en_CA", "en_GB", "en_AU", "fr_FR", "ja_JP", "zh", "fil"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.reloadData()

        initIndPath = [0, defaults.integer(forKey: "lastChecked")]
        
        tableView.cellForRow(at: initIndPath)?.accessoryType = .checkmark
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return regionType.count
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {


        if initIndPath != indexPath {
            tableView.cellForRow(at: initIndPath)?.accessoryType = .none
        }
        
        if lastSelected != indexPath {
            tableView.cellForRow(at: lastSelected)?.accessoryType = .none

        }
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        defaults.set(indexPath.row, forKey: "lastChecked")
        
        return indexPath
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        lastSelected = indexPath
        
        let row = indexPath.row
        defaults.set(regionType[row], forKey: "region")
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
