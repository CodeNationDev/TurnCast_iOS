//
//  TC_Serv_Channel.swift
//  Turncast
//
//  Created by Manu S. Stier on 23/3/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//

import Foundation

struct TC_Serv_Channel {
    
    private let servDB = TC_DB_Collection()

    private static let _shared = TC_Serv_Channel()

    static var shared: TC_Serv_Channel {
        return _shared
    }
    
    func createChannel(_ name: String!, _ completionHandler: @escaping CompletionBool) {
        let profile: ProfileAnyHashable = [
            "name":name,
            "owneruid":Auth.auth().currentUser!.uid,
            "creationDate": FieldValue.serverTimestamp(),
        ]
        
        servDB.channel.addDocument(data: profile) { (error) in
            if error != nil {
                completionHandler(error?.localizedDescription, false)
            } else {
                completionHandler(nil, true)
            }
        }
        
    }
}
