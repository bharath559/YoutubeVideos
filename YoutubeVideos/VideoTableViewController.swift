//
//  VideoTableViewController.swift
//  YoutubeVideos
//
//  Created by Bharath Kongara on 6/11/16.
//  Copyright © 2016 Odu Handson. All rights reserved.
//

import UIKit



class VideoTableViewController: UITableViewController, NetworkManagerDelegate,UIPopoverPresentationControllerDelegate, SortSelectionDelegate {
   
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

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

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
    
    //MARK: NetworkManagerDelegate
    func didFinishGettingData(){
        
        self.tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "PopOver" {
          
            let popOverViewController:SortTableViewController = segue.destinationViewController as! SortTableViewController
            popOverViewController.sortDelegate = self
            
            popOverViewController.modalPresentationStyle = .Popover
            popOverViewController.preferredContentSize = CGSize(width: 200, height: 120)
            popOverViewController.popoverPresentationController?.delegate = self
            
        }
        
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
    
    
    //MARK: SortSelectionDelegate
    func sortData() {
        
        self.tableView.reloadData()
        dismissViewControllerAnimated(true) { 
            
        }
    }
    
    
}
