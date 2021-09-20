//
//  MKImageDownloadManager.swift
//  LazyLoading-Example1
//
//  Created by EOO61 on 20/09/21.
//

import UIKit

class MKImageDownloadManager: NSObject {

    static let sharedInstance = MKImageDownloadManager()
    var imageCache:NSCache<NSString, UIImage>
    
    
    override init() {
        
        self.imageCache = NSCache()
    }
    
    func getImage(forUrl url:String) -> UIImage? {
        return self.imageCache.object(forKey: url as NSString)
    }
    
    func setImage(image:UIImage,forKey url:String) -> Void {
        self.imageCache.setObject(image, forKey: url as NSString)
    }
}
