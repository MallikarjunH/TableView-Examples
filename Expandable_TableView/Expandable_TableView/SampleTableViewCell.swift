//
//  SampleTableViewCell.swift
//  Expandable_TableView
//
//  Created by EOO61 on 03/09/21.
//

import UIKit

class SampleTableViewCell: UITableViewCell {

    @IBOutlet weak var questionLabel: PaddingLabel!
    @IBOutlet weak var answerLabel: PaddingLabel!
    
    @IBOutlet weak var answerLabelHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        questionLabel.paddingLeft = 15
        questionLabel.paddingRight = 15
        questionLabel.paddingTop = 10
        questionLabel.paddingBottom = 10
        
        answerLabel.paddingRight = 15
        answerLabel.paddingLeft = 15
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(content: DataModel, state: Bool) {
            self.questionLabel.text = content.question
            guard let stringHeight = content.answer?.height(width: self.answerLabel.frame.width - (self.answerLabel.paddingLeft + self.answerLabel.paddingRight), font: .systemFont(ofSize: 17, weight: .regular)) else { return }
            if state == true {
                self.answerLabel.text = content.answer
                // Answer Label Padding
                answerLabel.paddingTop = 8
                answerLabel.paddingBottom = 8
                answerLabelHeight.constant = stringHeight + answerLabel.paddingTop + answerLabel.paddingBottom
            } else {
                self.answerLabel.text = ""
                // Answer Label Padding
                answerLabel.paddingTop = 0
                answerLabel.paddingBottom = 0
                answerLabelHeight.constant = 0
            }
            layoutIfNeeded()
        }

}
