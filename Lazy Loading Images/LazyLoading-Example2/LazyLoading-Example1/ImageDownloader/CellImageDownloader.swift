//
//  CellImageDownloader.swift
//  LazyLoading-Example1
//
//  Created by EOO61 on 20/09/21.
//

import Foundation
import UIKit

extension UIImageView {
    // way to hack stored property in extension, we using static hence needed dictionary to store based on address
    private static var urlStore = [String:String]()

    
    func setImage(url: String, placeholderImage: UIImage? = nil) {
        let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
        UIImageView.urlStore[tmpAddress] = url
        
        if let image = placeholderImage {
            self.image = image
        } else{
            self.backgroundColor = .gray
        }
        
        MKImageDownloader().downloadAndCacheImage(url: url, onSuccess: { (image, url) in
            DispatchQueue.main.async {
            if UIImageView.urlStore[tmpAddress] == url {
                        self.image = image
                        self.backgroundColor = .clear
                    }
            }
        }) { error in
        }
    }
}
