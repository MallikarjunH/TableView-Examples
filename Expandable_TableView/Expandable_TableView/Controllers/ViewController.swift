//
//  ViewController.swift
//  Expandable_TableView
//
//  Created by EOO61 on 03/09/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sampleTableView: UITableView!
    
    var itemsArray = [DataModel]()
    var isExpanded = [Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Expandable TableView"
        sampleTableView.estimatedRowHeight = 60
        sampleTableView.rowHeight = UITableView.automaticDimension
        
        getData()
        setCellState()
        
    }

    func getData() {
        itemsArray = Data().items
    }
    
    func setCellState() {
        for _ in 0..<itemsArray.count {
            isExpanded.append(false)
        }
    }
    
    
    // Reload the tableview data when you rotate the device
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sampleTableView.reloadData()
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SampleTableViewCell", for: indexPath) as? SampleTableViewCell else { return UITableViewCell() }

        cell.set(content: self.itemsArray[indexPath.row], state: isExpanded[indexPath.row])

        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? SampleTableViewCell else { return }
        
        cell.answerLabel.text = self.itemsArray[indexPath.row].answer
        if isExpanded[indexPath.row] == true {
            
            // Remove Padding
            cell.answerLabel.paddingTop = 0
            cell.answerLabel.paddingBottom = 0
            
            // Hide the Answer Label
            cell.answerLabelHeight.constant = 0
            
            // The cell is collapsed
            isExpanded[indexPath.row] = false
        } else {
            
            // Add Padding
            cell.answerLabel.paddingTop = 8
            cell.answerLabel.paddingBottom = 8
            
            // Get the height of the Answer Label by calculating the string
            guard let stringHeight = self.itemsArray[indexPath.row].answer?.height(width: cell.answerLabel.frame.width - (cell.answerLabel.paddingLeft + cell.answerLabel.paddingRight), font: .systemFont(ofSize: 17, weight: .regular)) else { return }
            // Expand Answer Label
            cell.answerLabelHeight.constant = stringHeight + cell.answerLabel.paddingTop + cell.answerLabel.paddingBottom
            
            // The cell is expanded
            isExpanded[indexPath.row] = true
        }
        // Expand/Collapse the cell with animation (The smaller the number, the faster the cell will expand/collapse)
        UIView.animate(withDuration: 0.3) {
            tableView.beginUpdates()
            cell.layoutIfNeeded()
            tableView.endUpdates()
        }
    }
}

extension String {
    func height(width: CGFloat, font: UIFont) -> CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.text = self
        label.font = font
        label.sizeToFit()
        return label.frame.height
    }
}
