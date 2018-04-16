//
//  TC_Serv_Cache.swift
//  Turncast
//
//  Created by Manu S. Stier on 17/4/18.
//  Copyright © 2018 CodeNationDev. All rights reserved.
//

import Foundation

struct TC_Serv_Cache {
    let cache = NSCache<NSString,UIImage>()
    
    func saveImage(_ objectID: String!, _ imageData: Data!){
        let image = UIImage(data: imageData)
        cache.setObject(image!, forKey: objectID! as NSString)
    }
    
    func loadImageByUUID(_ UUID: String!) -> UIImage? {
        
        guard let image = cache.object(forKey: UUID as NSString) else {
            return nil
        }
        return image
    }
}
