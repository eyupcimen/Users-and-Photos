//
//  UserCompany.swift
//  UL_Challange
//
//  Created by eyup cimen on 18.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation
import SwiftyJSON

public class UserCompany : NSObject, NSCoding{

    var bs : String!
    var catchPhrase : String!
    var name : String!

	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        bs = json["bs"].stringValue
        catchPhrase = json["catchPhrase"].stringValue
        name = json["name"].stringValue
	}

	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if bs != nil{
        	dictionary["bs"] = bs
        }
        if catchPhrase != nil{
        	dictionary["catchPhrase"] = catchPhrase
        }
        if name != nil{
        	dictionary["name"] = name
        }
		return dictionary
	}

    @objc required public init(coder aDecoder: NSCoder)
	{
		bs = aDecoder.decodeObject(forKey: "bs") as? String
		catchPhrase = aDecoder.decodeObject(forKey: "catchPhrase") as? String
		name = aDecoder.decodeObject(forKey: "name") as? String
	}

    public func encode(with aCoder: NSCoder)
	{
		if bs != nil{
			aCoder.encode(bs, forKey: "bs")
		}
		if catchPhrase != nil{
			aCoder.encode(catchPhrase, forKey: "catchPhrase")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
	}
}
