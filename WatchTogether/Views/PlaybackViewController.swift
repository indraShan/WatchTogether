//
//  PlaybackViewController.swift
//  WatchTogether
//
//  Created by Indrajit on 17/01/19.
//  Copyright © 2019 Indrajit. All rights reserved.
//

import UIKit

class PlaybackViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
    
    let dataModel = PlayerViewDataModel()
    let viewModel = YouTubePlayerViewModel(videoId: "MhuFNKQpWes", dataModel: dataModel)

    let playerView = YouTubePlayerView(frame: .zero)
    playerView.viewModel = viewModel
    playerView.translatesAutoresizingMaskIntoConstraints = false

    view.addSubview(playerView)
    playerView.wt_matchWidthWith(view)
    playerView.wt_alignTopWith(view.safeAreaLayoutGuide.topAnchor)
    playerView.wt_matchHeightWith(view, multiplier: 0.4)
  }
}

extension UIView {
  func wt_matchWidthWith(_ view: UIView) {
    NSLayoutConstraint.activate([widthAnchor.constraint(equalTo: view.widthAnchor)])
  }
  
  func wt_alignTopWith(_ anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>) {
    NSLayoutConstraint.activate([topAnchor.constraint(equalTo: anchor)])
  }
  
  func wt_matchHeightWith(_ view: UIView, multiplier: CGFloat = 1.0) {
    NSLayoutConstraint.activate([heightAnchor.constraint(equalTo: view.heightAnchor, multiplier : multiplier)])
  }
}

