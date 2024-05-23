//
//  GreenViewController.swift
//  Week3
//
//  Created by Rania Arbash on 2024-05-23.
//

import UIKit

class GreenViewController: UIViewController {

    var name: String = ""
    
    
    @IBOutlet weak var labelInGreenVC: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelInGreenVC.text = "Welcome \(name)"
        print("view did load in GVC")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("view Did appear in GVC")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear in GVC")

    }

    override var isBeingDismissed: Bool{
    
        print("GVC isBeingDismissed")
        return true

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
