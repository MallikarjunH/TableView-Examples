//
//  ViewController.swift
//  RSSelectionMenu-Example
//
//  Created by EOO61 on 20/01/22.
//


//https://medium.com/@rushisangani/implement-dropdown-menu-in-ios-using-rsselectionmenu-1b99284d0790


import UIKit
import RSSelectionMenu

class ViewController: UIViewController {

    let data: [String] = ["Jack", "Rob", "Michel", "Denial"]
    var selectedNames: [String] = []
    

    let simpleDataArray = ["Sachin", "Rahul", "Saurav", "Virat", "Suresh", "Ravindra", "Chris", "Steve", "Anil"]
    var simpleSelectedArray = [String]()
    var cellSelectionStyle: CellSelectionStyle = .tickmark
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func showPopUpButton(_ sender: Any) {
        
        
        /*
        /*
        // create menu with data source -> here [String] - Single Selection
        let menu = RSSelectionMenu(dataSource: data) { (cell, name, indexPath) in
            cell.textLabel?.text = name
        }
        */
        //multiple selection
        let menu = RSSelectionMenu(selectionStyle: .multiple, dataSource: data) { (cell, name, indexPath) in
            cell.textLabel?.text = name
        }
        
        // provide selected items
        menu.setSelectedItems(items: selectedNames) { (name, index, selected, selectedItems) in
            self.selectedNames = selectedItems
        }
        // show - Present
        menu.show(from: self)
        
        */
        
        self.showAsAlertController(style: .actionSheet, title: "Select Player", action: "Done", height: nil)
        
    }
    
    // MARK:- Alert or Actionsheet - You can also provide buttons as needed
    
    func showAsAlertController(style: UIAlertController.Style, title: String?, action: String?, height: Double?) {
        let selectionStyle: SelectionStyle = style == .alert ? .single : .multiple
        
        // create menu
        let selectionMenu =  RSSelectionMenu(selectionStyle: selectionStyle, dataSource: simpleDataArray) { (cell, name, indexPath) in
            cell.textLabel?.text = name
        }
        
        // provide selected items
        selectionMenu.setSelectedItems(items: simpleSelectedArray) { (text, index, isSelected, selectedItems) in
        }
        
        // on dismiss handler
        selectionMenu.onDismiss = { [weak self] items in
            
            self?.simpleSelectedArray = items
            
            if style == .alert {
                //self?.alertRowDetailLabel.text = items.first
                print("Selected Data: \(items.first)")
            }else {
               // self?.multiSelectActionSheetLabel.text = items.joined(separator: ", ")
                print("Selected Data: \(items.joined(separator: ", "))")
            }
           // self?.tableView.reloadData()
        }
        
        // cell selection style
        selectionMenu.cellSelectionStyle = self.cellSelectionStyle
        
        
        // show - with action (if provided)
        let menuStyle: PresentationStyle = style == .alert ? .alert(title: title, action: action, height: height) : .actionSheet(title: title, action: action, height: height)
        
        selectionMenu.show(style: menuStyle, from: self)
    }
    
}

