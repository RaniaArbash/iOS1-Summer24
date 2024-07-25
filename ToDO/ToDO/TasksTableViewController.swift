//
//  TasksTableViewController.swift
//  ToDO
//
//  Created by Rania Arbash on 2024-07-25.
//

import UIKit

class TasksTableViewController: UITableViewController, UISearchBarDelegate  {
    @IBOutlet weak var searchbar: UISearchBar!
    
    
    var allTasks = [ToDoTask]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadTable()
        searchbar.delegate = self
        

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  allTasks.count
    }

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            reloadTable()
        }else {
            allTasks = CoreDataManager.shared.getTasksBeginWith(text: searchText)
            tableView.reloadData()
        }
    }
    
    @IBAction func addNewTask(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add New Task", message: "", preferredStyle: .alert)
        
        var myTextField = UITextField()
        
        alert.addTextField { textField in
            textField.placeholder = "Enter the task here"
            myTextField = textField
        }

        
        let mylabel = UILabel(frame: CGRect(x: 30, y: 30, width: 70, height: 20))
        mylabel.text = "Urgent?"
        alert.view.addSubview(mylabel)
        
        
        let myswitch = UISwitch(frame: CGRect(x: 130, y: 30, width: 50, height: 20))
        alert.view.addSubview(myswitch)
            
        
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { action in
            
            if let goodtask = myTextField.text{
                if !goodtask.isEmpty{
                    CoreDataManager.shared.addNewTask(name: goodtask, isU: myswitch.isOn )
                    self.reloadTable()
                }
             
            }
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        //alert.size(forChildContentContainer: alert.self, withParentContainerSize: CGSize(width: 300, height: 300))
//
        present(alert, animated: true)
        
        
    }
    
    
    func reloadTable(){
        allTasks =  CoreDataManager.shared.getAllTasks()
        tableView.reloadData()
        
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.textColor =   allTasks[indexPath.row].isUrgent ? .red : .green
        
        cell.textLabel?.text = allTasks[indexPath.row].name
        
        

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "Update Your Task", message: "", preferredStyle: .alert)
        
        var myTextField = UITextField()
        
        alert.addTextField { textField in
           
            textField.text = self.allTasks[indexPath.row].name
            myTextField = textField
        }

        
        let mylabel = UILabel(frame: CGRect(x: 30, y: 30, width: 70, height: 20))
        mylabel.text = "Urgent?"
        alert.view.addSubview(mylabel)
        
        
        let myswitch = UISwitch(frame: CGRect(x: 130, y: 30, width: 50, height: 20))
        myswitch.isOn = self.allTasks[indexPath.row].isUrgent
        alert.view.addSubview(myswitch)
        
        
        alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { action in
            
            if let goodtask = myTextField.text{
                if !goodtask.isEmpty{
                    CoreDataManager.shared.updateATask(tobeUpdated: self.allTasks[indexPath.row] , updated_name: goodtask, updated_isU: myswitch.isOn )
                    self.reloadTable()
                }
             
            }
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        //alert.size(forChildContentContainer: alert.self, withParentContainerSize: CGSize(width: 300, height: 300))
//
        present(alert, animated: true)
    
        
        
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           
            let alert = UIAlertController(title: "Be Carefull!!", message: "Are you sure you want to delete this task ??? ", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { action in
                
                CoreDataManager.shared.deleteOneTask(tobeDeleted: self.allTasks[indexPath.row])
                self.reloadTable()
                
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
         
            
            present(alert, animated: true)
            
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
