//
//  NewFile+Extension.swift
//  UL_Challange
//
//  Created by eyup cimen on 19.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation

public extension Optional {
    
    public struct FoundNilWhileUnwrappingError: Error { }
    
    public func unwrap() throws -> Wrapped {
        switch self {
        case .some(let wrapped):
            return wrapped
        case .none:
            throw FoundNilWhileUnwrappingError()
        }
    }
}
