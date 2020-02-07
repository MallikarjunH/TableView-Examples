//
//  ViewController.swift
//  TableViewCustomCell
//
//  Created by ADDA on 07/02/20.
//  Copyright © 2020 ADDA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}


extension AddaExpectedVisitorsListViewController: UITableViewDelegate,UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       
        return 4 //need change after getting data from API
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            

            let cell = tableView.dequeueReusableCell(withIdentifier: "AddaExpectedVisitorsCellId", for: indexPath) as! AddaExpectedVisitorsCell
        
            return cell
            
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
            return 240.0
    }
    

    
}
