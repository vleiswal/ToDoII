//
//  ViewController.swift
//  ToDoII
//
//  Created by Vleis Walker on 2019/02/26.
//  Copyright © 2019 vleiswal. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
   var itemArray = [Item]()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem1 = Item()
        newItem1.title = "Buy Bread"
        itemArray.append(newItem1)

        let newItem2 = Item()
        newItem2.title = "Buy Milk"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Get kids"
        itemArray.append(newItem3)
        
        let newItem4 = Item()
        newItem4.title = "Save the world"
        itemArray.append(newItem4)
     
        
        
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }
    }
    
    //MARK - Tableview Datasource Methodes
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item  = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
       
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        //print(itemArray[indexPath.row])
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new ToDo Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //once add button is clicked
            //print("Add item clicked")
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
            
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}


