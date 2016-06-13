//
//  SortTableViewController.swift
//  YoutubeVideos
//
//  Created by Bharath kongara on 6/12/16.
//  Copyright © 2016 Odu Handson. All rights reserved.
//

import UIKit

protocol SortSelectionDelegate:class {
    func sortData()
}

class SortTableViewController: UITableViewController {

    weak var sortDelegate:SortSelectionDelegate?
    let utils:Utils = Utils()
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if(indexPath.row == 0){
            let nextIndex = NSIndexPath(forRow: 1, inSection: 0)
            
            let anotherCell = tableView.cellForRowAtIndexPath(nextIndex)
            anotherCell?.accessoryType = .None
            
        }
        else if(indexPath.row == 1){
            let nextIndex = NSIndexPath(forRow: 0, inSection: 0)
            let anotherCell = tableView.cellForRowAtIndexPath(nextIndex)
            anotherCell?.accessoryType = .None
            
        }
        
        
        cell?.accessoryType = .Checkmark
        
        return indexPath
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let selectedValue = defaults.integerForKey("sortRow")
        if(selectedValue == indexPath.row){
            
            cell.accessoryType = .Checkmark
            
        }
        else if(selectedValue == indexPath.row){
            cell.accessoryType = .Checkmark
            
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        if(indexPath.row == 0){
             utils.sortVideoData("ascending")
           defaults.setInteger(0, forKey: "sortRow")
        }
        else if(indexPath.row == 1 ){
             utils.sortVideoData("descending")
            defaults.setInteger(1, forKey: "sortRow")
        }
        
        self.sortDelegate?.sortData()
        
    }
}
