//
//  VideoPreviewCell.swift
//  WatchTogether
//
//  Created by Indrajit on 05/04/19.
//  Copyright © 2019 Indrajit. All rights reserved.
//

import UIKit

class VideoPreviewCell: UICollectionViewCell {
    
    struct Constants {
        static let PreviewImageAspectRatio: CGFloat = 1.7
        static let ChannelImageTopPadding: CGFloat = 5
        static let ChannelImageWidth: CGFloat = 50
        static let ChannelImageLeftPadding: CGFloat = 5
        static let TitleLabelLeftPadding: CGFloat = 5
        static let TitleLabelRightPadding: CGFloat = 5
        static let TitleLabelFont = UIFont.preferredFont(forTextStyle: .subheadline)
        static let DetailLabelFont = UIFont.preferredFont(forTextStyle: .caption1)
        static let DetailLabelTopPadding: CGFloat = 2.0
        static let DetailLabelBottomPadding: CGFloat = 2.0
    }


    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var channelPreviewImage: UIImageView!
    
    @IBOutlet weak var channelPreviewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var channelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageAspectRatioConstraint: NSLayoutConstraint!
    @IBOutlet weak var detailTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabelTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var channelPreviewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabelLeadingConstraint: NSLayoutConstraint!
    
    class func nib() -> UINib {
        return UINib(nibName: "VideoPreviewCell", bundle: Bundle.main)
    }
    
    class func reuseIndefier() -> String {
        return String(describing: VideoPreviewCell.self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageAspectRatioConstraint.constant = Constants.PreviewImageAspectRatio
        channelTopConstraint.constant = Constants.ChannelImageTopPadding
        detailTopConstraint.constant = Constants.DetailLabelTopPadding
        titleLabelTrailingConstraint.constant = Constants.TitleLabelRightPadding
        titleLabelLeadingConstraint.constant = Constants.TitleLabelLeftPadding
        channelPreviewWidthConstraint.constant = Constants.ChannelImageWidth
        channelPreviewLeadingConstraint.constant = Constants.ChannelImageLeftPadding
        
        titleLabel.font = Constants.TitleLabelFont
        detailLabel.font = Constants.DetailLabelFont
    }
    
    class func heightForModel(_ model: YouTubeVideoDataModel, fitInWidth width: CGFloat) -> CGFloat {
        var totalHeight: CGFloat = 0
        
        let imageHeight = (width * (1/Constants.PreviewImageAspectRatio))
        totalHeight += imageHeight
        
        totalHeight += Constants.ChannelImageTopPadding
        
        let labelWidth = (width - (Constants.ChannelImageLeftPadding + Constants.ChannelImageWidth + Constants.TitleLabelLeftPadding + Constants.TitleLabelRightPadding))
        totalHeight += model.snippet.title.heightWithFont(Constants.TitleLabelFont,
                                                  toFitInWidth: labelWidth,
                                                  numberOfLines: 2)
        
        totalHeight += Constants.DetailLabelTopPadding
        
        totalHeight += model.detail.heightWithFont(Constants.DetailLabelFont,
                                                   toFitInWidth: labelWidth,
                                                   numberOfLines: 1)
        
        totalHeight += Constants.DetailLabelBottomPadding
        
        return ceil(totalHeight)
    }
    
    func setupWith(model: YouTubeVideoDataModel) {
        titleLabel.text = model.snippet.title
        detailLabel.text = model.detail
    }
}


extension String {
    func heightWithFont(_ font: UIFont, toFitInWidth width: CGFloat, numberOfLines lines: Int) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat(lines) * font.pointSize)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: [.usesLineFragmentOrigin, .usesFontLeading],
                                            attributes: [.font: font],
                                            context: nil)
        return boundingBox.height
    }
}
