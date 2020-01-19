//
//  PhotosViewController.swift
//  UL_Challange
//
//  Created by eyup cimen on 18.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import UIKit
import SDWebImage

class PhotosViewController: BaseViewController {
    
    var viewModel : PhotosViewModel!
    @IBOutlet var photoList: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getPhotos(viewModel.albumId, {
            self.photoList.reloadData()
        }) { (err) in
            print(err)
        }
    }
}

extension PhotosViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        let photo = viewModel.photos[indexPath.row]
        cell.setImageView(photo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var newSize = CGSize.zero
        newSize.width  = (photoList.bounds.size.width - 2 ) / 3
        newSize.height = (photoList.bounds.size.width - 2 ) / 3
        return newSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let photo = viewModel.photos[indexPath.row]
        let photoDetailVC = PhotosBuilder.makePhotoDetail(photo)
        self.navigationController?.pushViewController(photoDetailVC, animated: true)
    }
}
