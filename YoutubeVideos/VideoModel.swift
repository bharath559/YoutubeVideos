//
//  VideoModel.swift
//  YoutubeVideos
//
//  Created by Bharath Kongara on 6/12/16.
//  Copyright © 2016 Odu Handson. All rights reserved.
//

import UIKit

class VideoModel: NSObject {
    
    var videoId:String
    var thumbNail:String
    var title:String
    
    var videosArray: [VideoModel] = []
    
   
    
     init(videoId:String,thumbNail:String,title:String) {
        
        self.videoId = videoId
        self.thumbNail = thumbNail
        self.title = title
    }

}
