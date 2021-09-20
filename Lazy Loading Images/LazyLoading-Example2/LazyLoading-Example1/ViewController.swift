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
                     "https://s1.ax1x.com/2017/12/06/oaiz8.png"]
    
    
    
    @IBOutlet weak var mainTableView: UITableView!
    
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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell") as? ImageTableViewCell else {
            return UITableViewCell()
        }
        
        cell.update(imageUrl: imageURLs[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
       return 115.0
    }
    
}

