//
//  SerialWorkflowCell.swift
//  Workflow_Signing_Diagram
//
//  Created by EOO61 on 22/01/22.
//

import UIKit

class SerialWorkflowCell: UITableViewCell {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    
    @IBOutlet weak var topLineView: UIView!
    @IBOutlet weak var bottomLineView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
       // statusLabel.layer.borderWidth = 1
      //  statusLabel.layer.masksToBounds = false
        statusLabel.layer.borderColor = UIColor.green.cgColor
        statusLabel.layer.cornerRadius = statusLabel.frame.height/2
        statusLabel.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
