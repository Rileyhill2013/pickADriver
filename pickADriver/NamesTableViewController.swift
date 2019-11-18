//
//  NamesTableViewController.swift
//  pickADriver
//
//  Created by Riley Hill on 11/12/19.
//  Copyright © 2019 Riley Hill. All rights reserved.
//

import UIKit

class NamesTableViewController: UITableViewController {

  //  var names = ["Riley", "Mason", "Jaylin", "Josh", "Gerardo", "David", "Fitzer", "Kelvin"]
    var period = String()
    var names = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isEditing = true
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    
    @IBAction func onPlusButtonTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add A Name", message: "Test", preferredStyle: .alert)
        alert.addTextField { (textfield) in
            textfield.placeholder = "name"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        let appendAction = UIAlertAction(title: "OK", style: .default) {
            (action) in
            let nameTextField = alert.textFields![0] as UITextField
            let name = nameTextField.text!
            self.names.append(name)
            self.tableView.reloadData()
        }
        alert.addAction(appendAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
             self.names.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let nameToMove =  names.remove(at: fromIndexPath.row)
        names.insert(nameToMove, at: to.row)

    }
   

   
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    func loadTestNames(){
        switch period {
        case "1st":
            names = ["William","Theodore", "John"]
        case "2nd":
            names = ["Tu'laasti","Draco", "Lissa"]
        case "3rd":
            names = ["Angus","Alpur(t)", "Axel", "Aladr", "Leggias" ]
        case "4th":
            names = ["Varis", "Xanaya", "Snuz", "Evolac"]
        case "5th":
            names = ["Spongebob", "Patrick", "Squidward"]
        case "6th":
            names = ["A", "B", "C"]
        case "7th":
            names = ["Shrek","Donkey", "Fiona", "Gingy" ]
        case "8th":
            names = ["I ran out of ideas"]
        default:
            names = ["I really did"]
        }
        
    }
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
