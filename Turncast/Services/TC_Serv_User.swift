//
//  TC_Serv_User.swift
//  Turncast
//
//  Created by Manu S. Stier on 22/3/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//

import Foundation


final class TC_Serv_User {
    
    private let servDB = TC_DB_Collection()
    
    func createUser(_ uidUser: String!, completionHandler: @escaping CompletionBool){
        
        let profile: ProfileAnyHashable = [
            "name":"your name",
            "surname":"your surname",
            "creationDate": FieldValue.serverTimestamp(),
            "email": (Auth.auth().currentUser?.email)!
        ]
        servDB.users.document(uidUser).setData(profile) { (error) in
            if let error = error {
                completionHandler(error.localizedDescription, false)
            } else {
                completionHandler(nil, true)
            }
        }
    }
    
    /// update in the document of the user only one label
    ///
    /// - Parameters:
    ///   - uidUser: uid of the user document
    ///   - label: propertie name
    ///   - data: data
    ///   - completionHandler: return true if is ok
    func updateLabel(_ uidUser: String!, _ label: String!, _ data: Any, completionHandler: @escaping CompletionBool){
        
        var profile = Profile()
        
        profile[label] = data
        profile["lastUpdated"] = FieldValue.serverTimestamp()
        
        servDB.users.document(uidUser).updateData(profile) { error in
            if let error = error {
                completionHandler(error.localizedDescription, false)
            } else {
                completionHandler(nil, true)
            }
        }
        
    }
    
    
    
    func getDataCurrentUser(_ uidUser: String!, completionHandler: @escaping CompletionUser){
        servDB.users.document(uidUser).getDocument { (document, error) in
            if let error = error {
                completionHandler(error.localizedDescription, nil)
            }
            let currentUser = UserTurnCast(document!)
            completionHandler(nil, currentUser)
        }
    }
    
    
    
    
    
    
}
