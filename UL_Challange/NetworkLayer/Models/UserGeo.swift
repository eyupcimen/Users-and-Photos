//
//  UserGeo.swift
//  UL_Challange
//
//  Created by eyup cimen on 18.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation
import SwiftyJSON

public class UserGeo : NSObject, NSCoding{

    var lat : String!
    var lng : String!

	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        lat = json["lat"].stringValue
        lng = json["lng"].stringValue
	}

	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if lat != nil{
        	dictionary["lat"] = lat
        }
        if lng != nil{
        	dictionary["lng"] = lng
        }
		return dictionary
	}

    @objc required public init(coder aDecoder: NSCoder)
	{
		lat = aDecoder.decodeObject(forKey: "lat") as? String
		lng = aDecoder.decodeObject(forKey: "lng") as? String
	}

    public func encode(with aCoder: NSCoder)
	{
		if lat != nil{
			aCoder.encode(lat, forKey: "lat")
		}
		if lng != nil{
			aCoder.encode(lng, forKey: "lng")
		}
	}
}
