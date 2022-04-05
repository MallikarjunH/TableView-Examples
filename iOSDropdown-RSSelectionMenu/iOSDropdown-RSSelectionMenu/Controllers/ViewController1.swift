//
//  ViewController1.swift
//  iOSDropdown-RSSelectionMenu
//
//  Created by EOO61 on 18/05/21.
//

import UIKit
import SwiftMultiSelect

class ViewController1: UIViewController {

    var items:[SwiftMultiSelectItem] = [SwiftMultiSelectItem]()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        //Generate items
        createItems()
        
        //Se the correct data source type
        SwiftMultiSelect.dataSourceType = .custom
        
        //Register delegate
        SwiftMultiSelect.dataSource     = self
        SwiftMultiSelect.delegate       = self
    }
    

    @IBAction func showDropDownButtonAction(_ sender: Any) {
        
        SwiftMultiSelect.Show(to: self)

    }
   
    //Generate items
    func createItems() {
        let item = SwiftMultiSelectItem(
                //An incremental unique identifier
                row         : 0,
                //Title for first line
                title       : "Item 0",
                //Description line
                description : "i am description 0",
                //Image asset, shown if no imageURL has been set
                image       : UIImage(),
                //Url of remote image
                imageURL    : "",
                //Custom color, if not present a random color will be assigned
                color       : UIColor.gray,
                //Your custom data, Any object
                userInfo    : ["id" : 10]
        )
        
        items.append(item)
        items.append(item)
    }

}

extension ViewController1: SwiftMultiSelectDelegate, SwiftMultiSelectDataSource {
    
    func numberOfItemsInSwiftMultiSelect() -> Int {
        return items.count
    }
    
    func swiftMultiSelect(itemAtRow row: Int) -> SwiftMultiSelectItem {
        return items[row]
    }
    
   
    func userDidSearch(searchString: String) {
        print("User is looking for: \(searchString)")
    }

    //User did unselect an item
        func swiftMultiSelect(didUnselectItem item: SwiftMultiSelectItem) {
            print("row: \(item.title) has been deselected!")
        }

        //User did select an item
        func swiftMultiSelect(didSelectItem item: SwiftMultiSelectItem) {
            print("item: \(item.title) has been selected!")
        }

        //User did close controller with no selection
        func didCloseSwiftMultiSelect() {
            print("no items selected")
        }

        //User completed selection
        func swiftMultiSelect(didSelectItems items: [SwiftMultiSelectItem]) {

            print("you have been selected: \(items.count) items!")
            
            for item in items{
                print(item.string)
            }
            
       }

}
