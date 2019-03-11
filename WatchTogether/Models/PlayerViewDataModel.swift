//
//  YouTubePlayerViewDataMode.swift
//  WatchTogether
//
//  Created by Indrajit on 11/03/19.
//  Copyright © 2019 Indrajit. All rights reserved.
//

import Foundation
import Firebase

protocol PlayerViewDataModelDelegateProtcol: class {
  func updatePlayback(state play: Bool)
}

protocol PlayerViewDataModelProtocol {
  var delegate: PlayerViewDataModelDelegateProtcol? { get set }
}

class PlayerViewDataModel : PlayerViewDataModelProtocol {
  weak var delegate: PlayerViewDataModelDelegateProtcol?
  var databaseReference: DatabaseReference
  
  init() {
    databaseReference = Database.database().reference()
    
//    let groups = databaseReference.child("groups")
//    let firstGroup = groups.child("-L_eZQk35CQP-C-mf5Ni")
//    
//    let videoInfo = firstGroup.child("video")
//    videoInfo.setValue("MhuFNKQpWes")
//
//    let plabackState = firstGroup.child("state")
//    plabackState.setValue("paused")
//
//    let plaback_location = firstGroup.child("plaback_location")
//    plaback_location.setValue("00")
    
    _ = firstGroup.observe(DataEventType.value, with: { [weak self] (snapshot) in
      let postDict = snapshot.value as? [String : AnyObject] ?? [:]
      self?.delegate?.updatePlayback(state: postDict["state"] as? String ==  "play" ? true : false)
    })
  }
  
}
