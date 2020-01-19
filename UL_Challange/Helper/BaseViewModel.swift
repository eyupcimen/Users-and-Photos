//
//  BaseViewModel.swift
//  UL_Challange
//
//  Created by eyup cimen on 17.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation

class BaseViewModel {
    
    var hudShow: Bool = false {
        didSet {
            self.updateLoadingStatus()
        }
    }
    
    init() {
        hudShow = false
    }
    
    func updateLoadingStatus()
    {
        if self.hudShow {
            Util.shared.showHud()
        }else {
            Util.shared.removeHud()
        }
    }
}
