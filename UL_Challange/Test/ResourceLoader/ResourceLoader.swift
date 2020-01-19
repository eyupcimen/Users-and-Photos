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
    
    static func loadData(resource: UsersResource) throws -> Movie {
        
        let bundle = Bundle.test
        let url = try bundle.url(forResource: resource.rawValue, withExtension: "json").unwrap()
        let data = try Data(contentsOf: url)
        let decoder = Decoders.plainDateDecoder
        let movie = try decoder.decode(Movie.self, from: data)
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
