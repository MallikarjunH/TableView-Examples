//
//  ViewController.swift
//  TableViewCustomCell
//
//  Created by ADDA on 07/02/20.
//  Copyright © 2020 ADDA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mainTableView.register(UINib(nibName: "AddaExpectedVisitorsCell", bundle: nil), forCellReuseIdentifier: "AddaExpectedVisitorsCell")
    }

}


extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       
        return 4 //need change after getting data from API
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            

            let cell = tableView.dequeueReusableCell(withIdentifier: "AddaExpectedVisitorsCell", for: indexPath) as! AddaExpectedVisitorsCell
        
            return cell
            
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
            return 195.0
    }
    

    
}
