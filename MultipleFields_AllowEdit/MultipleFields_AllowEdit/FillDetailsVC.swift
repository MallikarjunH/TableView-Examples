//
//  FillDetailsVC.swift
//  MultipleFields_AllowEdit
//
//  Created by EOO61 on 22/12/23.
//

import UIKit

class FillDetailsVC: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    
    @IBOutlet weak var signButton: UIButton!
    @IBOutlet weak var fillTableView: UITableView!
    
    var totalRowsForTableView:[String] = []
    var dataToFillDictionary2:[String:Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("Received Data: \(dataToFillDictionary2)")
        
        
    }
    
    func getAndLoadTableview() {
        
        if var docValue:[Any] = self.dataToFillDictionary2["Sample.pdf"] as? [Any] {
            
            var nameViewPlaceholderArray:[[String]] = docValue[0] as! [[String]]
            for (ind, subArray) in nameViewPlaceholderArray.enumerated() {
                 let placeholder = subArray[ind]
                self.totalRowsForTableView.append(placeholder)
            }
            
            var emailViewPlaceholderArray:[[String]] = docValue[4] as! [[String]]
            for (ind, subArray) in emailViewPlaceholderArray.enumerated() {
                 let placeholder = subArray[ind]
                self.totalRowsForTableView.append(placeholder)
            }
            
            var checkboxViewPlaceholderArray:[[String]] = docValue[8] as! [[String]]
            for (ind, subArray) in checkboxViewPlaceholderArray.enumerated() {
                 let placeholder = subArray[ind]
                self.totalRowsForTableView.append(placeholder)
            }
            
        }
        
        self.fillTableView.reloadData()
    }
    
    @IBAction func sendBtnAction(_ sender: Any) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.totalRowsForTableView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = fillTableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as! TextFieldCell
        
        return cell
    }
}
