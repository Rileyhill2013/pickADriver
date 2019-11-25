//
//  DisplayViewController.swift
//  pickADriver
//
//  Created by Riley Hill on 11/20/19.
//  Copyright © 2019 Riley Hill. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {
    
    @IBOutlet var nameLabels: [UILabel]!
    var period = String()
    var names = [String]()
    var timer = Timer()
    var cycle = Double()
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = period
    }
    

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! NamesTableViewController
        dvc.period = period
    }
    override func viewWillAppear(_ animated: Bool) {
        if let savedData = defaults.object(forKey: period) as? [String] {
            names = savedData
        }
        resetNames()
    }
    func resetTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: cycle, target: self, selector: #selector(updateDisplay), userInfo: nil, repeats: true)
    }
    
    @objc func updateDisplay() {
        resetTimer()
        var nameLabelIndices = [Int]()
        
    }
    
    @IBAction func onStartButtonTapped(_ sender: UIButton) {
        
    }
    func resetNames() {
        for i in 0..<min(names.count, nameLabels.count) {
            nameLabels[i].text = names[i]
            cycle = 2.0
        }
    }

}
