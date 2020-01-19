//
//  NetworkService.swift
//  UL_Challange
//
//  Created by eyup cimen on 17.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation
import SwiftyJSON


public enum Result<Value> {
    case success(Value)
    case failure(Error)
}


public protocol NetworkServiceProtocol {
    
    func getUsers( _ completion:@escaping (UsersResponse) -> Void, _ failure : @escaping (String) -> Void )
    func getUserPosts(_ userId: Int, _ completion:@escaping ([UserPost]) -> Void, _ failure : @escaping (String) -> Void )
    func getComments(_ postId: Int, _ completion:@escaping ([PostComment]) -> Void, _ failure : @escaping (String) -> Void )
    func getAlbums( _ completion:@escaping (AlbumsResponse) -> Void, _ failure : @escaping (String) -> Void )
    func getPhotos(_ albumId:Int, _ completion:@escaping (PhotosResponse) -> Void, _ failure : @escaping (String) -> Void )
}

public class NetworkService : NetworkServiceProtocol {
    
    enum Error : Swift.Error {
        case serilizationError(internal:Swift.Error)
        case networkError(internal:Swift.Error)
    }
    
    public init () {}
    
    public func getUsers(_ completion: @escaping (UsersResponse) -> Void, _ failure: @escaping (String) -> Void) {
        
        NetworkAdapter.request(target: ApiService.getUsers , success: { (response) in
            
            let json = try? response.mapString()
            let jsonObject = JSON(parseJSON:json! )
            let objects = UsersResponse(fromJson: jsonObject)
            completion(objects)
            
        }) { (err) in
            failure("\(err.localizedDescription)")
        }
    }
    
    public func getUserPosts(_ userId: Int, _ completion: @escaping ([UserPost]) -> Void, _ failure: @escaping (String) -> Void) {
        
        NetworkAdapter.request(target: ApiService.getUserPosts(userId:userId), success: { (response) in
            let json = try? response.mapString()
            let jsonObject = JSON(parseJSON:json! )
            let objects = UserPostResponse(fromJson: jsonObject)
            if objects.posts.count > 0 {
                completion(objects.posts)
            }
        }) { (err) in
            failure("\(err.localizedDescription)")
        }
    }
    
    public func getComments(_ postId: Int, _ completion: @escaping ([PostComment]) -> Void, _ failure: @escaping (String) -> Void) {
      
        NetworkAdapter.request(target: ApiService.getComments(postId: postId), success: { (response) in
            
            let json = try? response.mapString()
            let jsonObject = JSON(parseJSON:json! )
            let object = PostCommentResponse(fromJson: jsonObject)
            completion(object.comments)
            
        }) { (err) in
            failure("\(err.localizedDescription)")
        }
    }
    
    public func getAlbums(_ completion: @escaping (AlbumsResponse) -> Void, _ failure: @escaping (String) -> Void) {
        NetworkAdapter.request(target: ApiService.getAlbums, success: { (response) in
            let json = try? response.mapString()
            let jsonObject = JSON(parseJSON:json! )
            let object = AlbumsResponse(fromJson: jsonObject)
            completion(object)
            
        }) { (err) in
            failure("\(err.localizedDescription)")
        }
    }
    
    public func getPhotos(_ albumId: Int, _ completion: @escaping (PhotosResponse) -> Void, _ failure: @escaping (String) -> Void) {
        NetworkAdapter.request(target: ApiService.getPhotos(albumId: albumId), success: { (response) in
            let json = try? response.mapString()
            let jsonObject = JSON(parseJSON:json! )
            let object = PhotosResponse(fromJson: jsonObject)
            completion(object)
            
        }) { (err) in
            failure("\(err.localizedDescription)")
        }
    }
}
