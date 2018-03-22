//
//  UserTurnCast.swift
//  Turncast
//
//  Created by Manu S. Stier on 22/3/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//

import Foundation
import FirebaseFirestore

final class UserTurnCast {
    
    var uid: String!
    var name: String!
    var surname: String!
    var email: String!
    var nickname: String?
    var telephoneNumer: Int?
    var country: String?
    
    
    
    
    
    init(_ uid: String!, _ name: String!, _ email: String!, _ surname: String!, _ nickname: String!){
        self.uid = uid
        self.name = name
        self.email = email
        self.surname = surname
        self.nickname = nickname
    }
    
    
    init(_ document: DocumentSnapshot){
        self.uid = document.documentID
        self.name = document.get("name") as? String ?? "name"
        self.surname = document.get("surname") as? String ?? "surname"
        self.nickname = document.get("nickname") as? String ?? "nickname"
        self.email = document.get("email") as? String ?? "email@email.com"
        self.telephoneNumer = document.get("telephoneNumber") as? Int ?? 0
        self.country = document.get("country") as? String ?? "no country"
        
        
    }
    
    
    
    
    
}
