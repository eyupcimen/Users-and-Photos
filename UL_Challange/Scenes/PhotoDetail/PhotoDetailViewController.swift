//
//  PhotoDetailViewController.swift
//  UL_Challange
//
//  Created by eyup cimen on 19.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoDetailViewController: BaseViewController {
    
    var viewModel : PhotoDetailViewModel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImage()
    }
    
    func setImage () {
        if let photoUrl = viewModel.photo.url {
            let url = URL(string:photoUrl)!
            self.imageView.sd_setImage(with: url , placeholderImage: UIImage(), options: .continueInBackground)
        }
    }

}
