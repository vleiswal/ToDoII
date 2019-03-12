//
//  CatagoryViewController.swift
//  ToDoII
//
//  Created by Vleis Walker on 2019/03/07.
//  Copyright © 2019 vleiswal. All rights reserved.
//

import UIKit
import RealmSwift

class CatagoryViewController: UITableViewController {
    
    let realm = try! Realm()
    
    var catagoryArray : Results<Category>?
    
   // let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    override func viewDidLoad() {
        super.viewDidLoad()

        loadCatagories()
        
    }
    
    
    //MARK: - Tableview Data Sources Methodes
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catagoryArray?.count ?? 1
    }
    
      //MARK: - TableView Delegate Methodes
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCatagory = catagoryArray?[indexPath.row]
            
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatagoryCell", for: indexPath)
        
       // let catagory = catagoryArray[indexPath.row]
        cell.textLabel?.text = catagoryArray?[indexPath.row].name ?? "No catagories added yet"
        
        return cell
    }
    

    //MARK: - Data Manipulation Methodes
    
    func loadCatagories() {
        
        catagoryArray = realm.objects(Category.self)
        
         tableView.reloadData()
        

    }
    
    func save(category: Category){
        do {
            
            try realm.write {
                realm.add(category)
            }
            
        } catch {
            print ("Error saving realm, \(error)")
        }
        
        tableView.reloadData()
        
    }
    
    //MARK: - Add new Catagories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
     
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Catagory", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Catagory", style: .default) { (action) in
            //once add button is clicked
            //print("Add item clicked")
            
            
            let newCatagory = Category()
            
            newCatagory.name = textField.text!
            
            self.save(category: newCatagory)
            
            
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new catagory"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
}
    
    

    
   

