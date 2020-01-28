//
//  DetailViewController.swift
//  ApiDemo
//
//  Created by Mallikarjun on 23/10/18.
//  Copyright © 2018 aspl. All rights reserved.
//

import UIKit
import JJFloatingActionButton
import FTPopOverMenu_Swift

class DetailViewController: UIViewController {

    
    @IBOutlet weak var ticketNumber: UILabel!
    
    @IBOutlet weak var clientName: UILabel!
    
    @IBOutlet weak var ticketStatus: UILabel!
    
    @IBOutlet weak var segmentedControlOutlet: UISegmentedControl!
  
    @IBOutlet weak var containerView: UIView!
    
    var currentViewController:UIViewController!
    
    //floating point button
    fileprivate let actionButton = JJFloatingActionButton()
    
    
    var menuOptionNameArray : [String] {
        return ["Share","Delete","Upload","Download","Share"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print(GlobalVariables.sharedManager.firstName!)
        print(GlobalVariables.sharedManager.ticketStatus!)
        print(GlobalVariables.sharedManager.ticketNumber!)
        print(GlobalVariables.sharedManager.ticketId!)
        
        
        self.currentViewController = self.storyboard?.instantiateViewController(withIdentifier: "ConversationViewControllerId") as! ConversationViewController
        self.currentViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.addChildViewController(self.currentViewController)
        self.addSubview(subView: self.currentViewController.view, parentView: self.containerView)
        
        
        let editImage    = UIImage(named: "edit")!
        let searchImage  = UIImage(named: "more")!
        
        let editButton   = UIBarButtonItem(image: editImage,  style: .plain, target: self, action: #selector(addTapped1) )
        
        let searchButton = UIBarButtonItem(image: searchImage,  style: .plain, target: self, action: #selector(handleAddBarButtonItem(_:event:)) )
        
        navigationItem.rightBarButtonItems = [editButton, searchButton]
        
        
        
        let actionButton = JJFloatingActionButton()
        
        actionButton.addItem(title: "Internal Note", image: UIImage(named: "First")?.withRenderingMode(.alwaysTemplate)) { item in
            // do something
            print("Clicked on Internal Notes")
            
            let internalNoteView = self.storyboard?.instantiateViewController(withIdentifier: "InternalNoteViewControllerId") as! InternalNoteViewController
            
            self.navigationController?.pushViewController(internalNoteView, animated: true)
            
        }
        
        actionButton.addItem(title: "Ticket Reply", image: UIImage(named: "Second")?.withRenderingMode(.alwaysTemplate)) { item in
            // do something
            print("Clicked on Ticket Reply")
            
            let replyTicketView = self.storyboard?.instantiateViewController(withIdentifier: "ReplyViewControllerId") as! ReplyViewController
            
            self.navigationController?.pushViewController(replyTicketView, animated: true)
            
        }
        
        
        actionButton.display(inViewController: self)
        
        actionButton.buttonColor = .blue //this is color of main button
       // actionButton.buttonImageColor = .white //this is color of main button
        actionButton.overlayView.backgroundColor = UIColor(white: 0, alpha: 0.3)
    
//        actionButton.layer.shadowColor = UIColor.black.cgColor
//        actionButton.layer.shadowOffset = CGSize(width: 0, height: 1)
//        actionButton.layer.shadowOpacity = Float(0.4)
//        actionButton.layer.shadowRadius = CGFloat(2)
        
        
    }
    
    @objc func handleAddBarButtonItem(_ sender: UIBarButtonItem, event: UIEvent) {
        
        FTPopOverMenu.showForEvent(event: event,
                                   with: menuOptionNameArray,
                                   menuImageArray: ["Favourite","Like","X","more","edit"],
                                   done: { (selectedIndex) -> () in
                                    
                                    print(selectedIndex)
                                    
        }) {
            
        }
        
    }
    
    @objc func addTapped1() {
        
        print("Clicked on edit")
        let editDetailView = self.storyboard?.instantiateViewController(withIdentifier: "EditTickerViewControllerId") as! EditTickerViewController
        
        self.navigationController?.pushViewController(editDetailView, animated: true)
        
        
    }
    
    @objc func addTapped2(sender:UIView)
    {
                print("Clcked on more")
        
                FTPopOverMenu.showForSender(sender: sender,
                                            with: ["Share"],
                                            menuImageArray: ["Favourite"],
                                            done: { (selectedIndex) -> () in
        
                                                print(selectedIndex)
                }) {
        
                }
        
    }
    
//    @objc func addTapped2(sender:UIButton) {
//         print("Clcked on more")
//
//        FTPopOverMenu.showForSender(sender: sender,
//                                    with: ["Share"],
//                                    menuImageArray: ["Favourite"],
//                                    done: { (selectedIndex) -> () in
//
//                                        print(selectedIndex)
//        }) {
//
//        }
//
//    }
    
    //func power(base: Int, exponent: Int)
    func addSubview(subView: UIView, parentView: UIView){
        
        parentView.addSubview(subView)
        
        // Create a new (key: string, value: string) dictionary
        var viewsDict: Dictionary = [String: String]()
        viewsDict["subView"] = "subView"
        
        var constraint = NSLayoutConstraint(item: subView,
                                            attribute: NSLayoutAttribute.top,
                                            relatedBy: NSLayoutRelation.equal,
                                            toItem: self.containerView,
                                            attribute: NSLayoutAttribute.top,
                                            multiplier: 1,
                                            constant: 0)
        
        self.view.addConstraint(constraint)
        
        
        constraint = NSLayoutConstraint(item: subView,
                                        attribute: NSLayoutAttribute.height,
                                        relatedBy: NSLayoutRelation.equal,
                                        toItem: self.containerView,
                                        attribute: NSLayoutAttribute.height,
                                        multiplier: 1,
                                        constant: 0)
        
        self.view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: subView,
                                        attribute: NSLayoutAttribute.leading,
                                        relatedBy: NSLayoutRelation.equal,
                                        toItem: self.containerView,
                                        attribute: NSLayoutAttribute.leading,
                                        multiplier: 1,
                                        constant: 0)
        
        self.view.addConstraint(constraint)
        
        
        constraint = NSLayoutConstraint(item: subView,
                                        attribute: NSLayoutAttribute.trailing,
                                        relatedBy: NSLayoutRelation.equal,
                                        toItem: self.containerView,
                                        attribute: NSLayoutAttribute.trailing,
                                        multiplier: 1,
                                        constant: 0)
        
        self.view.addConstraint(constraint)
        
        
    }
    
    @IBAction func segmentedControlAction(_ sender: Any) {
        
        if segmentedControlOutlet.selectedSegmentIndex==0{
            
            let newViewController:UIViewController = self.storyboard?.instantiateViewController(withIdentifier: "ConversationViewControllerId") as! ConversationViewController
            
            newViewController.view.translatesAutoresizingMaskIntoConstraints = false
            
            self.cycleFromViewController(oldViewController: self.currentViewController, newViewController: newViewController)
            self.currentViewController = newViewController
            
        }
        else{
            
            let newViewController:UIViewController = self.storyboard?.instantiateViewController(withIdentifier: "AnotherViewControllerId") as! AnotherViewController
            
            newViewController.view.translatesAutoresizingMaskIntoConstraints = false
            
            self.cycleFromViewController(oldViewController: self.currentViewController, newViewController: newViewController)
            
             self.currentViewController = newViewController
            
        }
        
        
    }
    
    func cycleFromViewController(oldViewController: UIViewController, newViewController:UIViewController) {
        
        oldViewController.willMove(toParentViewController: nil)
        
        self.addChildViewController(newViewController)
        self.addSubview(subView: newViewController.view, parentView: self.containerView)
        //newViewController.view.alpha = 0
        
        newViewController.view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.5, animations: {
            
         //   newViewController.view.alpha = 0
         //   oldViewController.view.alpha = 0
            
        }) { (BOOL) in
            
            oldViewController.view.removeFromSuperview()
            oldViewController.removeFromParentViewController()
            newViewController.didMove(toParentViewController: self)
        }
        
    }
    
    
    
}
