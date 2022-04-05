//
//  ViewController.swift
//  TestDropDownMultiSelect
//
//  Created by EOO61 on 18/05/21.
//

import UIKit

class ViewController: UIViewController {

    var preSelectedValues : [String] = []
    
    @IBOutlet weak var showButtonClicked: UIButton!
    
    @IBOutlet weak var selectedLanTitleLabel: UILabel!
    @IBOutlet weak var selectedLangValLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedLanTitleLabel.isHidden = true
        selectedLangValLabel.isHidden = true
        self.selectedLangValLabel.text = ""
    }
    
    @IBAction func showButtonAction(_ sender: Any) {
        
        let pickerData : [[String:String]] = [
            [
                "value":"en",
                "display":"English"
            ],
            [
                "value":"ar",
                "display":"العربية"
            ],
            [
                "value":"fr",
                "display":"Marathi"
            ],
            [
                "value":"fr",
                "display":"Hindi"
            ],
            [
                "value":"fr",
                "display":"Kannada"
            ],
            [
                "value":"fr",
                "display":"Nepali"
            ]
        ]
        
        MultiPickerDialog().show(title: "  Select one or more Language",doneButtonTitle:"Done", cancelButtonTitle:"Cancel" ,options: pickerData, selected:  preSelectedValues) {
            values -> Void in
            print("callBack \(values)")
            self.preSelectedValues = values.compactMap {return $0["value"]}
            
            let displayValues = values.compactMap {return $0["display"]}
            //self.resultLabel.text = "Result = [\(displayValues.joined(separator: ", "))]"
            print("Result is : \("Result = [\(displayValues.joined(separator: ", "))]")")
            
            if displayValues.count > 0 {
                self.selectedLanTitleLabel.isHidden = false
                self.selectedLangValLabel.isHidden = false
                self.selectedLangValLabel.text = "\(displayValues.joined(separator: ", "))"
            }
            
        }
        
    }
    
}

