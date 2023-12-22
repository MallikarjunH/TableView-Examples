//
//  ViewController.swift
//  MultipleFields_AllowEdit
//
//  Created by EOO61 on 22/12/23.
//

import UIKit

class ViewController: UIViewController {

    var dataToFillDictionary:[String:Any] = [:]
    
    var nameViewPlaceholderArray:[[String]] = []
    var nameViewEmailCollectionArray:[[String]] = [] //Stores Users Email string for each field of Name
    var nameViewsTagCollectionArray:[[Int]] = [] //Stores Users name Tag for each field
    var enteredDataForNameArray:[[String]] = []
    
    var emailViewPlaceholderArray:[[String]] = []
    var emailViewEmailCollectionArray:[[String]] = [] //Stores Users Emails for each field of Name
    var emailViewsTagCollectionArray:[[Int]] = [] //Stores Users Email Tag for each field
    var enteredDataForEmailArray:[[String]] = []
    
    var checkBoxViewPlaceholderArray:[[String]] = []
    var checkBoxViewEmailCollectionArray:[[String]] = [] //Stores Users Emails for each field of Name
    var checkBoxViewsTagCollectionArray:[[Int]] = [] //Stores Users Email Tag for each field
    var selectedDataForCheckBoxArray:[[Bool]] = []
    
    var tagValue = 0
    
    var nameFieldCount = 0
    var emailFieldCount = 0
    var checkBoxFieldCount = 0
    
    @IBOutlet weak var nameFieldCountLbl: UILabel!
    @IBOutlet weak var emailFieldCountLbl: UILabel!
    @IBOutlet weak var checkBoxFieldCountLbl: UILabel!
    
    @IBOutlet weak var finalMainDictionaryLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Flexiform View"
        
        self.finalMainDictionaryLbl.text = ""
        self.nameFieldCountLbl.text = "Count is: \(nameFieldCount)"
        self.emailFieldCountLbl.text = "Count is: \(emailFieldCount)"
        self.checkBoxFieldCountLbl.text = "Count is: \(checkBoxFieldCount)"
        
        nameViewsTagCollectionArray.removeAll()
        emailViewsTagCollectionArray.removeAll()
        checkBoxViewsTagCollectionArray.removeAll()
     
        var testArray = [nameViewPlaceholderArray,nameViewEmailCollectionArray,nameViewsTagCollectionArray,enteredDataForNameArray,emailViewPlaceholderArray,emailViewEmailCollectionArray,emailViewsTagCollectionArray,enteredDataForEmailArray,checkBoxViewPlaceholderArray,checkBoxViewEmailCollectionArray,checkBoxViewsTagCollectionArray,selectedDataForCheckBoxArray ] as [Any]
        
        dataToFillDictionary["Sample.pdf"] = testArray
        
