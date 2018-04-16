//
//  TC_Serv_Storage.swift
//  Turncast
//
//  Created by Manu S. Stier on 17/4/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//

import Foundation

struct TC_Serv_Storage {
    private let storageRef = Storage.storage().reference()
    
    var userProfileImagesRef : StorageReference {
        return storageRef.child("images").child("userProfile")
    }
    
    var podcastProfileImageRef : StorageReference {
        return storageRef.child("images").child("podcastProfile")
    }
    
    var chapterPodcastImageRef : StorageReference {
        return storageRef.child("images").child("chapterPodcast")
    }

    
    
    
    
}
