//
//  UserListViewController.swift
//  UL_Challange
//
//  Created by eyup cimen on 17.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import Foundation
import UIKit

class UserListViewController: BaseViewController {
    
    @IBOutlet var userList: UITableView!
    var viewModel : UserListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getUsers({
            self.userList.reloadData()
        }) { (err) in
            print(err)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func openDetailViewController(_ user : UserObject) {
        let userDetail = UserDetailBuilder.makeUserDetail(user)
        self.navigationController?.pushViewController(userDetail, animated: true)
    }
}


extension UserListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let user = viewModel.users[indexPath.row]
        openDetailViewController(user)
    }
}


extension UserListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usercell", for: indexPath)
        let user = viewModel.users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.username
        return cell
    }
}
