//
//  YoutubeVideosTests.swift
//  YoutubeVideosTests
//
//  Created by Bharath kongara on 6/11/16.
//  Copyright © 2016 Odu Handson. All rights reserved.
//
import UIKit
import XCTest
@testable import YoutubeVideos

class YoutubeVideosTests: XCTestCase {
    
    var viewUnderTest:UITableViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        viewUnderTest = storyboard.instantiateViewControllerWithIdentifier("VideoTableViewController") as! UITableViewController
        
        //load view hierarchy
        _ = viewUnderTest.view
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testSUT_TableViewIsNotNilAfterViewDidLoad() {
        
        XCTAssertNotNil(viewUnderTest.tableView)
    }
    
    func testSUT_ShouldSetTableViewDataSource() {
        
        XCTAssertNotNil(viewUnderTest.tableView.dataSource)
    }
    
    func testSUT_ShouldSetTableViewDelegate() {
        
        XCTAssertNotNil(viewUnderTest.tableView.dataSource)
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let todayDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.timeZone = NSTimeZone(name: "UTC")
        let dateString:String = dateFormatter.stringFromDate(todayDate)
        
        let utils:Utils = Utils()
        let date:NSDate =  utils.dateFromString(dateString)
        print(date.compare(todayDate) == NSComparisonResult.OrderedSame)
        let calendar = NSCalendar.currentCalendar()
        let unitFlags: NSCalendarUnit = [.Hour, .Day, .Month, .Year]
        
        
        XCTAssertTrue(calendar.compareDate(date, toDate: todayDate, toUnitGranularity: unitFlags) == NSComparisonResult.OrderedSame)
        
    }
    
}
