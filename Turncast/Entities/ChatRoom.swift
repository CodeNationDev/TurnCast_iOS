//
//  ChatRoom.swift
//  Turncast
//
//  Created by Manu S. Stier on 25/3/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//

import Foundation



final class ChatRoom  {
    var uid: String!
    var uidChannel: String!
    var uidPodcast: String!
    var messages: [Message]?
    
    
    
    
    init(_ document: DocumentSnapshot){
        self.uid = document.documentID
        self.uidChannel = document.get("uidChannel") as! String
        self.uidPodcast = document.get("uidPodcast") as! String
        
    }
    
    
}
