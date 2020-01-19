//
//  UserPostResponse.swift
//  UL_Challange
//
//  Created by eyup cimen on 18.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation
import SwiftyJSON

public class UserPostResponse : NSObject, NSCoding{
    
    var posts : [UserPost]!
    
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        posts = [UserPost]()
        let postsArray = json.arrayValue
        for postsJson in postsArray {
            let value = UserPost(fromJson: postsJson)
            posts.append(value)
        }
    }
    func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        
        if posts != nil{
        var postsElement = [[String:Any]]()
        for postElement in posts {
            postsElement.append(postElement.toDictionary())
        }
        dictionary["posts"] = postsElement
        }
        return dictionary
    }
    
    @objc required public init(coder aDecoder: NSCoder) {
        posts = aDecoder.decodeObject(forKey: "posts") as? [UserPost]
    }
    
    public func encode(with aCoder: NSCoder) {
        if posts != nil{
            aCoder.encode(posts, forKey: "posts")
        }
    }
}

