//
//  ViewController.swift
//  Week3
//
//  Created by Rania Arbash on 2024-05-23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var imageInVC: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("view did load in VC")
        imageInVC.layer.backgroundColor = CGColor(red: CGFloat(255), green: CGFloat(255), blue: CGFloat(255), alpha: CGFloat(1))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear in VC")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("view Did appear in VC")

    }
    
    
    
    
//    func addTwoNumbers(num1 N1  : Int, _ N2: Int ) -> Int{
//        return N1 + N2
//    }
    
    
    
    @IBAction func changeToBlue(_ sender: Any) {
        
        
        view.backgroundColor = UIColor.blue
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toGreen"{
            
            var GVC =  segue.destination as! GreenViewController
            
      //      guard let goodName = nameText.text else {
//                return
//            }
//            guard !goodName.isEmpty else {
//                return
//            }
            
            if let goodName = nameText.text {
                if !goodName.isEmpty {
                    GVC.name = goodName
                }else {
                    // alert
                    var alert = UIAlertController(title: "Empty Name!!", message: "You have to enter your name first", preferredStyle: .alert)
                    
                    var alertAction = UIAlertAction(title: "Fine", style: .default) { action in
                        
                        print("Hello this statment in Fine action")
                    }
                    alert.addAction(alertAction)
                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
                        print("Hello, this statment in Cancel action")

                    }))
                    
                    present(alert, animated: true)
                    
                    
                }
            }
                
            
          
        }
        else {
            var RVC =  segue.destination as! RedViewController

            
        }

    }


}

