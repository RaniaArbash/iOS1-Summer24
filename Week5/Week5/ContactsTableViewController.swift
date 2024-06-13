//
//  ContactsTableViewController.swift
//  Week5
//
//  Created by Rania Arbash on 2024-06-06.
//

import UIKit

class ContactsTableViewController: UITableViewController, AddNewContactDelegateProtocol , UISearchBarDelegate  {
    
    
    @IBOutlet weak var searchbar: UISearchBar!
        

    
    var contactList = (UIApplication.shared.delegate as? AppDelegate)?.ContactList

    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchbar.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toadd"{
            let addingVC = segue.destination as? AddNewContactViewController
            addingVC?.delegate = self
            addingVC?.sender = "Adding"
        }else {
            
            let viewingVC = segue.destination as? EditingViewController
            viewingVC?.selectedContactIndex = tableView.indexPathForSelectedRow!.row
        }
        
        
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList!.count
    }

    
    
 
     func addingDidFinishCorrectly(newContact : Contact){
        (UIApplication.shared.delegate as? AppDelegate)?.ContactList.append(newContact)
        
        contactList = (UIApplication.shared.delegate as? AppDelegate)?.ContactList
        
        tableView.reloadData()
    }
    
      func addingDidCancel() {
       
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = contactList![indexPath.row].name
      
        cell.detailTextLabel?.text = contactList![indexPath.row].phoneNumber
       cell.imageView?.image =  contactList![indexPath.row].gender ? UIImage(named: "female") : UIImage(named: "male")

    
        return cell
    }
    

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
    
        
        
        if searchText.count > 0 {
            var newList = contactList?.filter({ contact in
                return  contact.name.localizedCaseInsensitiveContains(searchText)
            })
            
            
             contactList = newList
            tableView.reloadData()
        }else {
            contactList = (UIApplication.shared.delegate as? AppDelegate)?.ContactList
            tableView.reloadData()
        }
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
