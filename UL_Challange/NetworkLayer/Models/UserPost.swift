//
//  UserPost.swift
//  UL_Challange
//
//  Created by eyup cimen on 18.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation
import SwiftyJSON


public class UserPost  : NSObject, NSCoding{

    var body : String!
    var id : Int!
    var title : String!
    var userId : Int!

    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        body = json["body"].stringValue
        id = json["id"].intValue
        title = json["title"].stringValue
        userId = json["userId"].intValue
    }

    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if body != nil{
            dictionary["body"] = body
        }
        if id != nil{
            dictionary["id"] = id
        }
        if title != nil{
            dictionary["title"] = title
        }
        if userId != nil{
            dictionary["userId"] = userId
        }
        return dictionary
    }

    @objc required public init(coder aDecoder: NSCoder)
    {
        body = aDecoder.decodeObject(forKey: "body") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        title = aDecoder.decodeObject(forKey: "title") as? String
        userId = aDecoder.decodeObject(forKey: "userId") as? Int
    }

    public func encode(with aCoder: NSCoder)
    {
        if body != nil{
            aCoder.encode(body, forKey: "body")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        if userId != nil{
            aCoder.encode(userId, forKey: "userId")
        }
    }
}
