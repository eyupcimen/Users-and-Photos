//
//  GenericTypes.swift
//  UL_Challange
//
//  Created by eyup cimen on 17.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation
import UIKit


class GenericViewController {
    static let shared = GenericViewController()
    func getVC<T>(_ storyboard : UIStoryboard ,_ identifier : String , _ viewController : T.Type ) -> T {
        let vc = storyboard.instantiateViewController(withIdentifier: "\(T.self)" ) as! T
        return vc
    }
}

func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
