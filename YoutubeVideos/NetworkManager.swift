//
//  NetworkManager.swift
//  YoutubeVideos
//
//  Created by Bharath Kongara on 6/12/16.
//  Copyright © 2016 Odu Handson. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

protocol NetworkManagerDelegate:class {
    func didFinishGettingData()
}

class NetworkManager: NSObject {

    
    let getJsonURL:String = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=%22CCC%20information%20services%22&type=%22channel%22&key=AIzaSyCGOnQu4MCyZ7qTjQCW-2tXziyxPNKcOUA&maxResults=50"
   
    static let sharedInstance = NetworkManager()
    
     weak var delegate:NetworkManagerDelegate?
    
    func getVideosForChannel(){
        
        let jsonUrl:NSURL = NSURL(string: getJsonURL)!
        
        Alamofire.request(.GET, jsonUrl).response {
            request, response, data, error in
           
            if(error == nil){
                
                do{
                    let resultsDict = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! Dictionary<NSObject, AnyObject>
                    let items: Array<Dictionary<NSObject, AnyObject>> = resultsDict["items"] as! Array<Dictionary<NSObject, AnyObject>>
                    
                    
                    for i in 0 ..< items.count {
                        
                        let snippetDict = items[i]["snippet"] as! Dictionary<NSObject, AnyObject>
                        
                        let title:String = snippetDict["title"] as! String
                        let thumbnailUrl:String = ((snippetDict["thumbnails"] as! Dictionary<NSObject, AnyObject>)["default"] as! Dictionary<NSObject, AnyObject>)["url"] as! String
                        
                        if let videoId = (items[i]["id"] as! Dictionary<NSObject, AnyObject>)["videoId"]{
                           
                            let videoModelInstance = VideoModel(videoId:videoId as! String,thumbNail:thumbnailUrl,title:title)
                            videosArray.append(videoModelInstance)
                            
                        }
                        self.delegate?.didFinishGettingData()
                    }
                }
                catch {
                    print(error)
                }
            }
        }
    }
}
