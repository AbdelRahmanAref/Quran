//
//  PlayerDetailsView.swift
//  Quran
//
//  Created by AbdelRahman Aref on 4/30/19.
//  Copyright © 2019 AbdelRahman Aref. All rights reserved.
//

import UIKit
import AVKit

class PlayerDetailsView: UIView {
    var episode: Episode! {
        didSet{
            titleLabel.text = episode.title
            authorLabel.text = episode.author

            playEpisode()

            guard let url = URL(string: episode.imageURL ?? "") else { return}
            episodeImage.sd_setImage(with: url)
        }
    }
    fileprivate func playEpisode(){
        print("trying to play episode at url: ", episode.streamUrl)

        guard let url = URL(string: episode.streamUrl.toSecureHTTPS()) else {return}
        let playerItem = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: playerItem)
        player.play()
    }

    let player: AVPlayer = {
        let avPlayer = AVPlayer()
        avPlayer.automaticallyWaitsToMinimizeStalling = false
        return avPlayer
    }()

    //MARK:- IBActions and outlets
    @IBAction func handleDismiss(_ sender: Any) {
        self.removeFromSuperview()
    }

    @IBOutlet weak var episodeImage: UIImageView!

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var authorLabel: UILabel!

    @IBOutlet weak var playPauseButton: UIButton! {
        didSet{
            playPauseButton.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
            playPauseButton.addTarget(self, action: #selector(handlePlayPause), for: .touchUpInside)
        }
    }
    @objc func handlePlayPause(){
        if player.timeControlStatus == .paused {
            player.play()
            playPauseButton.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
        }else{
            player.pause()
            playPauseButton.setImage(#imageLiteral(resourceName: "play-1"), for: .normal)
        }
    }

}
