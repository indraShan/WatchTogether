//
//  WTYTPlayerView.swift
//  WatchTogether
//
//  Created by Indrajit on 17/01/19.
//  Copyright © 2019 Indrajit. All rights reserved.
//

import UIKit

//Reuse your existing, loaded YTPlayerView instances when possible. When a video needs to be changed in a View, don't create a new UIView instance or a new YTPlayerView instance, and don't call either loadVideoId: or loadPlaylistId:. Instead, use the the cueVideoById:startSeconds:suggestedQuality: family of functions, which do not reload the UIWebView. There is a noticeable delay when loading the entire iframe player.
class WTYTPlayerView: UIView {

  private let ytPlayer: YTPlayerView

  required init?(coder aDecoder: NSCoder) {
    fatalError("not supported")
  }

  override init(frame: CGRect) {
    ytPlayer = YTPlayerView(frame: .zero)
    super.init(frame: frame)

    ytPlayer.translatesAutoresizingMaskIntoConstraints = false
    addSubview(ytPlayer)
    ytPlayer.matchSizeWith(self)
  }

  func playWithUrl(_ url: String) {
    ytPlayer.load(withVideoId: "MhuFNKQpWes")
  }
}
