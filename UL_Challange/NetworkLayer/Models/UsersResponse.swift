//
//  UsersResponse.swift
//  UL_Challange
//
//  Created by eyup cimen on 17.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation
import SwiftyJSON

public class UsersResponse : NSObject, NSCoding{
    
    var users : [UserObject]!
    
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        users = [UserObject]()
        let usersArray = json.arrayValue
        for usersJson in usersArray {
            let value = UserObject(fromJson: usersJson)
            users.append(value)
        }
    }
    func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        
        if users != nil{
        var dictionaryElements = [[String:Any]]()
        for addressesElement in users {
            dictionaryElements.append(addressesElement.toDictionary())
        }
        dictionary["users"] = dictionaryElements
        }
        return dictionary
    }
    
    @objc required public init(coder aDecoder: NSCoder) {
        users = aDecoder.decodeObject(forKey: "users") as? [UserObject]
    }
    
    public func encode(with aCoder: NSCoder) {
        if users != nil{
            aCoder.encode(users, forKey: "users")
        }
    }
}

