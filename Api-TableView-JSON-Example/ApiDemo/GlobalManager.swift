//
//  GlobalManager.swift
//  ApiDemo
//
//  Created by Mallikarjun on 18/07/18.
//  Copyright © 2018 aspl. All rights reserved.
//

import Foundation


class GlobalVariables {
    
    // These are the properties you can store in your singleton
    private var myName: String = "bob"
    
    var firstName:String?
    var lastName:String?
    var ticketNumber:String?
    var userName:String?
    var ticketStatus:String?
    var ticketId:String?
    
    
    
    // Here is how you would get to it without there being a global collision of variables.
    // , or in other words, it is a globally accessable parameter that is specific to the
    // class.
    class var sharedManager: GlobalVariables {
        struct Static {
            static let instance = GlobalVariables()
        }
        return Static.instance
    }
}
