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
    
    func returnMessages(_ channel: String, _ completionHandler: @escaping CompletionMessages){
        var messages = [Message]()
        servDB.channel.document(channel).collection("messages").getDocuments(completion: { (snaps, error) in
            if error != nil {
                
            } else {
                for snap in snaps!.documents {
                    print("\(snap.documentID) => \(snap.data())")
                    let mes = Message(snap)
                    messages.append(mes)
                }
                completionHandler(nil, messages)
            }
        })
    }
    
    func newMessage(_ channel: String!, _ message: String!, _ userUID: String!, _ completionHandler: @escaping CompletionBool) {
        
        let profile: ProfileAnyHashable = [
            "message": message,
            "userUID": userUID,
            "time": FieldValue.serverTimestamp()
        ]
        servDB.channel.document(channel).collection("messages").document("\(Date().timeIntervalSince1970)-\(userUID!)").setData(profile) { (error) in
            if error != nil {
                completionHandler(error?.localizedDescription, false)
            } else {
                completionHandler(nil, true)
            }
        }
    }
    
    func messagesCollection(_ channel: String!) -> CollectionReference {
        return servDB.channel.document(channel).collection("messages")
    }
    
    
}
