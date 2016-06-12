//
//  VideoTableViewCell.swift
//  YoutubeVideos
//
//  Created by Bharath Kongara on 6/11/16.
//  Copyright © 2016 Odu Handson. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class VideoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var playerView: YTPlayerView!
    
    @IBOutlet weak var titleText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
