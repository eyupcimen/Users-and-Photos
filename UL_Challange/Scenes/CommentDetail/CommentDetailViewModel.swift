//
//  CommentDetailViewModel.swift
//  UL_Challange
//
//  Created by eyup cimen on 18.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation

final class CommentDetailViewModel : BaseViewModel {
    
    var comment : PostComment!
    
    private let service : NetworkServiceProtocol
    
    init(service:NetworkServiceProtocol) {
        self.service = service
    }
    
}
