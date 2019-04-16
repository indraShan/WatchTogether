//
//  YouTubeVideoListNetworkService.swift
//  WatchTogether
//
//  Created by Indrajit on 05/04/19.
//  Copyright © 2019 Indrajit. All rights reserved.
//

import Foundation

class YouTubeVideoListNetworkService {
    
    class func fetchVideoList(_ completion: @escaping (YouTubeVideoListResponseDataModel?) -> Void) {
        let session = URLSession(configuration: URLSessionConfiguration.default)
        var urlComponents = URLComponents(string: "https://www.googleapis.com/youtube/v3/videos")!
        let queryItemPart = URLQueryItem(name: "part", value: "snippet")
        let queryItemChar = URLQueryItem(name: "chart", value: "mostPopular")
        let queryItemKey = URLQueryItem(name: "key", value: Constants.YouTubeAPIKey)

        urlComponents.queryItems = [queryItemPart, queryItemChar, queryItemKey]
        
        let task = session.dataTask(with: urlComponents.url!) { (data, response, error) in
            guard let jsonData = data,
                error == nil,
                let httpReponse = response as? HTTPURLResponse,
                httpReponse.statusCode == 200 else {
                return
            }
            let decoder = JSONDecoder()
            do {
                let list = try decoder.decode(YouTubeVideoListResponseDataModel.self, from: jsonData)
                DispatchQueue.main.async {
                    completion(list)
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
        
    }
}
