//
//  RedViewController.swift
//  Week3
//
//  Created by Rania Arbash on 2024-05-23.
//

import UIKit

class RedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load in RVC")

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        print("view will appear in GVC")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("view Did appear in RVC")

    }
    
    @IBAction func backClicked(_ sender: Any) {
        
        dismiss(animated: true)
    }
    
    
    override var isBeingDismissed: Bool{
    
        print("RedVC isBeingDismissed")
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
