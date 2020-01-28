//
//  ConversationViewController.swift
//  ApiDemo
//
//  Created by Mallikarjun on 23/10/18.
//  Copyright © 2018 aspl. All rights reserved.
//

import UIKit

class ConversationViewController: UIViewController {

    
    @IBOutlet weak var testingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Mallikarjun")

        // Do any additional setup after loading the view.
        
//        DispatchQueue.main.async {
//           
//        let nameData =  UserDefaults.standard.string(forKey:"reply")
//          self.testingLabel.text = nameData!
//            
//            
//        }
        
        self.getTicketThread()
    }
    
    func getTicketThread() {
        
        
        let getInboxURL = "http://productdemourl.com/helpdesk38/public/api/v1/helpdesk/ticket-thread"
        
        let defaults = UserDefaults.standard
        let value = defaults.string(forKey:"token")
        print("token=>",value!) //here I got exception - Thread 1: Fatal error: Unexpectedly found nil while unwrapping an Optional value
        
        let tickeId = GlobalVariables.sharedManager.ticketId
        
        requestGETURL(getInboxURL, params: ["token":value as AnyObject,
                                            "id":tickeId as AnyObject],  success: { (data) in
                                                
                                                
                                                
                                                print("JSON is: ",data)
                                                
                                                let msg = data["message"].stringValue
                                                print("Message is: ",msg)
                                                
                                                if msg == "Token expired"{
                                                    
                                                    let vc = ViewController()
                                                    
                                                    vc.tokenRefreshMethod()
                                                    self.getTicketThread()
                                                }
                                                else{
                                                    
                                                  //  var dataIterator = 0
                                                    
                                                    
                                                      //  dataIterator = dataIterator + 1
                                                    
                                                    
                                                    
//                                                    DispatchQueue.main.async {
//                                                        self.tableView.reloadData()
//                                                    }
                                                    
                                                }
                                                
                                            
                                                
        }) { (error) in
            
            print(error)
        }
        
        
        
        
    }
    

}
