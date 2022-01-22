//
//  HomeVC.swift
//  Workflow_Signing_Diagram
//
//  Created by EOO61 on 22/01/22.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func viewSerialWorkflowButtonAction(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SerialWorkflowVC") as! SerialWorkflowVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func viewParallelWorkflowButtonAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ParallelWorkflowVC") as! ParallelWorkflowVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
