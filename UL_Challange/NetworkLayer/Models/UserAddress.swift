//
//  UserAddress.swift
//  UL_Challange
//
//  Created by eyup cimen on 18.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation
import SwiftyJSON

public class UserAddress : NSObject, NSCoding{

    var city : String!
    var geo : UserGeo!
    var street : String!
    var suite : String!
    var zipcode : String!

	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        city = json["city"].stringValue
        let geoJson = json["geo"]
        if !geoJson.isEmpty{
            geo = UserGeo(fromJson: geoJson)
        }
        street = json["street"].stringValue
        suite = json["suite"].stringValue
        zipcode = json["zipcode"].stringValue
	}

	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if city != nil{
        	dictionary["city"] = city
        }
        if geo != nil{
        	dictionary["geo"] = geo.toDictionary()
        }
        if street != nil{
        	dictionary["street"] = street
        }
        if suite != nil{
        	dictionary["suite"] = suite
        }
        if zipcode != nil{
        	dictionary["zipcode"] = zipcode
        }
		return dictionary
	}

    @objc required public init(coder aDecoder: NSCoder)
	{
		city = aDecoder.decodeObject(forKey: "city") as? String
		geo = aDecoder.decodeObject(forKey: "geo") as? UserGeo
		street = aDecoder.decodeObject(forKey: "street") as? String
		suite = aDecoder.decodeObject(forKey: "suite") as? String
		zipcode = aDecoder.decodeObject(forKey: "zipcode") as? String
	}

    public func encode(with aCoder: NSCoder)
	{
		if city != nil{
			aCoder.encode(city, forKey: "city")
		}
		if geo != nil{
			aCoder.encode(geo, forKey: "geo")
		}
		if street != nil{
			aCoder.encode(street, forKey: "street")
		}
		if suite != nil{
			aCoder.encode(suite, forKey: "suite")
		}
		if zipcode != nil{
			aCoder.encode(zipcode, forKey: "zipcode")
		}
	}
}
