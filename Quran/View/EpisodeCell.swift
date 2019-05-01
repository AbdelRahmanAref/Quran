//
//  EpisodeCell.swift
//  Quran
//
//  Created by AbdelRahman Aref on 4/30/19.
//  Copyright © 2019 AbdelRahman Aref. All rights reserved.
//

import UIKit

class EpisodeCell: UITableViewCell {

    var episode : Episode!{
        didSet {
            titleLabel.text = episode.title
            descriptionLabel.text = episode.description
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd, yyyy"
            pubDateLabel.text = dateFormatter.string(from: episode.pubDate)
            let url = URL(string: episode.imageURL?.toSecureHTTPS() ?? "")
            episodeImageView.sd_setImage(with: url)
        }
    }
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var pubDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

}
