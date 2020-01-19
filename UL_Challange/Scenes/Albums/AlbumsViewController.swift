//
//  AlbumsViewController.swift
//  UL_Challange
//
//  Created by eyup cimen on 18.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import UIKit

class AlbumsViewController: BaseViewController {
    
    var viewModel : AlbumsViewModel!
    @IBOutlet var albumList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getAlbums({
            self.albumList.reloadData()
        }) { (err) in
            print(err)
        }
    }
}

extension AlbumsViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let album = viewModel.albums[indexPath.row]
        let photosVC = PhotosBuilder.makePhotos(album.id)
        self.navigationController?.pushViewController(photosVC, animated: true)
    }
}

extension AlbumsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath)
        let album = viewModel.albums[indexPath.row]
        cell.textLabel?.text = album.title
        return cell
    }
}
