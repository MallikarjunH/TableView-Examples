//
//  ViewController.swift
//  Search + Tags
//
//  Created by mallikarjun on 02/07/19.
//  Copyright © 2019 Mallikarjun H. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate {

    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var symptomSampleText: UILabel!
    
    @IBOutlet weak var searchTableView: UITableView!
    
    @IBOutlet weak var collectionViewInstance: UICollectionView!
    var selectedSymptom = ""
    
    var healthToolsNamesArray = ["Body Fat Calculator","Height Predictor","Symptom Checker","Activity","Calorie","Logs Checker","Baby ","Reminder Table","Calender"]
   // let healthToolsNamesArray = ["Body","Height","Symptom","Activity T","Calorie","Logs","Baby ","Reminder","Calender"]
    
    var symptomArray = ["test"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionViewInstance.isHidden = true
        searchTableView.isHidden = true
        
        self.searchView.layer.cornerRadius = 3.0
        self.searchView.clipsToBounds = true
    
     //   collectionViewInstance.register(CollectionviewCell.self, forCellWithReuseIdentifier: "cell2")
        symptomSampleText.textColor = UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 0.70)
        symptomSampleText.text = "Add as many Symptoms as you can for the most accurate results"
        collectionViewInstance.backgroundColor = UIColor(red: 0.95, green: 0.96, blue: 0.97, alpha: 1)
    }
    
    //MARK: TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return healthToolsNamesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellNewId", for: indexPath) as! TableViewCellNew
        
        cell.symptomLabel.text = healthToolsNamesArray[indexPath.row]
       
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedSymptom = healthToolsNamesArray[indexPath.row]
        
        if !selectedSymptom.isEmpty{
           
            updateViewInTheVC()
        }
        else{
            
        }
    }
    
    func updateViewInTheVC(){
        
        DispatchQueue.main.async {
            self.searchTextField.text = self.selectedSymptom
             self.searchTableView.isHidden = true
             self.symptomArray.append(self.selectedSymptom)
             self.collectionViewInstance.isHidden = false
             self.collectionViewInstance.reloadData()
            
        }
    }
     //MARK: Collection Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
       // print(symptomArray)
        return healthToolsNamesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
      
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellTestId", for: indexPath) as! CollectionViewCellTest
        
         cell.contentView.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1)
         cell.testLabel.text = healthToolsNamesArray[indexPath.item]
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("Clicked on :\(indexPath.item) item and Value is: \(healthToolsNamesArray[indexPath.item])")
        healthToolsNamesArray.remove(at:indexPath.item)
        collectionViewInstance.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
       /* var cellSize: CGSize
        
        let screenRect = collectionViewInstance.bounds
        let screenWidth = screenRect.size.width - 30
        
        cellSize = CGSize(width: screenWidth / 3.0, height: 35)
        
        return cellSize */
        // return CGSize(width: CGFloat((collectionView.frame.size.width / 3) - 20), height: CGFloat(100))
        
        let label = UILabel(frame: CGRect.zero)
        label.text = healthToolsNamesArray[indexPath.item]
        label.sizeToFit()
        return CGSize(width: label.frame.width + 20 , height: 40)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top:0, left: 2, bottom: 2, right: 2)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.searchTableView.isHidden = true
        self.collectionViewInstance.isHidden = false
        return true
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        symptomSampleText.isHidden = true
        self.searchTableView.isHidden = false
        self.collectionViewInstance.isHidden = true
        return true
    }
}

