//
//  ViewController.swift
//  TableViewExpand + File Picker
//
//  Created by mallikarjun on 18/07/19.
//  Copyright © 2019 Mallikarjun H. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,UIImagePickerControllerDelegate{
    
    
     var selectedImage:UIImage? = nil
    
    var paramTOAdd:[String:Any] = ["claimType":"","claimTypeId":"","amount":"","documentType":"","documentName":"","documentData":"","documentSize":"","fileType":"","fileExtension":""]
    
    
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TablewViewCell1Id", for: indexPath) as! TablewViewCell1
            
             return cell
        }
        else if indexPath.section == 1{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TablewViewCell2Id", for: indexPath) as! TablewViewCell2
            
            return cell
        }
        else if indexPath.section == 2{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TablewViewCell3Id", for: indexPath) as! TablewViewCell3
            
            cell.uploadDocumentButton.addTarget(self, action: #selector(showUploadDocumentPopup(sender:)), for: .touchUpInside)
            
            return cell
        }
        else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TablewViewCell4Id", for: indexPath) as! TablewViewCell4
            
            return cell
        }
    }
    
    var selectedSection:Int = -1
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        
        if indexPath.section == 2{
            
            selectedSection = 1
            if let array = [indexPath] as? [IndexPath] {
                tableView.reloadRows(at: array, with: .fade)
            }
            return
        }else{
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
         if indexPath.section == 2{
            
            if selectedSection == 1{
                 return 105.0
            }else{
                  return 58.0
            }
           
        }
         else{
            
             return 58.0
        }
       
    }
    
    
    //MARK: Document, FIle, Image - Picker Upload
    

    
    @objc func showUploadDocumentPopup(sender:UIButton)
    {
        let alertController = UIAlertController(title: "Upload Document", message: "Tap to upload Documents", preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "Take Photo", style: .default) { (action) in
            self.openPhotoMedia(mediaType:"TakePhoto")
            //print("Default is pressed.....")
        }
        let action2 = UIAlertAction(title: "Upload Photo", style: .default) { (action) in
            
            // print("Cancel is pressed......")
            self.openPhotoMedia(mediaType:"UploadPhoto")
        }
        let action3 = UIAlertAction(title: "Upload Document", style: .default) { (action) in
            //print("Destructive is pressed....")
          //  self.openDocumentViewController()
            
        }
        let action4 = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            //print("Destructive is pressed....")
            
        }
        
        alertController.addAction(action1)
        alertController.addAction(action2)
        alertController.addAction(action3)
        alertController.addAction(action4)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    //photo media
    func openPhotoMedia(mediaType: String)
    {
        if (mediaType == "TakePhoto")
        {
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)
            {
                let imagePicker = UIImagePickerController()
                imagePicker.sourceType = UIImagePickerController.SourceType.camera;
                imagePicker.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
                
            }
        }
        else
        {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary;
            imagePicker.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        var image = info[.editedImage] as? UIImage
//        if image == nil {
//            image = info[.originalImage] as? UIImage
//        }
        //
//        selectedImage = image
//
        
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        let imgData = UIImageJPEGRepresentation(selectedImage, 0.1)
        let imgDataInData: NSData  =  NSData(data: UIImageJPEGRepresentation(selectedImage, 0.1)!)
        paramTOAdd["documentData"] = imgData
        let fileSize:Double =  Double(imgDataInData.length) / 1024.0 //image size in kb
        var fileName : String!
        // Added code to get file name
        
        
        paramTOAdd["fileType"] = "image"
        
        if let imgFileName = info[UIImagePickerControllerReferenceURL]
        {
            let url = imgFileName as? URL ?? URL(string: "")!
            let ext = url.absoluteString.components(separatedBy: "ext=")[1]
            print(ext)
            
            
            fileName = String(describing: url.lastPathComponent)
            paramTOAdd["documentName"] = fileName
            paramTOAdd["documentSize"] = fileSize
            
            uploadDocumentArray[3] = fileName
            paramTOAdd["fileExtension"] = ext
            //"fileType":"","fileExtension":""
        }
        else{
            fileName = "Camera Upload \(currentUpload + 1)"
            currentUpload += 1
            paramTOAdd["documentName"] = fileName
            paramTOAdd["documentSize"] = fileSize
            paramTOAdd["fileExtension"] = "jpeg"
            uploadDocumentArray[3] = fileName
        }
        
        
        self.mainTableView.reloadData()
        dismiss(animated: true, completion: nil)
        
    }
    
    
}

