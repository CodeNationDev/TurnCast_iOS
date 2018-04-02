//
//  Message.swift
//  Turncast
//
//  Created by Manu S. Stier on 25/3/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//

import Foundation


final class Message {
//    var uidSender: UserTurnCast!
    var uid: String!
    var uidSender: String!
    var text: String!
    var timeCreate: Date!
    
    
    
    
    init(_ document: DocumentSnapshot!){
        self.uid = document.documentID
        self.uidSender = document.get("userUID") as! String
        self.text = document.get("message") as! String
//        self.timeCreate = document.get("time") as! Date
    }
    
    
    
    
    
}

