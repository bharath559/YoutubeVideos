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
    override func viewWillAppear(_ animated: Bool) {
       
        self.networkManager.getVideosForChannel()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return videosArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell:VideoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "VideoTableViewCell", for: indexPath) as! VideoTableViewCell
        
       let cellData:VideoModel = videosArray[indexPath.row] 
       
        cell.playerView.loadWithVideoId(cellData.videoId)
        
        let playerDic : [AnyHashable: Any] = [ "playsinline": "1"]
        
        cell.playerView.loadWithVideoId(cellData.videoId, playerVars:playerDic)
        cell.titleText.text = cellData.title
        
        return cell
    }
    
    //MARK: NetworkManagerDelegate
    func didFinishGettingData(){
        
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "PopOver" {
          
            let popOverViewController:SortTableViewController = segue.destination as! SortTableViewController
            popOverViewController.sortDelegate = self
            
            popOverViewController.modalPresentationStyle = .popover
            popOverViewController.preferredContentSize = CGSize(width: 200, height: 120)
            popOverViewController.popoverPresentationController?.delegate = self
            
        }
        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    
    //MARK: SortSelectionDelegate
    func sortData() {
        
        self.tableView.reloadData()
        dismiss(animated: true) { 
            
        }
    }
    
    
}
