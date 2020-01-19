//
//  PhotosResponse.swift
//  UL_Challange
//
//  Created by eyup cimen on 18.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation
import SwiftyJSON

public class PhotosResponse : NSObject, NSCoding{
    
    var photos : [PhotoObject]!
    
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        photos = [PhotoObject]()
        let photoArray = json.arrayValue
        for photoJson in photoArray {
            let value = PhotoObject(fromJson: photoJson)
            photos.append(value)
        }
    }
    func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        
        if photos != nil{
        var photosElement = [[String:Any]]()
        for photoElement in photos {
            photosElement.append(photoElement.toDictionary())
        }
        dictionary["photos"] = photosElement
        }
        return dictionary
    }
    
    @objc required public init(coder aDecoder: NSCoder) {
        photos = aDecoder.decodeObject(forKey: "photos") as? [PhotoObject]
    }
    
    public func encode(with aCoder: NSCoder) {
        if photos != nil{
            aCoder.encode(photos, forKey: "photos")
        }
    }
}

