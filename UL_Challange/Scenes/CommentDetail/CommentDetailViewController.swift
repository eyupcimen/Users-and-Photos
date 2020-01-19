//
//  CommentDetailViewController.swift
//  UL_Challange
//
//  Created by eyup cimen on 18.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import UIKit

class CommentDetailViewController: BaseViewController {
    
    var viewModel : CommentDetailViewModel!
    @IBOutlet var commentTitleLbl: UILabel!
    @IBOutlet var commentBodyLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         updateUI()
    }
    
    func updateUI () {
        commentTitleLbl.text = viewModel.comment.name
        commentBodyLbl.text = viewModel.comment.body
    }
 
}
