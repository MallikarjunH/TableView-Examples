//
//  CollectionViewCellTest.swift
//  Search + Tags
//
//  Created by mallikarjun on 02/07/19.
//  Copyright © 2019 Mallikarjun H. All rights reserved.
//

import UIKit

class CollectionViewCellTest: UICollectionViewCell {
    
    
    @IBOutlet weak var testLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.layer.cornerRadius = 15
//        testLabel.numberOfLines = 0
//        testLabel.lineBreakMode = .byWordWrapping
        
    }
}
