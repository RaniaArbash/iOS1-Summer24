//
//  StudentListViewController.swift
//  Week4
//
//  Created by Rania Arbash on 2024-05-30.
//

import UIKit

class StudentListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    

    @IBOutlet weak var nameText: UITextField!
    var studentList = [Student]()
    
    @IBOutlet weak var programText: UITextField!
    
    
    @IBOutlet weak var student_table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        student_table.delegate = self
        student_table.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func insertNewStudent(_ sender: Any) {
        if let goodName = nameText.text {
            if let goodProgram = programText.text {
                if !goodName.isEmpty {
                    if !goodProgram.isEmpty {
                        var newStd = Student(name: goodName, program: goodProgram)
                        studentList.append(newStd)
            
                        student_table.reloadData()
                        
                    }
                }
            }
        }
        
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = studentList[indexPath.row].name
        cell?.detailTextLabel?.text = studentList[indexPath.row].program
        
        return cell!
        
        
        
        
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
