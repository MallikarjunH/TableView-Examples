//
//  SampleTableViewCell.swift
//  ApiDemo
//
//  Created by Mallikarjun on 19/07/18.
//  Copyright © 2018 aspl. All rights reserved.
//

import UIKit

class SampleTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var ticketNumber: UILabel!

    @IBOutlet weak var source: UILabel!
    
    
    @IBOutlet weak var email: UILabel!
    
    
    @IBOutlet weak var assigneeName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
