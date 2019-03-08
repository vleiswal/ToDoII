//
//  CatagoryViewController.swift
//  ToDoII
//
//  Created by Vleis Walker on 2019/03/07.
//  Copyright © 2019 vleiswal. All rights reserved.
//

import UIKit
import CoreData

class CatagoryViewController: UITableViewController {
    
    var catagoryArray = [Catagory]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    override func viewDidLoad() {
        super.viewDidLoad()

        loadCatagories()
        
    }
    
    
    //MARK: - Tableview Data Sources Methodes
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catagoryArray.count
    }
    
      //MARK: - TableView Delegate Methodes
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCatagory = catagoryArray[indexPath.row]
            
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatagoryCell", for: indexPath)
        
        let catagory = catagoryArray[indexPath.row]
        cell.textLabel?.text = catagory.name
        
        return cell
    }
    

    //MARK: - Data Manipulation Methodes
    
    func loadCatagories(with request: NSFetchRequest<Catagory> = Catagory.fetchRequest()) {
        
        // print("Load \(request)")
        
        do {
            catagoryArray = try context.fetch(request)
        } catch {
            print ("Error Reading context, \(error)")
        }
        tableView.reloadData()
    }
    
    func saveCatagories(){
        do {
            
            try context.save()
            
        } catch {
            print ("Error saving context, \(error)")
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
            
            
            let newCatagory = Catagory(context: self.context)
            
            newCatagory.name = textField.text!
           
            self.catagoryArray.append(newCatagory)
            
            self.saveCatagories()
            
            
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new catagory"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
}
    
    

    
   

