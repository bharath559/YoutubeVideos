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
    var publishedDate:NSDate
    
    var videosArray: [VideoModel] = []
    
    
    init(videoId:String,thumbNail:String,title:String,publishedDate:NSDate) {
        
        self.videoId = videoId
        self.thumbNail = thumbNail
        self.title = title
        self.publishedDate = publishedDate
    }
    
    
    
    

}
