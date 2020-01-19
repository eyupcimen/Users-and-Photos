//
//  Util.swift
//  UL_Challange
//
//  Created by eyup cimen on 17.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD
import ASProgressHud

class Util
{
    static var shared = Util()
    var router : AppRouter!
    var window = UIWindow()
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func showHud() {
        SVProgressHUD.show()
    }
    @objc func dismissLoading(recognizer: UITapGestureRecognizer) {
        removeHud()
    }
    func removeHud() {
        DispatchQueue.global(qos: .default).async {
            DispatchQueue.main.async {
                SVProgressHUD.dismiss()
            }
        }
    }
    
//    func showHud() {
//        let size : CGFloat = 80
//        let property = HudProperty(prefixName: "progress", frameNumber: 8, size: size, animationDuration: 1.5 , backgroundColor: UIColor.clear)
//        let show = ASProgressHud.showCustomHUDAddedTo(window , animated: true, property: property)
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissLoading))
//        show.addGestureRecognizer(tap)
//    }
//
//    @objc func dismissLoading(recognizer: UITapGestureRecognizer) {
//        removeHud()
//    }
//
//    func removeHud() {
//        _ = ASProgressHud.hideAllHUDsForView(window, animated: true)
//    }
}
