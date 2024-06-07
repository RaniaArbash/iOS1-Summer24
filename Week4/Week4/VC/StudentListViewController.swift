//
//  StudentListViewController.swift
//  Week4
//
//  Created by Rania Arbash on 2024-05-30.
//

import UIKit

class StudentListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
 
    var selectedImage = UIImage(named: "img")
    
    @IBOutlet weak var stdimage: UIImageView!
    
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
    
    @IBAction func takeAphoto(_ sender: Any) {
        
        let c = UIImagePickerController()
      
        c.sourceType = .photoLibrary
        c.delegate = self
        c.allowsEditing = false
        
        
        present(c, animated: true)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        let si = info[.originalImage] as? UIImage
        if let goodimg = si {
            stdimage.image  = goodimg
            selectedImage = goodimg
        }
        
        
       
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        print("the picker is canceled")
        dismiss(animated: true)
    }

    @IBAction func insertNewStudent(_ sender: Any) {
        if let goodName = nameText.text {
            if let goodProgram = programText.text {
                if !goodName.isEmpty {
                    if !goodProgram.isEmpty {
                        var newStd = Student(name: goodName, program: goodProgram, img: selectedImage!)
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? studentTableViewCell
        
        cell?.nameText.text = studentList[indexPath.row].name
        cell?.programText.text = studentList[indexPath.row].program
        cell?.img.image = studentList[indexPath.row].stdImage
       
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
