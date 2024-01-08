//
//  DocListCell.swift
//  BulkSigning
//
//  Created by EOO61 on 02/01/24.
//

import UIKit

protocol CheckBoxCellDelegate: AnyObject {
    func customCell(cell: DocListCell, didTappedEdit button: UIButton)
}

class DocListCell: UITableViewCell {

    @IBOutlet weak var checkBoxBtn: UIButton!
    
    weak var checkBoxCellDelegate: CheckBoxCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        checkBoxBtn.setTitle("", for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onClickCheckBox(_ sender: Any){
        if let button = sender as? UIButton {
            self.checkBoxCellDelegate?.customCell(cell: self, didTappedEdit: button)
        }
    }
    
}
