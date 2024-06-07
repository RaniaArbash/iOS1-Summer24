//
//  studentTableViewCell.swift
//  Week4
//
//  Created by Rania Arbash on 2024-06-06.
//

import UIKit

class studentTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var nameText: UILabel!
    
    
    @IBOutlet weak var programText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
     super.layoutSubviews()
      
     self.img.layer.cornerRadius = self.img.frame.width / 2
     self.img.clipsToBounds = true
    }

}
