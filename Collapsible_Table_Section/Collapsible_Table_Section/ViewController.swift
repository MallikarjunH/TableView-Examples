//
//  ViewController.swift
//  Collapsible_Table_Section
//
//  Created by EOO61 on 03/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainTableView: UITableView!
    
    var headerTitleArray = ["Profile Details", "Signing Order"]
    var headerCollaped = [false,false]
    var profileDetailsArr = ["Name"]
    var signingOrderArr = ["1","2","3","4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mainTableView.tableFooterView = UIView()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        self.headerTitleArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if headerCollaped[section] == true {
            if section == 0 {
                return 1
            }else{
                return 4
            }
        }else{
            return 0
        }
        
        /*
        if section == 0 {
            if headerCollaped[section] == true {
                return 1
            }else{
                return 0
            }
        }else{
            if headerCollaped[section] == true {
                return 4
            }else{
                return 0
            }
        } */
        
        /*
        if section == 0 {
            return 1
        }else{
            return 4
        } */
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileDetailsTableViewCell", for: indexPath) as!  ProfileDetailsTableViewCell
            
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SigningOrderTableViewCell", for: indexPath) as!  SigningOrderTableViewCell
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            
            return 175.0
        }else{
            return 88.0
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as? HeaderTableViewCell else {
            return UIView()
        }
       
        cell.expandButton.tag = section
        cell.expandButton.addTarget(self, action: #selector(explandCollapseHeaderButtonClicked(sender:)), for: UIControl.Event.touchUpInside)
        
        return cell.contentView
    }
    
    @objc func explandCollapseHeaderButtonClicked(sender: UIButton!) {
        
        let collapsed = !headerCollaped[sender.tag]
        print("Tag Value: \(sender.tag)")
        
        // Toggle collapse
       headerCollaped[sender.tag] = collapsed
        
       mainTableView.reloadSections(NSIndexSet(index: sender.tag) as IndexSet, with: .automatic)
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50.0
    }
}
