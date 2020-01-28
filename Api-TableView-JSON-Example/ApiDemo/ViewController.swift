//
//  ViewController.swift
//  ApiDemo
//
//  Created by aspl on 17/07/18.
//  Copyright © 2018 aspl. All rights reserved.
//

import UIKit


var tokenSting1 = "test"



class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var test: UILabel!
    
    var email:String?
    var assignName:String?
    var selectedPath:IndexPath?
    var selectedTicketId:String?
    var selectedIdCount:Int?
    var ticketId:String?
    
    
    
    @IBOutlet weak var sampleTableView: UITableView!
    
    //var myArray=[]()
    
    var sampleArray:Array<String> = Array<String>()
    var dataArray = [DataList]()
    var totalDataArray = [DataList]()
    
    var ticketIdArray = [String]()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "Inbox"
        
        tableView.register(UINib(nibName: "SampleTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        let play = UIBarButtonItem(title: "Reply", style: .plain, target: self, action:#selector(self.playTapped))
        
        let count1 = UIBarButtonItem(title: "Count", style: .plain, target: self, action:#selector(self.countClicked))
        
        navigationItem.rightBarButtonItems = [play,count1]

        //code for multiple selection tableview rows
        
        self.tableView.allowsMultipleSelectionDuringEditing = true
        
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongPress))
        lpgr.minimumPressDuration = 0.2
        lpgr.delaysTouchesBegan = true
        self.tableView.addGestureRecognizer(lpgr)
        
        
        tokenRefreshMethod()
        
        getTicketsList()
        
    }
    
    @objc func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        self.tableView .setEditing(true, animated:true)
    }
    
    
    func tokenRefreshMethod()
    {
        
        var url = webConstant.baseUrl
        url.append(webConstant.authenticate)
        
        
        requestPOSTURL(url, params: ["username":"demoadmin" as AnyObject,
                                     "password":"demopass" as AnyObject], success: { (data) in
                                        
                                        
                                         self.email = data["data"]["user"]["email"].stringValue
                                        print("email",self.email!)
                                        let token = data["data"]["token"].stringValue
                                        print("tokens =>",token)
                                        
                                        UserDefaults.standard.set(token, forKey: "token")
                                        self.tableView.reloadData()
                                        
                                
                                        
        }) { (error) in
            print(error)
        }
        
    }
    
    
    
    func getTicketsList() {
        
        
        
        let getInboxURL = "http://productdemourl.com/helpdesk38/public/api/v2/helpdesk/get-tickets"
        
        let defaults = UserDefaults.standard
        let value = defaults.string(forKey:"token")
        print("token=>",value!) //here I got exception - Thread 1: Fatal error: Unexpectedly found nil while unwrapping an Optional value
        
        requestGETURL(getInboxURL, params: ["token":value as AnyObject,
                                            "show":"inbox" as AnyObject,"api":"1" as AnyObject,"departments":"All" as AnyObject],  success: { (data) in
                                                
                                                
                                                
                  print("JSON is: ",data)
                                                
                  let msg = data["message"].stringValue
                  print("Message is: ",msg)
                                                
                  if msg == "Token expired"{
                    
                      self.tokenRefreshMethod()
                      self.getTicketsList()
                    }
                  else{
                  
                         var dataIterator = 0
                                                
                         for dataList in data["data"]["data"].arrayValue{
                         print(dataList["ticket_number"].stringValue)
                            
                         let token = dataList["ticket_number"].stringValue
                         let source = dataList["source"].stringValue
                         let firstname = dataList["assignee"]["first_name"].stringValue
                            
                         let lastname = dataList["assignee"]["last_name"].stringValue
                            
                          if firstname == "" || lastname == ""{
                                self.assignName = "Unassigned"
                            }else{
                                self.assignName = firstname + " " + lastname
                                 }
                                                    
                             let email = dataList["from"]["email"].stringValue
                            
                             let id = dataList["id"].stringValue
                            
                            self.dataArray.append(DataList(ticketNumber: token, source: source, assignname: self.assignName!, emails: email, ids: id))
                                                    
                             print("dataArray = >",self.dataArray)
                             self.totalDataArray = self.dataArray
                                                    
                             dataIterator = dataIterator + 1
                        }
                    
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                }
                                                
            // check stackflow link- https://stackoverflow.com/questions/37801370/how-do-i-dispatch-sync-dispatch-async-dispatch-after-etc-in-swift-3-swift-4
                                                
//            // Move to a background thread to do some long running work
//              DispatchQueue.global(qos: .userInitiated).async {
//                  let image = self.loadOrGenerateAnImage()
//                 // Bounce back to the main thread to update the UI
//                    DispatchQueue.main.async {
//                            self.imageView.image = image
//                        }
//            }
                                                
    
                                                
                                                
//                                                        else{
//
//
//                                                        //   let dictionaryResult1 = data["data"].dictionary
//                                                        //   print("First Data Dict is : ",dictionaryResult1!)
//
//                                                           //print path, lastpage, next-page-url ..etc
//
//                                                            let path = data["data"]["path"].stringValue
//                                                            print("Message is: ",path)
//
//                                                            // print next_page_url value
//                                                            let nextPageUrl = data["data"]["next_page_url"].stringValue
//                                                            print("Message is: ",nextPageUrl)
//
//                                                            // printing data aaray
//                                                            let data2Array = data["data"]["data"].array![0]
//                                                            print("Data Array is: ",data2Array)
//
//                                                            //printing tickrt number
//                                                            let ticketNumber = data2Array["ticket_number"].stringValue
//                                                            print("Ticket Number is: ",ticketNumber)
//
//                                                            //printing priority dictionary
//                                                            let priorityDict = data2Array["priority"].dictionary
//                                                            print("Prio Dict is: ",priorityDict!)
//
//                                                            // printing priority name
//                                                            let prioName = priorityDict!["name"]?.stringValue
//                                                            print("Prio name is: ",prioName!)
//
//
//                                                 }
                                                
                                                
        }) { (error) in
            
            print(error)
        }
        
        
        
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return totalDataArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SampleTableViewCell
        cell.source.text = totalDataArray[indexPath.row].source
        cell.email.text = totalDataArray[indexPath.row].email
        cell.ticketNumber.text = totalDataArray[indexPath.row].ticketnumber
        cell.assigneeName.text = totalDataArray[indexPath.row].assign
        return cell
        
        
    }
    
    @objc func countClicked(){
        
        print("clicked")
        
        
        let alertController = UIAlertController(title: "Faveo Helpdesk", message: "What do you want to do?", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)

    }
    
    
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        selectedPath=indexPath
        
        if tableView .isEditing {
            
            ticketIdArray.append(totalDataArray[indexPath.row].id)
            print(ticketIdArray) //output: ["34", "33", "32", "29"]
            
            selectedIdCount = ticketIdArray.count
            
            selectedTicketId = String(format: "%@",ticketIdArray.joined(separator:","))
            print(selectedTicketId!) //output : 34,33,32,29,33
           // var string12 = stringRepresentation
            
            
        }else{
            
            // navigate to next VC
            
            GlobalVariables.sharedManager.firstName = totalDataArray[indexPath.row].email
         //   GlobalVariables.sharedManager.lastName = totalDataArray[indexPath.row].ticketnumber
            GlobalVariables.sharedManager.ticketNumber = totalDataArray[indexPath.row].ticketnumber
            GlobalVariables.sharedManager.ticketStatus = totalDataArray[indexPath.row].source
            GlobalVariables.sharedManager.ticketId = totalDataArray[indexPath.row].id
            
            let detailView = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewControllerId") as! DetailViewController
            
            self.navigationController?.pushViewController(detailView, animated: true)
            
        }
        
        
    }
    
    
     func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath){
        
        selectedPath=indexPath
        
       // var myInt1 = Int(totalDataArray[indexPath.row])
    
//        if let index = totalDataArray.index(of: "chimps") {
//            animals.remove(at: index)
//        }
        

        
        
        selectedTicketId = String(format: "%@",ticketIdArray.joined(separator:","))
        print(selectedTicketId!)
        
        if (selectedTicketId?.isEmpty)!{
            
            self.tableView.isEditing = false
        }
        
        
    }

    
    @objc func playTapped(){
        
        print("Clicked")
        
        
        let defaults = UserDefaults.standard
        let value2 = defaults.string(forKey:"token")
        print("token=>",value2!)
        
        
        var url = webConstant.baseUrl
        url.append(webConstant.replyTicket)
        url.append("?token=")
        url.append(value2!)
        
       
      //  requestPOSTURL(url, params:["token":"43" as AnyObject,"ticket_id":"5" as AnyObject,"reply_content":"some body message" as AnyObject], success: { (data) in
         print("URL=>",url)
        
        requestPOSTURL(url, params: ["ticket_id":"5" as AnyObject,"reply_content":"some body message" as AnyObject], success: { (data) in
            
                  print("JSON 1 is: ",data)
            
                  let msg = data["message"].stringValue
                  print("Message is: ",msg)
            
                  if msg == "Token expired"{
                    
                  self.tokenRefreshMethod()
                  
                 }
            
            print("test message in post create ticket")
            
        }) { (error) in
            print(error)
        }
        
        
    }
    
    //    func do_table_refresh()
    //    {
    //        DispatchQueue.main.async {
    //            self.sampleTableView.reloadData()
    //            return
    //        }
    //    }
    
    
}
class DataList{
    let ticketnumber:String
    let source:String
    let assign:String
    let email:String
    let id:String
    init(ticketNumber:String,source:String,assignname:String,emails:String,ids:String) {
        self.ticketnumber = ticketNumber
        self.source = source
        self.assign = assignname
        self.email = emails
        self.id = ids
    }
   
}




