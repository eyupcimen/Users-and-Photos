//
//  UserListViewModel.swift
//  UL_Challange
//
//  Created by eyup cimen on 17.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation

final class UserListViewModel : BaseViewModel {
    
    private let service : NetworkServiceProtocol
    var viewModel : UserListViewModel!
    var users : [UserObject] = []
    
    init(service:NetworkServiceProtocol) {
        self.service = service
    }
    
    func getUsers (_ completion: @escaping () -> Void , _ failure : @escaping (String) -> Void ) {
        
        hudShow = true
        service.getUsers({ (response) in
            
            self.hudShow = false
            if let users = response.users {
                self.users = users
                completion()
            } else {
                failure("Error")
            }
        }) { (err) in
            self.hudShow = false
            print(err)
        }
    }
}
