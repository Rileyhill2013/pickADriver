//
//  PeriodViewController.swift
//  pickADriver
//
//  Created by Mason  Alexander Johnson  on 11/13/19.
//  Copyright © 2019 Riley Hill. All rights reserved.
//

import UIKit

class PeriodViewController: UIViewController {
    
    var period = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    @IBAction func onPeriodButtonTapped(_ sender: UIButton) {
        period = (sender.titleLabel?.text)!
        performSegue(withIdentifier: "PeriodToNameSegue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let dvc = segue.destination as! NamesTableViewController
        dvc.period = period
    }
    

}
