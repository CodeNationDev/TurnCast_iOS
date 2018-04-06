//
//  LoginViewController.swift
//  Turncast
//
//  Created by Manu S. Stier on 21/3/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {

    @IBOutlet weak var user1BTN: UIButton!
    @IBOutlet weak var user2BTN: UIButton!
    @IBOutlet weak var userMailTXF: UITextField!
    @IBOutlet weak var userNicknameTXF: UITextField!
    @IBOutlet weak var userPassTXF: UITextField!
    @IBOutlet weak var loginBTN: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        //Código al pulsar el botón acceder.
        let usermail = userMailTXF.text
        let pass = userPassTXF.text
        
        if(!isValidEmail(test: usermail!)){return}
        if((pass?.count)!<6){return}
        TC_Serv_Auth().loginUser(usermail, pass) { (error, user) in
            if error == nil {
                self.performSegue(withIdentifier: "showMain", sender: nil)
            }
            else {
                print(error as Any)
            }
        }
        
    }
    
    @IBAction func doLogin(_ sender: UIButton) {
        var user = ""
        if sender == user1BTN {
            user = "prueba@prueba.com"
        } else if sender == user2BTN {
            user = "pruebasssss@prueba.com"
        }
        
        let pass = "prueba"
        
        TC_Serv_Auth().loginUser(user, pass) { (error, user) in
            if error == nil {
                self.performSegue(withIdentifier: "showMain", sender: nil)
            }
            else {
                print(error as Any)
            }
        }
        
    }

}
