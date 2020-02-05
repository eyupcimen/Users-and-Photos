//
//  PhotoDetailViewModel.swift
//  UL_Challange
//
//  Created by eyup cimen on 19.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation

class PhotoDetailViewModel : BaseViewModel {
    
    var photo : PhotoObject!
    private let service : NetworkServiceProtocol
    
    init(service:NetworkServiceProtocol) {
        self.service = service
    }
}
