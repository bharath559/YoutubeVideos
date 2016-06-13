//
//  Utils.swift
//  YoutubeVideos
//
//  Created by Bharath kongara on 6/12/16.
//  Copyright © 2016 Odu Handson. All rights reserved.
//

import UIKit

class Utils {
    
    
    func sortVideoData(order:String) -> Void{
        
        if order == "ascending"{
            videosArray.sortInPlace({ $0.publishedDate.compare($1.publishedDate) == .OrderedAscending })
        }
        else if order == "descending"{
            videosArray.sortInPlace({ $0.publishedDate.compare($1.publishedDate) == .OrderedDescending })
        }
    }

    func dateFromString(dateString:String) -> NSDate{
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.timeZone = NSTimeZone(name: "UTC")
        let date:NSDate = dateFormatter.dateFromString(dateString)!
        
        return date
        
    }
    
}
