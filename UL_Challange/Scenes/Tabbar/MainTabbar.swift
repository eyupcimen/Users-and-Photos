//
//  MainTabbar.swift
//  UL_Challange
//
//  Created by eyup cimen on 17.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation
import UIKit

class MainTabbar: UITabBarController {
    
    var tabbarItems : [UITabBarItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainVC = UserListBuilder.makeUserList()
        let barItem = UITabBarItem(title: "Users" , image: UIImage(named: "profile_disable") , selectedImage: UIImage(named: "profile_enable") )
        barItem.tag = 0
        mainVC.tabBarItem = barItem
        tabbarItems.append(barItem)
        
        let albumsVC = AlbumsBuilder.makeAlbums()
        let barItem2 = UITabBarItem(title: "Users" , image: UIImage(named: "albums_d") , selectedImage: UIImage(named: "albums_e") )
        barItem2.tag = 1
        albumsVC.tabBarItem = barItem2
        tabbarItems.append(barItem2)
        
        adjustBarItems(tabbarItems)
        
        self.viewControllers = [mainVC,albumsVC].map { UINavigationController(rootViewController: $0)}
    }
    
    func adjustMainMenus () {
        
    }
    
    func adjustBarItems (_ items : [UITabBarItem] )  {
        items.forEach { (item) in
            item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            item.title = nil
        }
    }
    
    
}
