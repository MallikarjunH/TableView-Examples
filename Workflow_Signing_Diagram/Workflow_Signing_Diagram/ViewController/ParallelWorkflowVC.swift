//
//  ParallelWorkflowVC.swift
//  Workflow_Signing_Diagram
//
//  Created by EOO61 on 22/01/22.
//

import UIKit

class ParallelWorkflowVC: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Parallel Flow"
        self.mainTableView.reloadData()
    }
    
}

extension ParallelWorkflowVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ParallelWorkflowCell", for: indexPath) as! ParallelWorkflowCell
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ParallelWorkflowCell2", for: indexPath) as! ParallelWorkflowCell2
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
    
}
