//
//  ViewController.swift
//  WatchTogether
//
//  Created by Indrajit on 17/01/19.
//  Copyright © 2019 Indrajit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let ytPlayer = WTYTPlayerView(frame: CGRect.zero)
    ytPlayer.translatesAutoresizingMaskIntoConstraints = false

    view.addSubview(ytPlayer)
    ytPlayer.matchWidthWith(view)
    ytPlayer.alignTopWith(view)
    ytPlayer.heightEqualTo(view, multiplier: 0.4)

    ytPlayer.playWithUrl("https://youtu.be/MhuFNKQpWes")
  }


}

