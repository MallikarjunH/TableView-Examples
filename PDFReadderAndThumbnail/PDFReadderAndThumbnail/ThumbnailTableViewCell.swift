//
//  ThumbnailTableViewCell.swift
//  PDFReadderAndThumbnail
//
//  Created by EOO61 on 28/05/21.
//

import UIKit

class ThumbnailTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImg: UIImageView!

    @IBOutlet weak var pageNoBGView: UIView!
    @IBOutlet weak var pageNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        pageNoBGView.layer.cornerRadius = pageNoBGView.frame.height / 2
        pageNoBGView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
