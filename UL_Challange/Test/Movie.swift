//
//  Movie.swift
//  EattUs
//
//  Created by eyup cimen on 18.12.2018.
//  Copyright © 2018 eyup cimen. All rights reserved.
//

import Foundation

import Foundation

public struct Movie : Codable {
    
    public enum CodingKeys: String , CodingKey {
        case artistName
        case releaseDate
        case name
        case copyright
        case image = "artworkUrl100"
        case genres
    }
    
    public let artistName : String
    public let releaseDate : Date
    public let name: String
    public let copyright: String?
    public let image: URL
    public let genres : [Genre]
    
}

public struct Genre : Codable {
    public let name : String
}
