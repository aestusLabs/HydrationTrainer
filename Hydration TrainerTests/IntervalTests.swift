//
//  IntervalTests.swift
//  Hydration Trainer
//
//  Created by Ian Kohlert on 2016-11-01.
//  Copyright © 2016 Ian Kohlert. All rights reserved.
//

import XCTest
@testable import Hydration_Trainer


class IntervalTests: XCTestCase {
    
    let vc = ViewController()
    
    override func setUp() {
        super.setUp()
        
      
        vc.setUpTestTimeObjects()
        
       
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetNumberOfIntervalsInDay() {
        
        let numOfIntervals = vc.getNumberOfIntervals()
        XCTAssertEqual(numOfIntervals, 17)
    }
    
    func testSetAmountPerPress() {
        let arrayOfPressAmounts = vc.setAmountPerPress()
        let correctAmount = [250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250, 250]
        XCTAssertEqual(arrayOfPressAmounts, correctAmount)
    }
   
    func testSetUpPerIntervalGoalArray() {
        let arrayOfPerInterval = [1000, 1250 , 1500, 1750, 2000, 2250, 2500, 2750, 3000, 3250, 3500, 3750, 4000, 4250, 4500, 4750, 5000, 0, 0, 0, 0, 0, 0, 0, 0]
        
        let arrayOfIntervalGoals = vc.setUpPerIntervalGoalArray()
        
        XCTAssertEqual(arrayOfPerInterval, arrayOfIntervalGoals)
    }
    
    func testSettingUpIntervalStartTimes() {
        let testArray = [0, 3600, ]
    }
    
}
