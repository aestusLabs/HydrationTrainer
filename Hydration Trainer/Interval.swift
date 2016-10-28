//
//  Interval.swift
//  Hydration Trainer
//
//  Created by Ian Kohlert on 2016-10-25.
//  Copyright © 2016 Ian Kohlert. All rights reserved.
//

import Foundation

class Interval {
    var whichInterval = -1
    var isTrackHour: Bool = false
    // do I need this ^
    
    var amountWaterConsumed: Int = 0
    var amountOfWaterToAddPerPress: Int = 0
    var goalPerInterval = 0
    var metGoal: Bool = false
    var intervalStartTimeInSecondsSinceStart: Int = 0
    var isNotificationInterval = false
    var notificationIdentifier = ""
    
    
    
    //    var totalNumberOfIntervals = 0
    
    
    // These functions are how I access the the above variables
    func getWhichInterval() -> Int {
        return whichInterval
    }
    func getIsTrackHour() -> Bool {
        return isTrackHour
    }
    
    func getAmountWaterConsumed() -> Int {
        return amountWaterConsumed
    }
    
    func getGoalPerInterval() -> Int {
        return goalPerInterval
    }
    
    func getMetGoal() -> Bool {
        return metGoal
    }
    
    func getIntervalStartTimeInSeconds() -> Int {
        return intervalStartTimeInSecondsSinceStart
    }
    
    func getIntervalNotificationIdentifier() -> String {
        return notificationIdentifier
    }
    
    
    func labelIntervals(whichInterval: Int, interval: Interval) {
        interval.whichInterval = whichInterval
    }
    
    func addIntervalStartTimes(interval: Interval, timeInSeconds: Int) {
        interval.intervalStartTimeInSecondsSinceStart = timeInSeconds
        
    }
    
    func addAmountOfWaterToAddPerPress(amount: Int) {
        amountOfWaterToAddPerPress = amount
    }
    ////
    
    //    func setTotalNumberOfIntervals(numberOfIntervals: Int) {
    //        totalNumberOfIntervals = numberOfIntervals
    //    }
    
    
    func addNotificationIdentifier(identifier: String) {
        notificationIdentifier = identifier
    }
    
    func setIsNotificationHour(interval: Int, numberOfIntervals: Int) {
        if interval < numberOfIntervals && interval != 0{
            isNotificationInterval = true
        }
    }
    
    var total = 0
    func addGoalPerInterval(interval: Interval, goal: Int) {
        interval.goalPerInterval = goal
        //        total = totalGoal / 5
        //        let amountToAdd = (totalGoal - (totalGoal / 5)) / (totalNumberOfIntervals - 1)
        //        print(whichInterval)
        //
        //        if whichInterval < totalNumberOfIntervals - 1 {
        //            print("TTTTT")
        //            interval.goalPerInterval = total
        //            total += amountToAdd
        //        }
        //
        
    }
    
    
    func setActiveTrackingIntervals(whichInterval: Int, interval: Interval, hoursAwake: Int) {
        
        
        if whichInterval < hoursAwake {
            interval.isTrackHour = true
        }
}
}
