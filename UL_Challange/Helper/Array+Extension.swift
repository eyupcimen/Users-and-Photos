//
//  Array+Extension.swift
//  UL_Challange
//
//  Created by eyup cimen on 19.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation

public extension Array {
    
    public struct IndexOutOfBoundsError: Error { }
    
    public func element(at index: Int) throws -> Element {
        guard index >= 0 && index < self.count else {
            throw IndexOutOfBoundsError()
        }
        return self[index]
    }
}
