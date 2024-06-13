//
//  AddNewContactViewController.swift
//  Week5
//
//  Created by Rania Arbash on 2024-06-06.
//

import UIKit


protocol AddNewContactDelegateProtocol{
    func addingDidFinishCorrectly(newContact : Contact)
    func addingDidCancel()
}



class AddNewContactViewController: UIViewController  {

    @IBOutlet weak var numberText: UITextField!
    
    @IBOutlet weak var nameText: UITextField!
    
    
    @IBOutlet weak var genderSwitch: UISwitch!
    
    
    
    var sender = ""
    
    var delegate : AddNewContactDelegateProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       if sender == "Adding"
        {
            
            
        }
        else if sender == "Editing"{
            
            
        }
        // Do any additional setup after loading the view.
    }
    

    @IBAction func DoneClicked(_ sender: Any) {
        if let name = nameText.text {
            if  !name.isEmpty {
                if let phoneNumber = numberText.text {
                    if  !phoneNumber.isEmpty {
                        
                        var newContact = Contact(name: name, gender:genderSwitch.isOn , phoneNumber: phoneNumber)
                        
                        delegate?.addingDidFinishCorrectly(newContact: newContact)
                        dismiss(animated: true)
                        
                    }
                }
                
            }
        }
        
        
       
    }
    
    
    
    @IBAction func cancelClicked(_ sender: Any) {
                
        guard let goodName = nameText.text , let goodNumber = numberText.text else  {
                return
            }
        
       // var valid =
        
        guard !goodName.isEmpty || !goodNumber.isEmpty  else{
            delegate?.addingDidCancel()
            dismiss(animated: true)
            return
        }
        
        // here if there is any text in one of them
        
        var alert = UIAlertController(title: "Are you sure you want to discard the new contact ? ", message: "", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Discard Changes", style: .destructive, handler: { action in
            
            self.delegate?.addingDidCancel()
            self.dismiss(animated: true)
            
        }))
        
        alert.addAction(UIAlertAction(title: "Keep Editing", style: .cancel))
        
        present(alert, animated: true)
        
        
        
        
        
        
       
        
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
