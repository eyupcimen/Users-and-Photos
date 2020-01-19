//
//  PostComment.swift
//  UL_Challange
//
//  Created by eyup cimen on 18.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation
import SwiftyJSON


public class PostComment  : NSObject, NSCoding{

    var body : String!
    var email : String!
    var id : Int!
    var name : String!
    var postId : Int!

    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        body = json["body"].stringValue
        email = json["email"].stringValue
        id = json["id"].intValue
        name = json["name"].stringValue
        postId = json["postId"].intValue
    }

    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if body != nil{
            dictionary["body"] = body
        }
        if email != nil{
            dictionary["email"] = email
        }
        if id != nil{
            dictionary["id"] = id
        }
        if name != nil{
            dictionary["name"] = name
        }
        if postId != nil{
            dictionary["postId"] = postId
        }
        return dictionary
    }

    @objc required public init(coder aDecoder: NSCoder)
    {
        body = aDecoder.decodeObject(forKey: "body") as? String
        email = aDecoder.decodeObject(forKey: "email") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        name = aDecoder.decodeObject(forKey: "name") as? String
        postId = aDecoder.decodeObject(forKey: "postId") as? Int
    }

    public func encode(with aCoder: NSCoder)
    {
        if body != nil{
            aCoder.encode(body, forKey: "body")
        }
        if email != nil{
            aCoder.encode(email, forKey: "email")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if postId != nil{
            aCoder.encode(postId, forKey: "postId")
        }
    }
}
