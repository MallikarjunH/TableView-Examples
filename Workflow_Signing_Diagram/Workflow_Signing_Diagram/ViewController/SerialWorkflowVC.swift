//
//  SerialWorkflowVC.swift
//  Workflow_Signing_Diagram
//
//  Created by EOO61 on 22/01/22.
//

import UIKit

class SerialWorkflowVC: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Serial Flow"
        self.mainTableView.reloadData()
    }

}

extension SerialWorkflowVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SerialWorkflowCell", for: indexPath) as! SerialWorkflowCell
        
        if indexPath.row == 0 {
            cell.topLineView.isHidden = true
        }else{
            cell.topLineView.isHidden = false
        }
        if indexPath.row == 4 {
            cell.bottomLineView.isHidden = true
        }else{
            cell.bottomLineView.isHidden = false
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
    
}
