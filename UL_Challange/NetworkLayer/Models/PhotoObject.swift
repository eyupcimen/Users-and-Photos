//
//  PhotoObject.swift
//  UL_Challange
//
//  Created by eyup cimen on 18.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation
import SwiftyJSON


public class PhotoObject  : NSObject, NSCoding{

    var albumId : Int!
    var id : Int!
    var thumbnailUrl : String!
    var title : String!
    var url : String!

    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        albumId = json["albumId"].intValue
        id = json["id"].intValue
        thumbnailUrl = json["thumbnailUrl"].stringValue
        title = json["title"].stringValue
        url = json["url"].stringValue
    }

    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if albumId != nil{
            dictionary["albumId"] = albumId
        }
        if id != nil{
            dictionary["id"] = id
        }
        if thumbnailUrl != nil{
            dictionary["thumbnailUrl"] = thumbnailUrl
        }
        if title != nil{
            dictionary["title"] = title
        }
        if url != nil{
            dictionary["url"] = url
        }
        return dictionary
    }

    @objc required public init(coder aDecoder: NSCoder)
    {
        albumId = aDecoder.decodeObject(forKey: "albumId") as? Int
        id = aDecoder.decodeObject(forKey: "id") as? Int
        thumbnailUrl = aDecoder.decodeObject(forKey: "thumbnailUrl") as? String
        title = aDecoder.decodeObject(forKey: "title") as? String
        url = aDecoder.decodeObject(forKey: "url") as? String
    }

    public func encode(with aCoder: NSCoder)
    {
        if albumId != nil{
            aCoder.encode(albumId, forKey: "albumId")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if thumbnailUrl != nil{
            aCoder.encode(thumbnailUrl, forKey: "thumbnailUrl")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        if url != nil{
            aCoder.encode(url, forKey: "url")
        }
    }
}
