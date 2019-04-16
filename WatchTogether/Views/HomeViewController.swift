//
//  HomeViewController.swift
//  WatchTogether
//
//  Created by Indrajit on 04/04/19.
//  Copyright © 2019 Indrajit. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var videosListResponse: YouTubeVideoListResponseDataModel? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        YouTubeVideoListNetworkService.fetchVideoList { [weak self] (list) in
            guard let list = list else { return }
            self?.videosListResponse = list
        }
        collectionView.register(VideoPreviewCell.nib(),
                                forCellWithReuseIdentifier: VideoPreviewCell.reuseIndefier())
    }
}

extension HomeViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let list = videosListResponse else {
            return 0
        }
        return list.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let previewCell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoPreviewCell.reuseIndefier(),
                                                                   for: indexPath) as! VideoPreviewCell
        let model = videosListResponse?.items[indexPath.row]
        previewCell.setupWith(model: model!)
        return previewCell
    }
    
}


extension HomeViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let model = videosListResponse?.items[indexPath.row]
        return CGSize(width: collectionView.frame.width,
                      height: VideoPreviewCell.heightForModel(model!, fitInWidth:collectionView.frame.width));
    }
}
