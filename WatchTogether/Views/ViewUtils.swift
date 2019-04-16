//
//  ViewUtils.swift
//  WatchTogether
//
//  Created by Indrajit on 12/04/19.
//  Copyright © 2019 Indrajit. All rights reserved.
//

import Foundation

extension UIImage {
    func circularImage(withSize size: CGSize) -> UIImage {
        let scale = UIScreen.main.scale
        let circleRect = CGRect(x: 0, y: 0, width: size.width * scale, height: size.height * scale)
        
        UIGraphicsBeginImageContextWithOptions(circleRect.size, false, scale)
        
        let circlePath = UIBezierPath(roundedRect: circleRect, cornerRadius: circleRect.width/2.0)
        circlePath.addClip()
        draw(in: circleRect)
        
        let roundedImage = UIGraphicsGetImageFromCurrentImageContext()
        return roundedImage!
    }
}
