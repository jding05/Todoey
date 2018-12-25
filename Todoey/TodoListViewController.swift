//
//  ViewController.swift
//  Todoey
//
//  Created by Jeff Ding on 12/24/18.
//  Copyright © 2018 Jeff Ding. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["LIfe", "School", "Job", "Interview", "Learning"]
    
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
//        print("\(indexPath.row)" + " \(itemArray[indexPath.row])")

        // to grab a reference to the cell thaqt is at a particular indexPath
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        // to cancel the checkmark, when you click again (second times) on the selected cell
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
           tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        // to cancel the gray highlighting effect
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

