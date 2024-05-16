//
//  ViewController.swift
//  week2
//
//  Created by Rania Arbash on 2024-05-16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var one: UIButton!
    
    
    
    
    @IBOutlet weak var two: UIButton!
    
    
    @IBOutlet weak var opImage: UIImageView!
    
    // UI variable
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var numberText: UITextField!
    
    
    @IBOutlet weak var changeValue: UITextField!
    
    var light_mode = true
    
    // developer varialbe
    var number : Int = 0
    var thechange : Int = 0
    
    // lifesycle function
    override func viewDidLoad() {
        super.viewDidLoad()
        print("In view did load")
        myLabel.text = "The number is \(number)"
        opImage.image = UIImage(named: "main.png")
        self.view.backgroundColor = UIColor.white
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

    func doMath (op:String ){
        let firstResult = validateTextField(textValue: numberText.text)
        
        if firstResult.0 {
            number = firstResult.1
            let secondResult = validateTextField(textValue: changeValue.text)
            if secondResult.0{
                thechange = secondResult.1
                myLabel.textColor = UIColor.black
                var result = 0
                switch op {
                case "+":
                  result = number + thechange
                    opImage.image = UIImage(named: "add")
                    break
                case "-":
                    opImage.image = UIImage(named: "sub")
                  result = number - thechange
                    break
                case "*":
                    opImage.image = UIImage(named: "times")
                  result = number * thechange
                    break
                case "/":
                    opImage.image = UIImage(named: "divide")
                  result = number / thechange
                    break
                default:
                    result = 0
                
                }
                
                myLabel.text = "The result is \(result )"

            }else {
                myLabel.textColor = UIColor.red
                myLabel.text = "There are some errors in the input"
                opImage.image = UIImage(named: "error")
            }
            
        }else {
            opImage.image = UIImage(named: "error")

            myLabel.textColor = UIColor.red
            myLabel.text = "There are some errors in the input"

        }
        
       
    }
    
    // UI event function
    @IBAction func subOneCLicked(_ sender: Any) {
     
        if sender is UIButton {
            var title = (sender as! UIButton).titleLabel?.text
            
            switch title {
            case "Add":
                doMath(op: "+")
                
                break
            case "Sub" :
                doMath(op: "-")
                break
            case "Times" :
                doMath(op: "*")
                break
            case "Divid" :
                doMath(op: "/")
                break
            case "Clear":
                changeValue.text = ""
                numberText.text = ""
                myLabel.text = ""
                opImage.image = UIImage(named: "main")
                break
            default:
                print("No tilte")
            }
        }
        else {
            if light_mode {
                self.view.backgroundColor = UIColor.lightGray
                myLabel.textColor = UIColor.white
                one.titleLabel?.textColor = UIColor.white
                two.titleLabel?.textColor = UIColor.white
                
            }else {
                self.view.backgroundColor = UIColor.white
                myLabel.textColor = UIColor.black
                one.titleLabel?.textColor = UIColor.blue
                two.titleLabel?.textColor = UIColor.blue
                

            }
            light_mode = !light_mode
            
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

