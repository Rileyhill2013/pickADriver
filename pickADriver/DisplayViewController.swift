//
//  DisplayViewController.swift
//  pickADriver
//
//  Created by Riley Hill on 11/20/19.
//  Copyright © 2019 Riley Hill. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {
    
    var period = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = period
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! NamesTableViewController
        dvc.period = period
    }
    

}
