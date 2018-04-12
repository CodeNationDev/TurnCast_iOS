//
//  LoginViewController.swift
//  Turncast
//
//  Created by Manu S. Stier on 21/3/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//

import UIKit
import GoogleSignIn


class LoginViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate  {

    

    @IBOutlet weak var user1BTN: UIButton!
    @IBOutlet weak var user2BTN: UIButton!
    @IBOutlet weak var userMailTXF: UITextField!
    @IBOutlet weak var userNicknameTXF: UITextField!
    @IBOutlet weak var userPassTXF: UITextField!
    @IBOutlet weak var loginBTN: UIButton!
    @IBOutlet weak var blur: UIVisualEffectView!
    @IBOutlet var newUserPopUp: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "showMain", sender: nil)
        }
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

    @IBAction func showNewUserPopUp(_ sender: Any) {
        
        animatePopUp()
    }
    
    
    @IBAction func cancelNewUserPopUp(_ sender: Any) {
        animateOutPopUp()
    }
    
    
    // MARK: -
    // MARK: Modal Elements
    // MARK: -
    
    // MARK: Modal functions
    func animatePopUp(){
        blur.isHidden = false
        blur.alpha = 0
        self.view.addSubview(newUserPopUp)
        newUserPopUp.center = self.view.center
        newUserPopUp.transform = CGAffineTransform.init(scaleX: 1.4, y: 1.4)
        newUserPopUp.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.blur.alpha = 1
            self.newUserPopUp.alpha = 1
            self.newUserPopUp.transform = CGAffineTransform.identity
        }
    }
    
    func animateOutPopUp(){
        UIView.animate(withDuration: 0.4, animations: {
            self.newUserPopUp.transform = CGAffineTransform.init(scaleX: 1.4, y: 1.4)
            self.newUserPopUp.alpha = 0
            self.blur.alpha = 0
        }) { (success) in
            self.blur.isHidden = true
            self.newUserPopUp.removeFromSuperview()
        }
    }
    
    
    // MARK: -
    
    // MARK: Modal Outlets
    @IBOutlet weak var txModalEmail: UITextField!
    @IBOutlet weak var txModalRepeatEmail: UITextField!
    @IBOutlet weak var txModalPass: UITextField!
    @IBOutlet weak var txModalRepeatPass: UITextField!
    
    //MARK: -
    
    // MARK: Modal Actions
    @IBAction func btModalCreateClick(_ sender: Any) {
        
        if !comprobeCreateUser() { return }
        
        TC_Serv_Auth().createUser(txModalEmail.text, txModalPass.text) { (error, user) in
            
            
            
            if error == nil { print("Usuario creado!!!")
              let alert = TC_errorAlertView("¡Usuario creado!")
                self.present(alert, animated: true, completion: nil)
                self.animateOutPopUp()
                self.performSegue(withIdentifier: "showMain", sender: nil)
            }
            else
            { print(error as Any)}
        }
        
    }
    
    
    /// Comprueba los valores insertados en el PopUp de creación de usuario
    ///
    /// - Returns: false o true (esa es la cuestón)
    private func comprobeCreateUser() -> Bool {
        if(!isValidEmail(test: txModalEmail.text!)){
            present(TC_errorAlertView("inserta un email válido"), animated: true, completion: nil)
            return false
            
        }
        if(txModalEmail.text != txModalRepeatEmail.text){
            present(TC_errorAlertView("Introduce el mismo mail"), animated: true, completion: nil)
            txModalRepeatEmail.text = ""
            return false
        }
        
        if((txModalPass.text?.count)!<6){
            present(TC_errorAlertView("Mínimo 6 caracteres para la contraseña"), animated: true, completion: nil)
            return false
        }
        if(txModalPass.text != txModalRepeatPass.text){
            present(TC_errorAlertView("Introduce la misma contraseña"), animated: true, completion: nil)
            txModalRepeatPass.text = ""
            return false
        }
        return true
    }
    
    
    
    
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error.localizedDescription)
            present(TC_errorAlertView(error.localizedDescription), animated: true, completion: nil)
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        Auth.auth().signIn(with: credential) { (user, error) in
            if let error = (error as NSError?){
                print(error.localizedDescription)
                self.present(TC_errorAlertView(error.localizedDescription), animated: true, completion: nil)
                return
            }
        
           
            self.performSegue(withIdentifier: "showMain", sender: nil)
        }
    }
    
    @IBAction func googleButtonPressed(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
        
    }
    
}
