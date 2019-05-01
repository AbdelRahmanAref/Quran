//
//  Episode.swift
//  Quran
//
//  Created by AbdelRahman Aref on 4/30/19.
//  Copyright © 2019 AbdelRahman Aref. All rights reserved.
//

import Foundation
import FeedKit

struct Episode{
    let title : String
    let pubDate: Date
    let description: String
    let author: String
    let streamUrl: String
    var imageURL:String?


    init(feedItem: RSSFeedItem) {
        self.streamUrl = feedItem.enclosure?.attributes?.url ?? "" //audio
        self.title = feedItem.title ?? ""
        self.pubDate = feedItem.pubDate ?? Date()
        self.description = feedItem.description ?? ""
        self.imageURL = feedItem.iTunes?.iTunesImage?.attributes?.href
        self.author = feedItem.iTunes?.iTunesAuthor ?? ""
    }
}
