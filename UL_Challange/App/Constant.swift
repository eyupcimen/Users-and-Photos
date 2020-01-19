//
//  Constant.swift
//  UL_Challange
//
//  Created by eyup cimen on 17.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation
import UIKit
 
enum StoryBoard : String {
     
    case Main
    case MainTabbar
    
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
}

extension String {
    
    static let Main                         = "Main"
    static let MainTabbar                   = "MainTabbar"
    static let UserListViewController       = "UserListViewController"
    static let UserDetailViewController     = "UserDetailViewController"
    static let MapViewController            = "MapViewController"
    static let UserPostsViewController      = "UserPostsViewController"
    static let PostDetailViewController     = "PostDetailViewController"
    static let CommentDetailViewController  = "CommentDetailViewController"
    static let AlbumsViewController         = "AlbumsViewController"
    static let PhotosViewController         = "PhotosViewController"
    static let PhotoDetailViewController    = "PhotoDetailViewController"
    
}
