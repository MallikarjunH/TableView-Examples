//
//  CheckBoxCell.swift
//  MultipleFields_AllowEdit
//
//  Created by EOO61 on 22/12/23.
//

import UIKit

class CheckBoxCell: UITableViewCell {

    @IBOutlet weak var checkBoxImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
