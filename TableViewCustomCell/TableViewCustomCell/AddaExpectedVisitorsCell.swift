//
//  AddaExpectedVisitorsCell.swift
//  TableViewCustomCell
//
//  Created by ADDA on 07/02/20.
//  Copyright © 2020 ADDA. All rights reserved.
//

import UIKit

class AddaExpectedVisitorsCell: UITableViewCell {

    @IBOutlet weak var threeButtonsView: UIView!
   
    @IBOutlet weak var deleteButtonFrom3View: UIView!
    @IBOutlet weak var reinviteButtonFrom3View: UIView!
    @IBOutlet weak var callButtonFrom3View: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
