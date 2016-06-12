//
//  VideoTableViewController.swift
//  YoutubeVideos
//
//  Created by Bharath Kongara on 6/11/16.
//  Copyright © 2016 Odu Handson. All rights reserved.
//

import UIKit

class VideoTableViewController: UITableViewController, NetworkManagerDelegate {
   
    let networkManager:NetworkManager = NetworkManager.sharedInstance
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.networkManager.delegate = self
    }
    override func viewWillAppear(animated: Bool) {
       
        self.networkManager.getVideosForChannel()
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return videosArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell:VideoTableViewCell = tableView.dequeueReusableCellWithIdentifier("VideoTableViewCell", forIndexPath: indexPath) as! VideoTableViewCell
        
       let cellData:VideoModel = videosArray[indexPath.row] 
       
        cell.playerView.loadWithVideoId(cellData.videoId)
        
        let playerDic : [NSObject:AnyObject] = [ "playsinline": "1"]
        
        cell.playerView.loadWithVideoId(cellData.videoId, playerVars:playerDic)
        cell.titleText.text = cellData.title
        
        return cell
    }
    
    
    func didFinishGettingData(){
        
        self.tableView.reloadData()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
