//
//  ViewController.swift
//  Week4
//
//  Created by Rania Arbash on 2024-05-30.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , UIPickerViewDelegate , UIPickerViewDataSource {
 
    @IBOutlet weak var semesterPicker: UIPickerView!
    
    @IBOutlet weak var nametext: UITextField!
    
    @IBOutlet weak var namesTable: UITableView!
    
    var names : [String] = ["John", "Mary","Smith","Rania"]
    var semesters : [String] = ["Summer 24", "Fall 24","Winter 25","Summer 25"]


    override func viewDidLoad() {
        super.viewDidLoad()
        namesTable.delegate = self
        namesTable.dataSource = self
    }


    
    @IBAction func insertNewName(_ sender: Any) {
        let selectedButton = (sender as! UIButton)
        
        if let goodTitle = selectedButton.titleLabel?.text {
        
        if  goodTitle == "Insert Name" {
        
            if let goodName = nametext.text {
                if !goodName.isEmpty {
                    names.append(goodName)
                    nametext.text = ""
                    namesTable.reloadData()
                }
            }
        }else {
            
            if let goodName = nametext.text {
                if !goodName.isEmpty {
                    semesters.append(goodName)
                    nametext.text = ""
                    semesterPicker.reloadAllComponents()
                    
                }
            }
            
        }
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            names.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Names"
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = names[indexPath.row]
        cell.imageView?.image = UIImage(named: "nophoto")
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Student", message: "The selected name is \(names[indexPath.row])", preferredStyle: .alert)
        
    
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        
        present(alert, animated: true)
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return semesters.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
     
        return semesters[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("The selected row is \(row)" )
    }
    
    
}

