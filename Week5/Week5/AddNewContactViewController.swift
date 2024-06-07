//
//  AddNewContactViewController.swift
//  Week5
//
//  Created by Rania Arbash on 2024-06-06.
//

import UIKit


protocol AddNewContactDelegateProtocol{
    func addingDidFinishCorrectly(name: String)
    func addingDidCancel()
}



class AddNewContactViewController: UIViewController {

    var delegate : AddNewContactDelegateProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print( (UIApplication.shared.delegate as? AppDelegate)?.numbers[2])
      
        // Do any additional setup after loading the view.
    }
    

    @IBAction func DoneClicked(_ sender: Any) {
        //
        delegate?.addingDidFinishCorrectly(name: "New Contact")
        dismiss(animated: true)
    }
    
    
    
    @IBAction func cancelClicked(_ sender: Any) {
        delegate?.addingDidCancel()
        dismiss(animated: true)
        
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
