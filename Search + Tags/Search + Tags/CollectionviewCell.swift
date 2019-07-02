//
//  CollectionviewCell.swift
//  Search + Tags
//
//  Created by mallikarjun on 02/07/19.
//  Copyright © 2019 Mallikarjun H. All rights reserved.
//

import UIKit

class CollectionviewCell: UICollectionViewCell {

    @IBOutlet weak var symtomTagLabel: UILabel!
    @IBOutlet weak var mainBGView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        symtomTagLabel.textColor = UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 1)
        
        mainBGView.layer.cornerRadius = 14
        mainBGView.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1)
    
        
    }
    

}
