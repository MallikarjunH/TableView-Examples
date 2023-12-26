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
    
    var dataToFillDictionary2:[String:Any] = [:] //all data from prev VC
    
    var totalRowsForTableView:[String] = []
    var totalTagsOfRows:[Int] = []
    var filledDetailsArray:[Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("Received Data: \(dataToFillDictionary2)")
        self.getAndLoadTableview()
        
    }
    
    func getAndLoadTableview() {
        
        if let docValue:[Any] = self.dataToFillDictionary2["Sample.pdf"] as? [Any] {
            //totalTagsOfRows
            let nameViewPlaceholderArray:[[String]] = docValue[0] as! [[String]]
            for (ind, subArray) in nameViewPlaceholderArray.enumerated() {
                  if subArray.count > 0 {
                      for item in subArray{ //TODO
                          //TODO
                          self.totalRowsForTableView.append(item) //TODO
                          self.filledDetailsArray.append("")
                      }
                      //let placeholder = subArray[ind]
                      //self.totalRowsForTableView.append(placeholder)
                  }
                 
            }
            let nameViewsTagCollectionArray:[[Int]] = docValue[2] as! [[Int]]
            for (ind, subArray) in nameViewsTagCollectionArray.enumerated() {
                if subArray.count > 0 {
                    //let indxvalue = subArray[ind]
                    //self.totalTagsOfRows.append(indxvalue)
                    for item in subArray{
                        self.totalTagsOfRows.append(item)
                    }
                }
            }
            
            let emailViewPlaceholderArray:[[String]] = docValue[4] as! [[String]]
            for (ind, subArray) in emailViewPlaceholderArray.enumerated() {
                if subArray.count > 0 {
                    //let placeholder = subArray[ind]
                    //self.totalRowsForTableView.append(placeholder)
                    for item in subArray{
                        self.totalRowsForTableView.append(item)
                        self.filledDetailsArray.append("")
                    }
                }
            }
            let emailViewsTagCollectionArray:[[Int]] = docValue[6] as! [[Int]]
            for (ind, subArray) in emailViewsTagCollectionArray.enumerated() {
                if subArray.count > 0 {
                   // let indxvalue = subArray[ind]
                   // self.totalTagsOfRows.append(indxvalue)
                    for item in subArray{
                        self.totalTagsOfRows.append(item)
                    }
                }
            }
            
            let checkboxViewPlaceholderArray:[[String]] = docValue[8] as! [[String]]
            for (ind, subArray) in checkboxViewPlaceholderArray.enumerated() {
                if subArray.count > 0 {
                    //let placeholder = subArray[ind]
                   // self.totalRowsForTableView.append(placeholder)
                    for item in subArray{
                        self.totalRowsForTableView.append(item)
                        self.filledDetailsArray.append(false)
                    }
                }
            }
            let checkboxViewsTagCollectionArray:[[Int]] = docValue[10] as! [[Int]]
            for (ind, subArray) in checkboxViewsTagCollectionArray.enumerated() {
                if subArray.count > 0 {
                    //let indxvalue = subArray[ind]
                    //self.totalTagsOfRows.append(indxvalue)
                    for item in subArray{
                        self.totalTagsOfRows.append(item)
                    }
                }
                 
            }
            
        }
        self.fillTableView.reloadData()
    }
    
    @IBAction func sendBtnAction(_ sender: Any) {
        
        print("Filled Details Array: \(filledDetailsArray)")
        print("DataToFillDictionary2 Before appending: \(self.dataToFillDictionary2)")
       // totalTagsOfRows
        
        //Append/Replace Values
        if var docValue:[Any] = self.dataToFillDictionary2["Sample.pdf"] as? [Any] {
            
            //Name
            let nameViewsTagCollectionArray:[[Int]] = docValue[2] as! [[Int]]
            var enteredDataForNameArray:[[String]] = docValue[3] as! [[String]]
            
            for (ind, subArray) in nameViewsTagCollectionArray.enumerated() {
                if subArray.count > 0 {
                    for (ind2, value) in subArray.enumerated() {
                        //if value ==
                        enteredDataForNameArray[ind][ind2] = filledDetailsArray[value - 1] as! String
                    }
                }
            }
            docValue[3] = enteredDataForNameArray
            //
            
            //Email
            let emailViewsTagCollectionArray:[[Int]] = docValue[6] as! [[Int]]
            var enteredDataForemailArray:[[String]] = docValue[7] as! [[String]]
            
            for (ind, subArray) in emailViewsTagCollectionArray.enumerated() {
                if subArray.count > 0 {
                    for (ind2, value) in subArray.enumerated() {
                        //if value ==
                        enteredDataForemailArray[ind][ind2] = filledDetailsArray[value - 1] as! String
                    }
                }
            }
            docValue[7] = enteredDataForemailArray
            
            //Checkbox
            let checkboxViewsTagCollectionArray:[[Int]] = docValue[10] as! [[Int]]
            var enteredDataForcheckboxArray:[[Bool]] = docValue[11] as! [[Bool]]
            
            for (ind, subArray) in checkboxViewsTagCollectionArray.enumerated() {
                if subArray.count > 0 {
                    for (ind2, value) in subArray.enumerated() {
                        //if value ==
                        enteredDataForcheckboxArray[ind][ind2] = filledDetailsArray[value - 1] as! Bool
                    }
                }
            }
            docValue[11] = enteredDataForcheckboxArray
            
            
            self.dataToFillDictionary2["Sample.pdf"] = docValue
        }
        
        print("Final Data After Edidting: \(dataToFillDictionary2)")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.totalRowsForTableView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let rowType =  self.totalRowsForTableView[indexPath.row]
        
        if rowType == "name" || rowType == "email" {
            
            let cell = fillTableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as! TextFieldCell
            
              cell.formTextfield.placeholder = self.totalRowsForTableView[indexPath.row]
              cell.formTextfield.textColor = .black
              //cell.formTextfield.text = editedText
            
              cell.formTextfield.delegate = self
              cell.formTextfield.tag = indexPath.row
            
            return cell
        }
        else if rowType == "checkbox" {
                  
            let cell = fillTableView.dequeueReusableCell(withIdentifier: "CheckBoxCell", for: indexPath) as! CheckBoxCell
    
            if self.filledDetailsArray[indexPath.row] as! Bool == true {
                cell.checkBoxImg.image = UIImage(named: "check")
            }else {
                cell.checkBoxImg.image = UIImage(named: "uncheck")
            }
              /*
              if docValue[indexPath.row] == "uncheck" || docValue[indexPath.row] == "checkbox"{
                
                  cell.checkBoxImg.image = UIImage(named: "uncheck")
              }
               else{
                  cell.checkBoxImg.image = UIImage(named: "check")
              }
              */
            return cell
        }
        else {
            
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let currentTag = self.totalTagsOfRows[indexPath.row]
        
        if self.totalRowsForTableView[indexPath.row] == "checkbox" {
            
            if  self.filledDetailsArray[indexPath.row] as! Bool == false {
                self.filledDetailsArray[indexPath.row] = true
            }else {
                self.filledDetailsArray[indexPath.row] = false
            }
            
            //reload specific row
            let indexPathRow:Int = indexPath.row //0
            let indexPosition = IndexPath(row: indexPathRow, section: 0)
            self.fillTableView.reloadRows(at: [indexPosition], with: .none)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 76.0
        /*
        if indexPath.section == 0 {
            
            return 76.0 //checkbox
        }
        else if indexPath.section == 1 {
            
            return 44.0
        }
        else{
            return  44.0
        }
        */
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        self.filledDetailsArray[textField.tag] = textField.text ?? ""
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let indexPath = IndexPath(row: textField.tag, section: 0)
        
        if let cell = fillTableView.cellForRow(at: indexPath) as? TextFieldCell {
            
            print("Form Text at row: \(indexPath) \(cell.formTextfield.text ?? "")" )
            
            //TODO validations
            if totalRowsForTableView[textField.tag] == "name" {
                
                let aSet = NSCharacterSet(charactersIn:"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ").inverted
                let compSepByCharInSet = string.components(separatedBy: aSet)
                let numberFiltered = compSepByCharInSet.joined(separator: "")
                return string == numberFiltered
            }
            else if totalRowsForTableView[textField.tag] == "email" {
                
                let aSet = NSCharacterSet(charactersIn:"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@1234567890_-.").inverted
                let compSepByCharInSet = string.components(separatedBy: aSet)
                let numberFiltered = compSepByCharInSet.joined(separator: "")
                return string == numberFiltered
            }
        }
        
        return true
    }
}
