//
//  PostDetailViewController.swift
//  UL_Challange
//
//  Created by eyup cimen on 18.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import UIKit

class PostDetailViewController: BaseViewController {
    
    var viewModel : PostDetailViewModel!
    @IBOutlet var commentsList: UITableView!
    @IBOutlet var postTitleLbl: UILabel!
    @IBOutlet var postBodyLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI () {
        postTitleLbl.text = viewModel.post.title
        postBodyLbl.text = viewModel.post.body
        viewModel.getPostComments(viewModel.post.id , {
            self.commentsList.reloadData()
        }) { (err) in
            print(err)
        }
    }
}


extension PostDetailViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let comment = viewModel.comments[indexPath.row]
        let commentDetailVC = CommentDetailBuilder.makeCommentDetail(comment)
        self.navigationController?.pushViewController(commentDetailVC, animated: true)
    }
}


extension PostDetailViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
        let comment = viewModel.comments[indexPath.row]
        cell.textLabel?.text = comment.name
        cell.detailTextLabel?.text = comment.body
        return cell
    }
}

