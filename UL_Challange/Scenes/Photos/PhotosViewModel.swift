//
//  PhotosViewModel.swift
//  UL_Challange
//
//  Created by eyup cimen on 18.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation

final class PhotosViewModel : BaseViewModel {
    
    var photos : [PhotoObject] = []
    var albumId : Int = 0
    private let service : NetworkServiceProtocol
    
    init(service:NetworkServiceProtocol) {
        self.service = service
    }
    
    func getPhotos (_ albumId:Int, _ completion: @escaping () -> Void , _ failure : @escaping (String) -> Void ) {
        
        hudShow = true
        service.getPhotos(albumId, { (response) in
            self.hudShow = false
            self.photos = response.photos
            completion()
            
        }) { (err) in
            self.hudShow = false
            print(err)
        }
    }
}
