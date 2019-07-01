//
//  ViewController.swift
//  TableView + ProgressView
//
//  Created by mallikarjun on 01/07/19.
//  Copyright © 2019 Mallikarjun H. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var progressViewOutlet: UIProgressView!
    
    var nameValue = ""
    var emailValue = ""
    var mobileValue = ""
    
    var percentageValue = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let transform : CGAffineTransform = CGAffineTransform(scaleX: 1.0, y: 3.0)
        progressViewOutlet.transform = transform
        progressViewOutlet.layer.cornerRadius = 4
        progressViewOutlet.clipsToBounds = true
    }

    func updateProgressBar(){
        
        DispatchQueue.main.async {
            self.progressViewOutlet.progress = Float(0.01 * self.percentageValue)
        }
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellId", for: indexPath) as! TableViewCell
        
        cell.nameTextField.text = nameValue
        cell.emailTextField.text = emailValue
        cell.mobileTextField.text = mobileValue
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 274.0
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        updateProgressBar()
        return true
    }
    //33.33 x 3 = 100
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.tag == 1{
            
          nameValue = textField.text ?? ""
            
            if !nameValue.isEmpty{
                 percentageValue = percentageValue + 33.33
            }else{
                 percentageValue = percentageValue - 33
            }
         
            
        }else if textField.tag == 2{
            
            emailValue = textField.text ?? ""
           // percentageValue = percentageValue + 33.33
            if !emailValue.isEmpty{
                percentageValue = percentageValue + 33.33
            }else{
                percentageValue = percentageValue - 33
            }
        }
        else if textField.tag == 3{
            
            mobileValue = textField.text ?? ""
           // percentageValue = percentageValue + 33.33
            if !mobileValue.isEmpty{
                percentageValue = percentageValue + 33.33
            }else{
                percentageValue = percentageValue - 33
            }
        }
        
       // view.setNeedsDisplay()
        mainTableView.reloadData()
        updateProgressBar()
        
    }

}

