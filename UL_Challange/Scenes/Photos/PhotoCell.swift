//
//  PhotoCell.swift
//  UL_Challange
//
//  Created by eyup cimen on 18.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setImageView ( _ photo : PhotoObject) {
        if let thumbnail = photo.thumbnailUrl {
            let url = URL(string:thumbnail)!
            self.imageView.sd_setImage(with: url , placeholderImage: UIImage(), options: .continueInBackground)
        }
    }
}
