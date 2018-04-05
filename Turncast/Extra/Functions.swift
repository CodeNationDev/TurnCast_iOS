//
//  Functions.swift
//  Turncast
//
//  Created by Manu S. Stier on 21/3/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//

import Foundation
import UIKit



/**
 Verify if is a valid email
 @param: email
 */
public func isValidEmail(test: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: test)
}



public func TC_errorAlertView(_ message: String!) -> UIAlertController{
    let alertVC = UIAlertController(title: "ERROR", message: message, preferredStyle: .alert)
    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    alertVC.addAction(defaultAction)
    return alertVC
}

public func loginFirebase(user: String, pass: String) -> String{
    
    var result = ""
    
    TC_Serv_Auth().loginUser(user, pass) { (error, user) in
        if error == nil {
            result = "OK"
        }
        else {
            print(error as Any)
            result = error!
        }
    }
    return result
}



