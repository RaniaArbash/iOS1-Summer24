//
//  Student.swift
//  Week4
//
//  Created by Rania Arbash on 2024-05-30.
//

import Foundation
import UIKit

class Student {
    
    var name:String = ""
    var program : String = ""
    var stdImage : UIImage
    
    
    init(name: String, program: String, img: UIImage) {
        self.name = name
        self.program = program
        self.stdImage = img
    }
    
}
