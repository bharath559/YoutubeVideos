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
        
        viewUnderTest = storyboard.instantiateViewController(withIdentifier: "VideoTableViewController") as! UITableViewController
        
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
        
        let todayDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        let dateString:String = dateFormatter.string(from: todayDate)
        
        let utils:Utils = Utils()
        let date:Date =  utils.dateFromString(dateString)
        print(date.compare(todayDate) == ComparisonResult.orderedSame)
        let calendar = Calendar.current
        let unitFlags: NSCalendar.Unit = [.hour, .day, .month, .year]
        
        
        XCTAssertTrue((calendar as NSCalendar).compare(date, to: todayDate, toUnitGranularity: unitFlags) == ComparisonResult.orderedSame)
        
    }
    
}
