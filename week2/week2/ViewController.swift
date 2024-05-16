//
//  ViewController.swift
//  week2
//
//  Created by Rania Arbash on 2024-05-16.
//

import UIKit

class ViewController: UIViewController {

    // UI variable
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var numberText: UITextField!
    
    
    @IBOutlet weak var changeValue: UITextField!
    
    
    // developer varialbe
    var number : Int = 0
    var thechange : Int = 0
    
    // lifesycle function
    override func viewDidLoad() {
        super.viewDidLoad()
        print("In view did load")
        myLabel.text = "The number is \(number)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("In view will appear")
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("In view will disappear")
        
    }
    override func viewDidAppear(_ animated: Bool) {
        print("In view did appear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("In view did disappear")

    }

    
    // UI event function
    @IBAction func addOneCLicked(_ sender: Any) {
        let firstResult = validateTextField(textValue: numberText.text)
        
        if firstResult.0 {
            number = firstResult.1
            let secondResult = validateTextField(textValue: changeValue.text)
            if secondResult.0{
                thechange = secondResult.1
                myLabel.textColor = UIColor.black
                myLabel.text = "The number is \(number + thechange )"

            }else {
                myLabel.textColor = UIColor.red
                myLabel.text = "There are some errors in the input"
            }
            
        }else {
            myLabel.textColor = UIColor.red
            myLabel.text = "There are some errors in the input"

        }
        
        
       
    }
    
    
    
    
    @IBAction func subOneCLicked(_ sender: Any) {
        let firstResult = validateTextField(textValue: numberText.text)
        
        if firstResult.0 {
            number = firstResult.1
            let secondResult = validateTextField(textValue: changeValue.text)
            if secondResult.0{
                thechange = secondResult.1
                myLabel.text = "The number is \(number - thechange )"

            }else {
                myLabel.text = "There are some errors in the input"
            }
            
        }else {
            myLabel.text = "There are some errors in the input"

        }
      
        
    }
    
    
    // developer function
    // Tuple
    func validateTextField(textValue : String?) -> (Bool,Int){
        var result : (Bool,Int) = (false , 0)
        
        if let goodNumber = textValue {
            if !goodNumber.isEmpty {
                // cast the value to int
                var userNumber: Int? = Int(goodNumber)
                if let goodValueFromTheUser = userNumber{
                    result.0 = true
                    result.1 = goodValueFromTheUser
                   
                }
                
            }
            
        }
        return result
        
    }
    

}