        self.loadSomeViewToUpdateData()
    }
    
    func loadSomeViewToUpdateData() {
        
        var subNameViewPlaceholderArray:[String] = []
        var subNameViewEmailCollectionArray:[String] = []
        var subNameameViewsTagCollectionArray:[Int] = []
        var subEnteredDataForNameArray:[String] = []
        
        var subEmailViewPlaceholderArray:[String] = []
        var subEmailViewEmailCollectionArray:[String] = []
        var subEmailViewsTagCollectionArray:[Int] = []
        var subEnteredDataForEmailArray:[String] = []
        
        var subCheckBoxViewPlaceholderArray:[String] = []
        var subCheckBoxViewEmailCollectionArray:[String] = []
        var subCheckBoxViewsTagCollectionArray:[Int] = []
        var subSelectedDataForCheckBoxArray:[Bool] = []
        
        if var currentDocumentData:[Any] = dataToFillDictionary["Sample.pdf"] as? [Any] {
            
            var testNameViewPlaceholderArray:[[String]] = currentDocumentData[0] as! [[String]]
            var testNameViewEmailCollectionArray:[[String]] = currentDocumentData[1] as! [[String]]
            var testNameViewsTagCollectionArray:[[Int]] = currentDocumentData[2] as! [[Int]]
            var testEnteredDataForNameArray:[[String]] = currentDocumentData[3] as! [[String]]
            
            var testEmailViewPlaceholderArray:[[String]] = currentDocumentData[4] as! [[String]]
            var testEmailViewEmailCollectionArray:[[String]] = currentDocumentData[5] as! [[String]]
            var testEmailViewsTagCollectionArray:[[Int]] = currentDocumentData[6] as! [[Int]]
            var testEnteredDataForEmailArray:[[String]] = currentDocumentData[7] as! [[String]]
            
            var testCheckBoxViewPlaceholderArray:[[String]] = currentDocumentData[8] as! [[String]]
            var testCheckBoxViewEmailCollectionArray:[[String]] = currentDocumentData[9] as! [[String]]
            var testCheckBoxViewsTagCollectionArray:[[Int]] = currentDocumentData[10] as! [[Int]]
            var testSelectedDataForCheckBoxArray:[[Bool]] = currentDocumentData[11] as! [[Bool]]
            
            //if addOrNot {
                 //for _ in 1...totalPageOfPdf{
            //considering here as sample.pdf having only signle page
                     testNameViewPlaceholderArray.append(subNameViewPlaceholderArray)
                     testNameViewEmailCollectionArray.append(subNameViewEmailCollectionArray)
                     testNameViewsTagCollectionArray.append(subNameameViewsTagCollectionArray)
                     testEnteredDataForNameArray.append(subEnteredDataForNameArray)
            
                     testEmailViewPlaceholderArray.append(subEmailViewPlaceholderArray)
                     testEmailViewEmailCollectionArray.append(subEmailViewEmailCollectionArray)
                     testEmailViewsTagCollectionArray.append(subEmailViewsTagCollectionArray)
                     testEnteredDataForEmailArray.append(subEnteredDataForEmailArray)
            
                     testCheckBoxViewPlaceholderArray.append(subCheckBoxViewPlaceholderArray)
                     testCheckBoxViewEmailCollectionArray.append(subCheckBoxViewEmailCollectionArray)
                     testCheckBoxViewsTagCollectionArray.append(subCheckBoxViewsTagCollectionArray)
                     testSelectedDataForCheckBoxArray.append(subSelectedDataForCheckBoxArray)
                // }
            //}
            
            currentDocumentData[0] = testNameViewPlaceholderArray
            currentDocumentData[1] = testNameViewEmailCollectionArray
            currentDocumentData[2] = testNameViewsTagCollectionArray
            currentDocumentData[3] = testEnteredDataForNameArray
            
            currentDocumentData[4] = testEmailViewPlaceholderArray
            currentDocumentData[5] = testEmailViewEmailCollectionArray
            currentDocumentData[6] = testEmailViewsTagCollectionArray
            currentDocumentData[7] = testEnteredDataForEmailArray
            
            currentDocumentData[8] = testCheckBoxViewPlaceholderArray
            currentDocumentData[9] = testCheckBoxViewEmailCollectionArray
            currentDocumentData[10] = testCheckBoxViewsTagCollectionArray
            currentDocumentData[11] = testSelectedDataForCheckBoxArray
            
            self.dataToFillDictionary["Sample.pdf"] = currentDocumentData
        }
    }

    @IBAction func addNameFIeldClicked(_ sender: Any) {
        
        nameFieldCount = nameFieldCount + 1
        tagValue = tagValue + 1
        var docDic:[String:Any] = [:]
        
        docDic["placeholder"] = "name"
        docDic["userEmail"] = "arjun@yopmail.com"
        docDic["tagValue"] = tagValue
        docDic["enteredValue"] = ""
        //docDic["userIndex"] = indexPath.row //check later - this is for adding specific field for specific user //TODO
        
        //send notification to update the fields in self.dataToFillDictionary
        // docDic["Sample.pdf"] = self.dataToFillDictionary //test ignore it
        self.updateTheFieldsDictionary(fieldName: "name", emailValue: "arjun@yopmail.com", tagValue: tagValue, enteredValue: "", checkBoxChecked: false)
        
        self.nameFieldCountLbl.text = "\(nameFieldCount)"
    }

    @IBAction func addEmailFieldClicked(_ sender: Any) {
        
        emailFieldCount = emailFieldCount + 1
        tagValue = tagValue + 1
        var docDic:[String:Any] = [:]
        
        docDic["placeholder"] = "email"
        docDic["userEmail"] = "arjun@yopmail.com"
        docDic["tagValue"] = tagValue + 1
        docDic["enteredValue"] = ""
        
        self.updateTheFieldsDictionary(fieldName: "email", emailValue: "arjun@yopmail.com", tagValue: tagValue, enteredValue: "", checkBoxChecked: false)
        
        self.emailFieldCountLbl.text = "\(emailFieldCount)"
    }
    
    @IBAction func addCheckBoxClicked(_ sender: Any) {
        
        checkBoxFieldCount = checkBoxFieldCount + 1
        tagValue = tagValue + 1
        var docDic:[String:Any] = [:]
        
        docDic["placeholder"] = "checkbox"
        docDic["userEmail"] = "arjun@yopmail.com"
        docDic["tagValue"] = tagValue + 1
        docDic["enteredValue"] = ""
        
        self.updateTheFieldsDictionary(fieldName: "checkbox", emailValue: "arjun@yopmail.com", tagValue: tagValue, enteredValue: "", checkBoxChecked: false)
        
        self.checkBoxFieldCountLbl.text = "\(checkBoxFieldCount)"
    }
    
    func updateTheFieldsDictionary(fieldName:String,emailValue:String,tagValue:Int,enteredValue:String,checkBoxChecked:Bool) {
        
        //let indexValue = currenIndexForStoringDataFromCurrentPageNumber
        let indexValue = 0 //here this variable is nothing but current page number of pdf
        
        if fieldName == "name" {
            
            if var docValue:[Any] = self.dataToFillDictionary["Sample.pdf"] as? [Any] {
                
                var nameViewPlaceholderArray:[[String]] = docValue[0] as! [[String]]
                var subNameViewPlaceholderArray = nameViewPlaceholderArray[indexValue]
                subNameViewPlaceholderArray.append("name")
                nameViewPlaceholderArray[indexValue] = subNameViewPlaceholderArray
                docValue[0] = nameViewPlaceholderArray
                
                var nameViewEmailCollectionArray:[[String]] = docValue[1] as! [[String]]
                var subNameViewEmailCollectionArray = nameViewEmailCollectionArray[indexValue]
                subNameViewEmailCollectionArray.append(emailValue)
                nameViewEmailCollectionArray[indexValue] = subNameViewEmailCollectionArray
                docValue[1] = nameViewEmailCollectionArray
                
                var nameViewsTagCollectionArray:[[Int]] = docValue[2] as! [[Int]]
                var subNameViewsTagCollectionArray = nameViewsTagCollectionArray[indexValue]
                subNameViewsTagCollectionArray.append(tagValue)
                nameViewsTagCollectionArray[indexValue] = subNameViewsTagCollectionArray
                docValue[2] = nameViewsTagCollectionArray
                
                var enteredDataForNameArray:[[String]] = docValue[3] as! [[String]]
                var subEnteredDataForNameArray = enteredDataForNameArray[indexValue]
                subEnteredDataForNameArray.append(enteredValue)
                enteredDataForNameArray[indexValue] = subEnteredDataForNameArray
                docValue[3] = enteredDataForNameArray
                
                self.dataToFillDictionary["Sample.pdf"] = docValue
            }
        }
        else if fieldName == "email" {
            
            if var docValue:[Any] = self.dataToFillDictionary["Sample.pdf"] as? [Any] {
                
                var emailViewPlaceholderArray:[[String]] = docValue[4] as! [[String]]
                var subemailViewPlaceholderArray = emailViewPlaceholderArray[indexValue]
                subemailViewPlaceholderArray.append("email")
                emailViewPlaceholderArray[indexValue] = subemailViewPlaceholderArray
                docValue[4] = emailViewPlaceholderArray
                
                var emailViewEmailCollectionArray:[[String]] = docValue[5] as! [[String]]
                var subemailViewEmailCollectionArray = emailViewEmailCollectionArray[indexValue]
                subemailViewEmailCollectionArray.append(emailValue)
                emailViewEmailCollectionArray[indexValue] = subemailViewEmailCollectionArray
                docValue[5] = emailViewEmailCollectionArray
                
                var emailViewsTagCollectionArray:[[Int]] = docValue[6] as! [[Int]]
                var subemailViewsTagCollectionArray = emailViewsTagCollectionArray[indexValue]
                subemailViewsTagCollectionArray.append(tagValue)
                emailViewsTagCollectionArray[indexValue] = subemailViewsTagCollectionArray
                docValue[6] = emailViewsTagCollectionArray
                
                var enteredDataForemailArray:[[String]] = docValue[7] as! [[String]]
                var subEnteredDataForemailArray = enteredDataForemailArray[indexValue]
                subEnteredDataForemailArray.append(enteredValue)
                enteredDataForemailArray[indexValue] = subEnteredDataForemailArray
                docValue[7] = enteredDataForemailArray
                
                self.dataToFillDictionary["Sample.pdf"] = docValue
            }
            
        }
        else if fieldName == "checkbox" {
            
            if var docValue:[Any] = self.dataToFillDictionary["Sample.pdf"] as? [Any] {
                
                var checkboxViewPlaceholderArray:[[String]] = docValue[8] as! [[String]]
                var subcheckboxViewPlaceholderArray = checkboxViewPlaceholderArray[indexValue]
                subcheckboxViewPlaceholderArray.append("checkbox")
                checkboxViewPlaceholderArray[indexValue] = subcheckboxViewPlaceholderArray
                docValue[8] = checkboxViewPlaceholderArray
                
                var checkboxViewEmailCollectionArray:[[String]] = docValue[9] as! [[String]]
                var subcheckboxViewEmailCollectionArray = checkboxViewEmailCollectionArray[indexValue]
                subcheckboxViewEmailCollectionArray.append(emailValue)
                checkboxViewEmailCollectionArray[indexValue] = subcheckboxViewEmailCollectionArray
                docValue[9] = checkboxViewEmailCollectionArray
                
                var checkboxViewsTagCollectionArray:[[Int]] = docValue[10] as! [[Int]]
                var subcheckboxViewsTagCollectionArray = checkboxViewsTagCollectionArray[indexValue]
                subcheckboxViewsTagCollectionArray.append(tagValue)
                checkboxViewsTagCollectionArray[indexValue] = subcheckboxViewsTagCollectionArray
                docValue[10] = checkboxViewsTagCollectionArray
                
                var enteredDataForcheckboxArray:[[Bool]] = docValue[11] as! [[Bool]]
                var subEnteredDataForcheckboxArray = enteredDataForcheckboxArray[indexValue]
                subEnteredDataForcheckboxArray.append(checkBoxChecked)
                enteredDataForcheckboxArray[indexValue] = subEnteredDataForcheckboxArray
                docValue[11] = enteredDataForcheckboxArray
                
                self.dataToFillDictionary["Sample.pdf"] = docValue
                
            }
            
        }
        
    }
    
    @IBAction func navigateToFillDetails(_ sender: Any) {
        
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "FillDetailsVC") as! FillDetailsVC
        nextVC.dataToFillDictionary2 =  self.dataToFillDictionary
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}

