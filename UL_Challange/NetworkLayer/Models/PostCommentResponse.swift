//
//  PostCommentsResponse.swift
//  UL_Challange
//
//  Created by eyup cimen on 18.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//
 
import Foundation
import SwiftyJSON

public class PostCommentResponse : NSObject, NSCoding{
    
    var comments : [PostComment]!
    
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        comments = [PostComment]()
        let commentArray = json.arrayValue
        for commentsJson in commentArray {
            let value = PostComment(fromJson: commentsJson)
            comments.append(value)
        }
    }
    func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        
        if comments != nil{
        var commentsElement = [[String:Any]]()
        for commentElement in comments {
            commentsElement.append(commentElement.toDictionary())
        }
        dictionary["comments"] = commentsElement
        }
        return dictionary
    }
    
    @objc required public init(coder aDecoder: NSCoder) {
        comments = aDecoder.decodeObject(forKey: "comments") as? [PostComment]
    }
    
    public func encode(with aCoder: NSCoder) {
        if comments != nil{
            aCoder.encode(comments, forKey: "comments")
        }
    }
}
