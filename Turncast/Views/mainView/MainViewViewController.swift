//
//  MainViewViewController.swift
//  Turncast
//
//  Created by Manu S. Stier on 23/3/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//

import UIKit

class MainViewViewController: UIViewController {

    
    @IBOutlet weak var emailUserLBL: UILabel!
    
    @IBOutlet weak var newTextTF: UITextField!
    @IBOutlet weak var sendTextBTN: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        guard let usermail = Auth.auth().currentUser?.email else {
            emailUserLBL.text = "¿dónde está el usuario?"
            return
        }
        
        emailUserLBL.text = usermail
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
