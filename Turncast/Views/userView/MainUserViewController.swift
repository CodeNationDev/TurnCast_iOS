//
//  MainUserViewController.swift
//  Turncast
//
//  Created by Manu S. Stier on 24/3/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//

import UIKit

class MainUserViewController: UIViewController {

    
    @IBOutlet weak var userMailLBL: UILabel!
    @IBOutlet weak var userNickLBL: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageModify()
        
    }


    
    
    func imageModify(){
        userImage.layer.cornerRadius = userImage.frame.size.width / 2
        userImage.clipsToBounds = true
        userImage.layer.borderWidth = 3.0
//        userImage.layer.borderColor = (UIColor.cyan as! CGColor)
        
    }
    
    
    
    @IBAction func logOut(_ sender: Any) {
       
        
        do {
            try  Auth.auth().signOut()
            print("hecho el logout")
             self.dismiss(animated: true, completion: nil)
        } catch  {
            print("error intentado hacer logout")
            present(TC_errorAlertView("Ha ocurrido un error inesperado..."), animated: true, completion: nil)
        }
        
        
    }
    
    
    


}
