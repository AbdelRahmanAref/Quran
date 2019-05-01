//
//  PodcastCell.swift
//  Quran
//
//  Created by AbdelRahman Aref on 4/29/19.
//  Copyright © 2019 AbdelRahman Aref. All rights reserved.
//

import UIKit
import SDWebImage

class PodcastCell: UITableViewCell {

    @IBOutlet weak var podcastImageView: UIImageView!

    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var artistnameLabel: UILabel!
    @IBOutlet weak var trackbaneLabel: UILabel!

    var podcast: PodCast! {
        didSet {
            trackbaneLabel.text = podcast.trackName
            artistnameLabel.text = podcast.artistName
            episodeLabel.text = "\(podcast.trackCount ?? 0) Episodes"
            print("loading image with url: ", podcast.artworkUrl60 ?? "")
            guard let url = URL(string: podcast.artworkUrl60 ?? "") else {return}
            podcastImageView.sd_setImage(with: url, completed: nil)
        }
    }
    
}
