//
//  TC_Serv_Auth.swift
//  Turncast
//
//  Created by Manu S. Stier on 21/3/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//

import Foundation


class TC_Serv_Auth {
    
    private static let _shared = TC_Serv_Auth()
    
    static var shared: TC_Serv_Auth {
        return _shared
    }
    
    
    
    /// Crea usuario en la DB de authentition de Firebase
    ///
    /// - Parameters:
    ///   - email: email válido
    ///   - psswd: password
    ///   - completionHandler: devuelve un String(Error) o  user (firebase)
    func createUser(_ email: String!, _ psswd: String!, completionHandler: @escaping CompletionUserFirebase){
        
        Auth.auth().createUser(withEmail: email, password: psswd) { (user, error) in
            
            if let error = (error as NSError?){
                completionHandler(error.localizedDescription, nil)
            }
            if user?.uid != nil {
                //se ha creado el user así que lo introducimos en la DB
                self.createProfile(user!)
                self.loginUser(email, psswd, completionHandler: { (error, user) in
                    if error != nil {
                        completionHandler(error, nil)
                    } else {
                        completionHandler(nil, user)
                    }
                })
            }
        }
    }
    
    
    private func createProfile(_ user: User!){
        TC_Serv_User().createUser(user.uid) { (error, bool) in
            if error != nil {
                //volvemos a hacer la llamada ?? así nos aseguramos que se crea... pero podría estar así para siempre si hay algún error...
                self.createProfile(user)
                print(error!)
            }
        }
    }
    
    
    
    /// Realiza el login hacia los usuarios de Firebase con mail y pass
    ///
    /// - Parameters:
    ///   - email: email
    ///   - psswd: contraseña
    ///   - completionHandler: devuelve un String(Error) o  user (firebase)
    func loginUser(_ email: String!, _ psswd: String!, completionHandler: @escaping CompletionUserFirebase){
        Auth.auth().signIn(withEmail: email, password: psswd) { (user, error) in
            if let error = (error as NSError?){
                completionHandler(error.localizedDescription, nil)
            } else {
                completionHandler(nil, user)
            }
        }
    }
    
    
    
    
    
    
}
