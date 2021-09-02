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
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
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
                "display":"le français"
            ],
            [
                "value":"fr",
                "display":"le français"
            ],
            [
                "value":"fr",
                "display":"le français"
            ],
            [
                "value":"fr",
                "display":"le français"
            ]
        ]
        
        MultiPickerDialog().show(title: "  Select one or more Purpose",doneButtonTitle:"Done", cancelButtonTitle:"Cancel" ,options: pickerData, selected:  preSelectedValues) {
            values -> Void in
            print("callBack \(values)")
            self.preSelectedValues = values.compactMap {return $0["value"]}
            
            let displayValues = values.compactMap {return $0["display"]}
            //self.resultLabel.text = "Result = [\(displayValues.joined(separator: ", "))]"
            print("Result is : \("Result = [\(displayValues.joined(separator: ", "))]")")
        }
        
    }
    
}

