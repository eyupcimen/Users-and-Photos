//
//  UserObject.swift
//  UL_Challange
//
//  Created by eyup cimen on 18.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation
import SwiftyJSON

public class UserObject : NSObject, NSCoding{

    var address : UserAddress!
    var company : UserCompany!
    var email : String!
    var id : Int!
    var name : String!
    var phone : String!
    var username : String!
    var website : String!

	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        let addressJson = json["address"]
        if !addressJson.isEmpty{
            address = UserAddress(fromJson: addressJson)
        }
        let companyJson = json["company"]
        if !companyJson.isEmpty{
            company = UserCompany(fromJson: companyJson)
        }
        email = json["email"].stringValue
        id = json["id"].intValue
        name = json["name"].stringValue
        phone = json["phone"].stringValue
        username = json["username"].stringValue
        website = json["website"].stringValue
	}

	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if address != nil{
        	dictionary["address"] = address.toDictionary()
        }
        if company != nil{
        	dictionary["company"] = company.toDictionary()
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
        if phone != nil{
        	dictionary["phone"] = phone
        }
        if username != nil{
        	dictionary["username"] = username
        }
        if website != nil{
        	dictionary["website"] = website
        }
		return dictionary
	}

    @objc required public init(coder aDecoder: NSCoder)
	{
		address = aDecoder.decodeObject(forKey: "address") as? UserAddress
		company = aDecoder.decodeObject(forKey: "company") as? UserCompany
		email = aDecoder.decodeObject(forKey: "email") as? String
		id = aDecoder.decodeObject(forKey: "id") as? Int
		name = aDecoder.decodeObject(forKey: "name") as? String
		phone = aDecoder.decodeObject(forKey: "phone") as? String
		username = aDecoder.decodeObject(forKey: "username") as? String
		website = aDecoder.decodeObject(forKey: "website") as? String
	}

    public func encode(with aCoder: NSCoder)
	{
		if address != nil{
			aCoder.encode(address, forKey: "address")
		}
		if company != nil{
			aCoder.encode(company, forKey: "company")
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
		if phone != nil{
			aCoder.encode(phone, forKey: "phone")
		}
		if username != nil{
			aCoder.encode(username, forKey: "username")
		}
		if website != nil{
			aCoder.encode(website, forKey: "website")
		}
	}
}
