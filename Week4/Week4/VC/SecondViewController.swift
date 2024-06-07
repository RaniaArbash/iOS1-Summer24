//
//  SecondViewController.swift
//  Week4
//
//  Created by Rania Arbash on 2024-05-30.
//

import UIKit

class SecondViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource{
 
    

    var numbers = ["1","2","3","4","5"]
    var letters = ["A","B","C","D","E"]

    @IBOutlet weak var numberPicker: UIPickerView!
    
    
    @IBOutlet weak var letterPicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberPicker.delegate = self
        numberPicker.dataSource = self
        
        letterPicker.delegate = self
        letterPicker.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return numbers.count
        }else
        {
            return letters.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return numbers[row]
        }else
        {
            return letters[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            letters.append(numbers[row])
            numbers.remove(at: row)
         
        }else
        {
            numbers.append(letters[row])
            letters.remove(at: row)
        }
        letterPicker.reloadAllComponents()
        numberPicker.reloadAllComponents()
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
