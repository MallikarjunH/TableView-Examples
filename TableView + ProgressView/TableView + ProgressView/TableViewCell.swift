//
//  TableViewCell.swift
//  TableView + ProgressView
//
//  Created by mallikarjun on 01/07/19.
//  Copyright © 2019 Mallikarjun H. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
   
    @IBOutlet weak var mobileTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        nameTextField.tag = 1
        emailTextField.tag = 2
        mobileTextField.tag = 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
