//
//  APIService.swift
//  Quran
//
//  Created by AbdelRahman Aref on 4/29/19.
//  Copyright © 2019 AbdelRahman Aref. All rights reserved.
//

import UIKit
import Alamofire
import FeedKit

class APIService {
    //singleton
    static let shared = APIService()
     let baseItuneURL = "https://itunes.apple.com/search"

    func fetchEpisodes(feedUrl: String, completionHandler: @escaping ([Episode])->()) {
        let secureFeedUrl = feedUrl.contains("https") ? feedUrl : feedUrl.replacingOccurrences(of: "http", with: "https")
        guard let url = URL(string: secureFeedUrl) else { return }
        let parser = FeedParser(URL: url)
        parser.parseAsync { (result) in
            //check if feed is successfully parsed or not
            print("Successfully parse feed: ", result.isSuccess)
            if let err = result.error {
                print("Failed to parse XML feed:", err)
                return
            }
            guard let feed = result.rssFeed else {return}
            let epispdes = feed.toEpisode()
            completionHandler(epispdes)
        }
    }

    func fetchPodcasts(searchText: String, completionHandler: @escaping ([PodCast])->()){
        let parameters = ["term": searchText, "media": "podcast"]

        Alamofire.request(baseItuneURL, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            if let error = dataResponse.error {
                print("Failed to contact google", error); return
            }
            guard let data = dataResponse.data else {return}

            do{
                let searchResult = try JSONDecoder().decode(SearchResults.self, from: data)
                completionHandler(searchResult.results)
            }catch let decodeError{
                print("Failed to decode \(decodeError)")
            }
        }
    }
    struct SearchResults: Decodable{
        let resultCount: Int
        let results: [PodCast]
    }
}

