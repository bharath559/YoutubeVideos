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
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        let cell = tableView.cellForRow(at: indexPath)
        if(indexPath.row == 0){
            let nextIndex = IndexPath(row: 1, section: 0)
            
            let anotherCell = tableView.cellForRow(at: nextIndex)
            anotherCell?.accessoryType = .none
            
        }
        else if(indexPath.row == 1){
            let nextIndex = IndexPath(row: 0, section: 0)
            let anotherCell = tableView.cellForRow(at: nextIndex)
            anotherCell?.accessoryType = .none
            
        }
        
        cell?.accessoryType = .checkmark
        
        return indexPath
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let selectedValue = defaults.integer(forKey: "sortRow")
        if(selectedValue == indexPath.row){
            
            cell.accessoryType = .checkmark
            
        }
        else if(selectedValue == indexPath.row){
            cell.accessoryType = .checkmark
            
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if(indexPath.row == 0){
             utils.sortVideoData("ascending")
           defaults.set(0, forKey: "sortRow")
        }
        else if(indexPath.row == 1 ){
             utils.sortVideoData("descending")
            defaults.set(1, forKey: "sortRow")
        }
        
        self.sortDelegate?.sortData()
        
    }
}
