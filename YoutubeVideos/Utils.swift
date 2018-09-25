//
//  Utils.swift
//  YoutubeVideos
//
//  Created by Bharath kongara on 6/12/16.
//  Copyright © 2016 Odu Handson. All rights reserved.
//

import UIKit

class Utils {
    
    
    func sortVideoData(_ order:String) -> Void{
        
        if order == "ascending"{
            videosArray.sort(by: { $0.publishedDate.compare($1.publishedDate as Date) == .orderedAscending })
        }
        else if order == "descending"{
            videosArray.sort(by: { $0.publishedDate.compare($1.publishedDate as Date) == .orderedDescending })
        }
    }

    func dateFromString(_ dateString:String) -> Date{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        let date:Date = dateFormatter.date(from: dateString)!
        
        return date
        
    }
    
}
