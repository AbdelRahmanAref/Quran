//
//  RSSFeed.swift
//  Quran
//
//  Created by AbdelRahman Aref on 4/30/19.
//  Copyright © 2019 AbdelRahman Aref. All rights reserved.
//

import FeedKit
import Foundation

extension RSSFeed {
    func toEpisode()->[Episode]{
        let imageURL = iTunes?.iTunesImage?.attributes?.href
        var episodes = [Episode]() //blank Episode array
        items?.forEach({ (feedItem) in
            var episode = Episode(feedItem: feedItem)

            if episode.imageURL == nil {
                episode.imageURL = imageURL
            }

            episodes.append(episode)
        })

        return episodes
    }

}

