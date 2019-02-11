//
//  UIViewUtils.swift
//  WatchTogether
//
//  Created by Indrajit on 17/01/19.
//  Copyright © 2019 Indrajit. All rights reserved.
//

import UIKit

extension UIView {

  func matchWidthWith(_ view: UIView) {
    NSLayoutConstraint.activate([
      leftAnchor.constraint(equalTo: view.leftAnchor),
      rightAnchor.constraint(equalTo: view.rightAnchor)
      ])
  }

  func alignTopWith(_ view: UIView)  {
    NSLayoutConstraint.activate([
      topAnchor.constraint(equalTo: view.topAnchor)
      ])
  }

  func heightEqualTo(_ view: UIView, multiplier: CGFloat = 1)  {
    NSLayoutConstraint.activate([
      heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier)
      ])
  }

  func matchSizeWith(_ view: UIView)  {
    NSLayoutConstraint.activate([
      heightAnchor.constraint(equalTo: view.heightAnchor),
      widthAnchor.constraint(equalTo: view.widthAnchor),
      leftAnchor.constraint(equalTo: view.leftAnchor),
      rightAnchor.constraint(equalTo: view.rightAnchor)
      ])
  }

}
