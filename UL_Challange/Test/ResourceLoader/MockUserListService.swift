//
//  MockUserListService.swift
//  UL_Challange
//
//  Created by eyup cimen on 19.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation

final class MockNetworkService : NetworkServiceProtocol {
    
    private var users: [UserObject] = []
    
    func getUsers(_ completion: @escaping (UsersResponse) -> Void, _ failure: @escaping (String) -> Void) {
        
    }
    
    func getUserPosts(_ userId: Int, _ completion: @escaping ([UserPost]) -> Void, _ failure: @escaping (String) -> Void) {
        
    }
    
    func getComments(_ postId: Int, _ completion: @escaping ([PostComment]) -> Void, _ failure: @escaping (String) -> Void) {
        
    }
    
    func getAlbums(_ completion: @escaping (AlbumsResponse) -> Void, _ failure: @escaping (String) -> Void) {
        
    }
    
    func getPhotos(_ albumId: Int, _ completion: @escaping (PhotosResponse) -> Void, _ failure: @escaping (String) -> Void) {
        
    }
}
