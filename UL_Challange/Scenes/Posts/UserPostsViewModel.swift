//
//  UserPostsViewModel.swift
//  UL_Challange
//
//  Created by eyup cimen on 18.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation

final class UserPostsViewModel : BaseViewModel {
    
    private let service : NetworkServiceProtocol
    var posts : [UserPost] = []
    var userId : Int = 0
    
    init(service:NetworkServiceProtocol) {
        self.service = service
    }
    
    func getUserPosts (_ userId : Int, _ completion: @escaping () -> Void , _ failure : @escaping (String) -> Void ) {
        
        hudShow = true
        service.getUserPosts(userId, { (response) in
            self.hudShow = false
            self.posts = response
            completion()
            
        }) { (err) in
            self.hudShow = false
            print(err)
        }
    }
}
