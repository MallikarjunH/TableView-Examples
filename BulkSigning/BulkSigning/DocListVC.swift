//
//  DocListVC.swift
//  BulkSigning
//
//  Created by EOO61 on 02/01/24.
//

import UIKit

class DocListVC: UITableViewController,CheckBoxCellDelegate {
    
    var checkBoxIsSelectedArr:[Bool] = []
    
    let addButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("                                   Delete                                   ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .lightGray
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    
    let customView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "My Inbox"
        self.checkBoxIsSelectedArr = [false,false,false,false,false]
        
        // Add the button to the view
         view.addSubview(addButton)
        
        // Add constraints to position the button at the top of the view
        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -35),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 35), //30
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 45) // Adjust height as needed
        ])
        
        self.addButton.isHidden = true
    }
    
    //Target-action method for the button
    @objc func buttonTapped() {
        print("Button tapped!")
    }
    
}
extension DocListVC  {
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DocListCell", for: indexPath) as! DocListCell
        
        cell.checkBoxCellDelegate = self
        cell.checkBoxBtn.tag = indexPath.row
        
        if checkBoxIsSelectedArr[indexPath.row] == true {
            cell.checkBoxBtn.setImage(UIImage(named: "ic_check_box"), for: .normal)
        }else {
            cell.checkBoxBtn.setImage(UIImage(named: "ic_unselect_Checkbox"), for: .normal)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "DocDetailsVC") as! DocDetailsVC
        self.present(detailsVC, animated:true, completion:nil)
    }
    
    func customCell(cell: DocListCell, didTappedEdit button: UIButton) {
        print("Current Tag is: \(button.tag)")
        
        if self.checkBoxIsSelectedArr[button.tag] == false {
            self.checkBoxIsSelectedArr[button.tag] = true
        }else {
            self.checkBoxIsSelectedArr[button.tag] = false
        }
        
        //Update row
        let indexPathRow:Int = button.tag
        let indexPosition = IndexPath(row: indexPathRow, section: 0)
        tableView.reloadRows(at: [indexPosition], with: .none)
        
        if self.checkBoxIsSelectedArr.contains(true) {
            self.addButton.isHidden = false
        }else {
            self.addButton.isHidden = true
        }
    }
}
