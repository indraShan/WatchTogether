//
//  YouTubePlayerViewModel.swift
//  WatchTogether
//
//  Created by Indrajit on 11/03/19.
//  Copyright © 2019 Indrajit. All rights reserved.
//

import Foundation

protocol YouTubePlayerViewModelViewDelegate : class {
  func playVideo()
  func pauseVideo()
}

protocol YouTubePlayerViewModelProtcol {
  var videoId: String { get set }
  var viewDelegate : YouTubePlayerViewModelViewDelegate? { get set }
  var dataModel: PlayerViewDataModelProtocol { get set }
}

class YouTubePlayerViewModel : YouTubePlayerViewModelProtcol {
  var dataModel: PlayerViewDataModelProtocol
  var videoId: String
  weak var viewDelegate: YouTubePlayerViewModelViewDelegate?
  
  init(videoId : String, dataModel : PlayerViewDataModelProtocol) {
    self.videoId = videoId
    self.dataModel = dataModel
    self.dataModel.delegate = self
  }
}

extension YouTubePlayerViewModel : PlayerViewDataModelDelegateProtcol {
  func updatePlayback(state play: Bool) {
    if (play) {
      viewDelegate?.playVideo()
    }
    else {
      viewDelegate?.pauseVideo()
    }
  }
}
