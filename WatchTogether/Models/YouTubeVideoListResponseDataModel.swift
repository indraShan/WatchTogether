//
//  YouTubeVideoListResponseDataModel.swift
//  WatchTogether
//
//  Created by Indrajit on 05/04/19.
//  Copyright © 2019 Indrajit. All rights reserved.
//

import Foundation


//protocol YouTubeVideoListResponseDataModelProtocol {
//    var nextPageToken: String { set get }
//    var items: [YouTubeVideoDataModel] { set get }
//}


struct YouTubeVideoListResponseDataModel: CustomStringConvertible {
    var nextPageToken: String
    var items: [YouTubeVideoDataModel]
    var description: String {
        get {
            return "nextPageToken: \(nextPageToken) \n items : \(items)"
        }
    }
}


extension YouTubeVideoListResponseDataModel: Codable {
    
}
