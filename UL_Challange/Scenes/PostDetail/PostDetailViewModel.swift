//
//  PostDetailViewModel.swift
//  UL_Challange
//
//  Created by eyup cimen on 18.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation

final class PostDetailViewModel : BaseViewModel {
    
    var post : UserPost!
    var comments : [PostComment] = []
    
    private let service : NetworkServiceProtocol
    
    init(service:NetworkServiceProtocol) {
        self.service = service
    }
    
    func getPostComments (_ postId : Int, _ completion: @escaping () -> Void , _ failure : @escaping (String) -> Void ) {
        
        hudShow = true
        service.getComments(postId, { (response) in
            self.hudShow = false
            self.comments = response
            completion()
            
        }) { (err) in
            self.hudShow = false
            print(err)
        }
    }
}
