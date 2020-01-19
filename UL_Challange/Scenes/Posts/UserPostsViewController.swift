//
//  UserPostsViewController.swift
//  UL_Challange
//
//  Created by eyup cimen on 18.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import UIKit

class UserPostsViewController: BaseViewController {
    
    @IBOutlet var postList: UITableView!
    var viewModel : UserPostsViewModel!
    var pickerView = UIPickerView()
    var isFilter : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getUserPosts(viewModel.userId, {
            // self.setUpPickerView()
            self.postList.reloadData()
        }) { (err) in
            print(err)
        }
    }
}

extension UserPostsViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let post = viewModel.posts[indexPath.row]
        let postDetailVC = PostDetailBuilder.makePostDetail(post)
        self.navigationController?.pushViewController(postDetailVC, animated: true)
    }
}

extension UserPostsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
        let post = viewModel.posts[indexPath.row]
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.body
        return cell
    }
}
 
 
