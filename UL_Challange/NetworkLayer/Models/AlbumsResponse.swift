//
//  AlbumsResponse.swift
//  UL_Challange
//
//  Created by eyup cimen on 18.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation
import SwiftyJSON

public class AlbumsResponse : NSObject, NSCoding{
    
    var albums : [AlbumObject]!
    
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        albums = [AlbumObject]()
        let albumArray = json.arrayValue
        for albumJson in albumArray {
            let value = AlbumObject(fromJson: albumJson)
            albums.append(value)
        }
    }
    func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        
        if albums != nil{
        var albumsElement = [[String:Any]]()
        for albumElement in albums {
            albumsElement.append(albumElement.toDictionary())
        }
        dictionary["albums"] = albumsElement
        }
        return dictionary
    }
    
    @objc required public init(coder aDecoder: NSCoder) {
        albums = aDecoder.decodeObject(forKey: "albums") as? [AlbumObject]
    }
    
    public func encode(with aCoder: NSCoder) {
        if albums != nil{
            aCoder.encode(albums, forKey: "albums")
        }
    }
}

