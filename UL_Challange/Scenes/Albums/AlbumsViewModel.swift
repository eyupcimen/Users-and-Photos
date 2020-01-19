//
//  AlbumsViewModel.swift
//  UL_Challange
//
//  Created by eyup cimen on 18.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation

final class AlbumsViewModel : BaseViewModel {
    
    var albums : [AlbumObject] = []
    private let service : NetworkServiceProtocol
    
    init(service:NetworkServiceProtocol) {
        self.service = service
    }
    
    func getAlbums (_ completion: @escaping () -> Void , _ failure : @escaping (String) -> Void ) {
        
        hudShow = true
        service.getAlbums({ (response) in
            self.hudShow = false
            self.albums = response.albums
            completion()
            
        }) { (err) in
            self.hudShow = false
            print(err)
        }
    }
}
