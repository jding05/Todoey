//
//  ViewController.swift
//  Todoey
//
//  Created by Jeff Ding on 12/24/18.
//  Copyright © 2018 Jeff Ding. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["LIfe", "School", "Job", "Interview", "Learning"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK - Tableview DataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // to grab a reference to the cell thaqt is at a particular indexPath
        //tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
           tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        // to cancel the gray highlighting effect
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        // this action will be the button are you gonna press once you done with writing your new to do list item
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // What will happen once the user clicks the Add Item button on our UIAlert
            if textField.text != nil {
                self.itemArray.append(textField.text!)
                // it doesn't update the list, so we need to reload data
                self.tableView.reloadData()
            }
        }
        
        // add textfield in our alert (trigger when alert pop up)
        alert.addTextField { (alertTextField) in
            // set up alert textfield, this is the string that's going to show in gray, and will disappear when the user clicks on that textfield
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        // add action to our alert
        alert.addAction(action)
        
        // show our alert
        present(alert, animated: true, completion: nil)
    }
    
}

