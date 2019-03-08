//
//  ViewController.swift
//  WatchTogether
//
//  Created by Indrajit on 17/01/19.
//  Copyright © 2019 Indrajit. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
  var ref: DatabaseReference!

  override func viewDidLoad() {
    super.viewDidLoad()
    ref = Database.database().reference()

    let ytPlayer = WTYTPlayerView(frame: CGRect.zero)
    ytPlayer.translatesAutoresizingMaskIntoConstraints = false

    view.addSubview(ytPlayer)
    ytPlayer.matchWidthWith(view)
    ytPlayer.alignTopWith(view)
    ytPlayer.heightEqualTo(view, multiplier: 0.4)

    ytPlayer.load(withVideoId: "https://youtu.be/MhuFNKQpWes")

    let playbackGroup = ref.childByAutoId().cre("MhuFNKQpWes")

    _ = ref.observe(DataEventType.value, with: { (snapshot) in
      let postDict = snapshot.value as? [String : AnyObject] ?? [:]
      print("Received change: \(postDict)");
      if (postDict["command"] as? String == "play") {
        ytPlayer.playVideo();
      }
      else if (postDict["command"] as? String == "pause") {
        ytPlayer.pauseVideo();
      }
    })
  }


}

