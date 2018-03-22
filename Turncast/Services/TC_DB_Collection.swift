//
//  TC_DB_Collection.swift
//  Turncast
//
//  Created by Manu S. Stier on 22/3/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//


import Foundation
import FirebaseFirestore

class TC_DB_Collection {
    
    //    private static let _shared = Service_Database()
    
    //    let shared = _shared
    let mainDB = Firestore.firestore()
    
    
    var users : CollectionReference {
        return mainDB.collection("USERS")
    }
    
    var podcast : CollectionReference {
        return mainDB.collection("PODCAST")
    }
    
    var chapter : CollectionReference {
        return mainDB.collection("CHAPTER")
    }
    
}
