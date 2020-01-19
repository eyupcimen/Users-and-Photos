//
//  ResourceLoader.swift
//  EattUs
//
//  Created by eyup cimen on 18.12.2018.
//  Copyright © 2018 eyup cimen. All rights reserved.
//

import Foundation

class ResourceLoader {
    
    enum UsersResource: String {
        case users
    }
    
    static func loadData(resource: UsersResource) throws -> User {
        
        let bundle = Bundle.test
        let url = try bundle.url(forResource: resource.rawValue, withExtension: "json").unwrap()
        let data = try Data(contentsOf: url)
        let decoder = Decoders.plainDateDecoder
        let movie = try decoder.decode(User.self, from: data)
        return movie
    }
}

private extension Bundle {
    class Dummy { }
    static let test = Bundle(for: Dummy.self)
}

public enum Decoders {
    public static let plainDateDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
}


public struct User : Codable {
    
    public enum CodingKeys: String , CodingKey {
        case id
        case username
        case name
        case email
        case address
        case phone
        case website
        case company
    }
    
    public let id : Int
    public let username : String
    public let name: String
    public let email: String?
    public let address: Address
    public let phone: String
    public let website : String
    public let company : Company
}

public struct Address : Codable {
    
    public enum CodingKeys: String , CodingKey {
        case street
        case suite
        case city
        case zipcode
        case geo
    }
    public let street : String
    public let suite : String
    public let city : String
    public let zipcode : String
    public let geo : Geo
}

public struct Geo : Codable {
    
    public enum CodingKeys: String , CodingKey {
        case lat
        case lng
    }
    public let lat : String
    public let lng : String
}

public struct Company : Codable {
    
    public enum CodingKeys: String , CodingKey {
        case name
        case catchPhrase
        case bs
    }
    public let name : String
    public let catchPhrase : String
    public let bs : String
}
