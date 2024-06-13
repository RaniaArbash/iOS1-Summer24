//
//  EditingViewController.swift
//  Week5
//
//  Created by Rania Arbash on 2024-06-13.
//

import UIKit

class EditingViewController: UIViewController , AddNewContactDelegateProtocol {
   
    var selectedContactIndex = -1

    var selectedContact : Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedContact = (UIApplication.shared.delegate as? AppDelegate)?.ContactList[selectedContactIndex]
        
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var editingVC = segue.destination as? AddNewContactViewController
        editingVC!.delegate = self
        editingVC!.sender = "Editing"
        
        
        
    }

    
    func addingDidFinishCorrectly(newContact: Contact) {
        
    }
    
    func addingDidCancel() {
        
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
