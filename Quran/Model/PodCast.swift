//
//  PodCast.swift
//  Quran
//
//  Created by AbdelRahman Aref on 4/29/19.
//  Copyright © 2019 AbdelRahman Aref. All rights reserved.
//

import Foundation

struct PodCast: Decodable {
    var trackName: String?
    var artistName: String?
    var artworkUrl60: String?
    var trackCount: Int?
    var feedUrl: String?
}

