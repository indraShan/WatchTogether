//
//  YouTubePlayerView.swift
//  WatchTogether
//
//  Created by Indrajit on 17/01/19.
//  Copyright © 2019 Indrajit. All rights reserved.
//

import UIKit

//Reuse your existing, loaded YTPlayerView instances when possible. When a video needs to be changed in a View, don't create a new UIView instance or a new YTPlayerView instance, and don't call either loadVideoId: or loadPlaylistId:. Instead, use the the cueVideoById:startSeconds:suggestedQuality: family of functions, which do not reload the UIWebView. There is a noticeable delay when loading the entire iframe player.
class YouTubePlayerView: UIView {

  private let ytPlayer: YTPlayerView
  var viewModel : YouTubePlayerViewModelProtcol? {
    willSet {
      viewModel?.viewDelegate = nil
    }
    didSet {
      viewModel?.viewDelegate = self
      refreshDisplay(true)
    }
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("not supported")
  }

  override init(frame: CGRect) {
    ytPlayer = YTPlayerView(frame: .zero)
    ytPlayer.translatesAutoresizingMaskIntoConstraints = false
    super.init(frame: frame)
    addSubview(ytPlayer)
    ytPlayer.wt_alignCornersWith(self)
    ytPlayer.delegate = self
  }

//  func load(withVideoId videoId: String) {
//    ytPlayer.load(withVideoId: "MhuFNKQpWes")
//  }
  
  func refreshDisplay(_ forced : Bool = false) {
    guard let viewModel = viewModel else { return }
    if (forced) {
      ytPlayer.load(withVideoId: viewModel.videoId)
    }
    else {
      ytPlayer.cueVideo(byId: viewModel.videoId, startSeconds: 0, suggestedQuality: .auto)
    }
  }
  
}

extension YouTubePlayerView : YTPlayerViewDelegate {
  func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
    
  }
}

extension UIView {
  func wt_alignCornersWith(_ view: UIView) {
    NSLayoutConstraint.activate([
      leftAnchor.constraint(equalTo: view.leftAnchor),
      rightAnchor.constraint(equalTo: view.rightAnchor),
      topAnchor.constraint(equalTo: view.topAnchor),
      bottomAnchor.constraint(equalTo: view.bottomAnchor)
      ])
  }
}


extension YouTubePlayerView : YouTubePlayerViewModelViewDelegate {
  func playVideo() {
    ytPlayer.playVideo()
  }
  
  func pauseVideo() {
    ytPlayer.pauseVideo()
  }
}
