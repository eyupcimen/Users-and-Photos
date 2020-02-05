//
//  Navıgation+Extension.swift
//  UL_Challange
//
//  Created by Eyup on 21.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    
    func openController(from storyboard: UIStoryboard, withIdentifier identifier: String, animated: Bool = true) {
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        pushViewController(viewController, animated: animated)
    }
}

