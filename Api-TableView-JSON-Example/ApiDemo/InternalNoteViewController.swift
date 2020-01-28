//
//  InternalNoteViewController.swift
//  ApiDemo
//
//  Created by Mallikarjun on 24/10/18.
//  Copyright © 2018 aspl. All rights reserved.
//

import UIKit

class InternalNoteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func submitButtonClicked(_ sender: Any) {
        
        print("clecked 222")
        _ = navigationController?.popViewController(animated: true)
    }
    
}
