//
//  ViewController.swift
//  LazyLoading-Example1
//
//  Created by EOO61 on 20/09/21.
//

import UIKit

class ViewController: UIViewController {

    let imageURLs = ["http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg",
                     "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
                     "https://s1.ax1x.com/2017/12/06/oaiz8.png",
                     "https://s1.ax1x.com/2017/12/06/oakQS.jpg","http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg","http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg",
                     "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
                     "https://s1.ax1x.com/2017/12/06/oaiz8.png",
                     "https://s1.ax1x.com/2017/12/06/oakQS.jpg","http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg","http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg",
                     "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
                     "https://s1.ax1x.com/2017/12/06/oaiz8.png",
                     "https://s1.ax1x.com/2017/12/06/oakQS.jpg","http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg","http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg",
                     "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
                     "https://s1.ax1x.com/2017/12/06/oaiz8.png",
                     "https://s1.ax1x.com/2017/12/06/oakQS.jpg","http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg","http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg",
                     "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
                     "https://s1.ax1x.com/2017/12/06/oaiz8.png",
                     "https://s1.ax1x.com/2017/12/06/oakQS.jpg","http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg","http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg",
                     "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
                     "https://s1.ax1x.com/2017/12/06/oaiz8.png",
                     "https://s1.ax1x.com/2017/12/06/oakQS.jpg","http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg","http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg",
                     "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
                     "https://s1.ax1x.com/2017/12/06/oaiz8.png",
                     "https://s1.ax1x.com/2017/12/06/oakQS.jpg","http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg","http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg",
                     "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
                     "https://s1.ax1x.com/2017/12/06/oaiz8.png",
                     "https://s1.ax1x.com/2017/12/06/oakQS.jpg","http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg"]
    
    
    
    @IBOutlet weak var mainTableView: UITableView!
    var imageLoader = ImageLoader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.mainTableView.reloadData()
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return imageURLs.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    
       
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell") as! ImageTableViewCell
            imageLoader.obtainImageWithPath(imagePath: imageURLs[indexPath.row]) { (image) in
            
                    cell.imgOutlet.image = image
            }
        cell.indexLabel.text = "Index: \(indexPath.row)"
        
       // cell.imgOutlet.image = UIImage(named: "placeholder")  //set placeholder image first.
       // cell.imgOutlet.downloadImageFrom(link: imageURLs[indexPath.row], contentMode: UIView.ContentMode.scaleAspectFit)  //set your image from link array.
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
       return 115.0
    }
    
}

/*
extension UIImageView {
    func downloadImageFrom(link:String, contentMode: UIView.ContentMode) {
        URLSession.shared.dataTask( with: NSURL(string:link)! as URL, completionHandler: {
            (data, response, error) -> Void in
            DispatchQueue.main.async {
                self.contentMode =  contentMode
                if let data = data { self.image = UIImage(data: data) }
            }
        }).resume()
    }
} */
