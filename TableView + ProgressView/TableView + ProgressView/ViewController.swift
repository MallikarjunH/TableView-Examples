//
//  ViewController.swift
//  TableView + ProgressView
//
//  Created by mallikarjun on 01/07/19.
//  Copyright © 2019 Mallikarjun H. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var progressViewOutlet: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let transform : CGAffineTransform = CGAffineTransform(scaleX: 1.0, y: 3.0)
        progressViewOutlet.transform = transform
        progressViewOutlet.layer.cornerRadius = 4
        progressViewOutlet.clipsToBounds = true
    }

    func updateProgressBar(){
        
       // let percentageInFloat = CGFloat(percentageValue)
        progressViewOutlet.progress = Float(0.01 * 20)
    }
    

}

