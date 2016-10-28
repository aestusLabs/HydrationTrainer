//
//  ViewController.swift
//  Hydration Trainer
//
//  Created by Ian Kohlert on 2016-10-25.
//  Copyright © 2016 Ian Kohlert. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

   
    
    var goal = 5000
    var totalWaterConsumed = 0
    
    var currentAmountToAdd = 200
    
    var lastDayStarted = [2016, 10, 11, 12, 3, 39]
    var hourToShowStartMenu = 3
    
    
    var lastDayTracked = Time()
    var startTimeArray = [2016, 10, 11, 7, 0, 0]
    //    var startTimeInSeconds = 0
    var startTime = Time()
    
    //    var arrayOfIntervalStartTimes = [0, 3600]
    
    var bedTimeHour = 26
    //    var bedtimeArray = [2016, 10, 19, 2, 0, 0]
    var bedTime = Time()
    // need a function to get bedtime
    
    var currentTime = Time()
    var tomorrow = Time()
    
    
    var count = 0
    //    var timer = Timer()
    
    
    var interval0 = Interval()
    var interval1 = Interval()
    var interval2 = Interval()
    var interval3 = Interval()
    var interval4 = Interval()
    var interval5 = Interval()
    var interval6 = Interval()
    var interval7 = Interval()
    var interval8 = Interval()
    var interval9 = Interval()
    var interval10 = Interval()
    var interval11 = Interval()
    var interval12 = Interval()
    var interval13 = Interval()
    var interval14 = Interval()
    var interval15 = Interval()
    var interval16 = Interval()
    var interval17 = Interval()
    var interval18 = Interval()
    var interval19 = Interval()
    var interval20 = Interval()
    var interval21 = Interval()
    var interval22 = Interval()
    var interval23 = Interval()
    func getArrayOfIntervals() ->[Interval] {
        let arrayOfIntervals = [interval0, interval1, interval2, interval3, interval4, interval5, interval6, interval7, interval8, interval9, interval10, interval11, interval12, interval13, interval14, interval15, interval16, interval17, interval18, interval19, interval20, interval21, interval22, interval23]
        return arrayOfIntervals
        
    }
    
    @IBOutlet weak var goalOutlet: UILabel!
    @IBOutlet weak var paceOutlet: UILabel!
    @IBOutlet weak var currentConsumedOutlet: UILabel!
    @IBOutlet weak var addWaterOutlet: UIButton!
    @IBOutlet weak var timeUntilNextIntervalLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTomorrowsDate()
        startDay()
        
        UNUserNotificationCenter.current().delegate = self

        interactionTest()
        notificationTesting()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        updateLabels()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        // If it is the first open of the day it goes to the start VC
        
        
        
    }
    
//    func userNotifcationCenter(_ center: UNUserNotifcationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: () -> Void) {
//        
//    }
    
    
    @IBAction func addWater(_ sender: AnyObject) {
       addCurrentAmountToTotal()
    }
    
    func addCurrentAmountToTotal() {
        totalWaterConsumed += currentAmountToAdd
        let currentInterval = getCurrentInterval()
        currentInterval.amountWaterConsumed += currentAmountToAdd
        print(currentInterval.amountWaterConsumed)
        if currentInterval.amountWaterConsumed >= currentInterval.goalPerInterval {
            currentInterval.metGoal = true
        }
        print(currentInterval.metGoal)
        updateLabels()
        //        checkIfNeedStartVC()
    }
    
    func updateLabels() {
        goalOutlet.text = "Goal: \(goal)ml"
        let currentInterval = getCurrentInterval()
        paceOutlet.text = "Pace: \(currentInterval.getGoalPerInterval())ml"
        currentConsumedOutlet.text = "Total Consumed: \(totalWaterConsumed)"
        
    }
    
    
    func checkIfCurrentDayIsLastDayTracked() {
        
        if currentTime.day != lastDayTracked.day {
            if currentTime.hour < hourToShowStartMenu && currentTime.day - 1 == lastDayTracked.day {
                
            } else {
                setLastDayTracked()
                performSegue(withIdentifier: "showStartScreen", sender: self)
                
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    ///////Start Up Functions
    
    
    func updateInfo() {
        setCurrentTime()
        //        getCurrentInterval()
        setCount()
        
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        updateLabels()
        
    }
    
    
    func startDay() {
        // Get variables needed in other calculations
        
        // Gets correct start, current and bed times
        setStartTime()
        setBedTime()
        
        
        
        iterateThroughIntervals(arrayOfIntervals: getArrayOfIntervals())
        
        updateInfo()
        
        
        checkSetUp()
    }
    
    
    
    ////\
    
    func checkSetUp() {
        print("Start Time")
        print(startTime.year)
        print(startTime.month)
        print(startTime.day)
        print(startTime.hour)
        print(startTime.minute)
        print(startTime.seconds)
        
        print("Bed Time")
        print(bedTime.year)
        print(bedTime.month)
        print(bedTime.day)
        print(bedTime.hour)
        print(bedTime.minute)
        print(bedTime.seconds)
        
        let array = getArrayOfIntervals()
        for x in array {
            print(x.whichInterval)
            print(x.notificationIdentifier)
            print(x.isNotificationInterval)
            print(x.isTrackHour)
            print(x.intervalStartTimeInSecondsSinceStart)
            print(x.goalPerInterval)
            print(x.amountOfWaterToAddPerPress)
            print(" ")
        }

        /// Below is trying to get the scheduled notifications to print
       // print(UIApplication.shared.scheduledLocalNotifications)
        let center = UNUserNotificationCenter.current()
        print(center.getPendingNotificationRequests(completionHandler: { error in
            // error handling here.
        }))
    }
    
    
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////
    //                 Notification Related Functions
    ////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    let arrayOfNotificationIdentifiers = ["notification1", "notification2", "notification3", "notification4", "notification5", "notification6", "notification7", "notification8", "notification9", "notification10", "notification11", "notification12", "notification13", "notification14", "notification15", "notification16", "notification17", "notification18", "notification19", "notification20", "notification21", "notification22", "notification23", "notification24"]
    
    
    
    
//    func setPaceNotifications() {
//        // Start up I'll do all intervals I track
//        let arrayOfIntervals = getArrayOfIntervals()
//        
//        for interval in arrayOfIntervals {
//            
//            // below will go to iterate through intervals array
//            if interval.isNotificationInterval {
//                let notification = getNotificationForInterval(interval: interval.getWhichInterval())
//                setNotification(notification: notification, fireTime: interval.getIntervalStartTimeInSeconds(), identifier: interval.getIntervalNotificationIdentifier())
//            }
//        }
//        
//    }
    
    

    func getNotificationForInterval(interval: Int) -> UNMutableNotificationContent {
        let paceNotification1 = UNMutableNotificationContent()
        let paceNotification2 = UNMutableNotificationContent()
        let paceNotification3 = UNMutableNotificationContent()
        let paceNotification4 = UNMutableNotificationContent()
        let paceNotification5 = UNMutableNotificationContent()
        let paceNotification6 = UNMutableNotificationContent()
        let paceNotification7 = UNMutableNotificationContent()
        let paceNotification8 = UNMutableNotificationContent()
        let paceNotification9 = UNMutableNotificationContent()
        let paceNotification10 = UNMutableNotificationContent()
        let paceNotification11 = UNMutableNotificationContent()
        let paceNotification12 = UNMutableNotificationContent()
        let paceNotification13 = UNMutableNotificationContent()
        let paceNotification14 = UNMutableNotificationContent()
        let paceNotification15 = UNMutableNotificationContent()
        let paceNotification16 = UNMutableNotificationContent()
        let paceNotification17 = UNMutableNotificationContent()
        let paceNotification18 = UNMutableNotificationContent()
        let paceNotification19 = UNMutableNotificationContent()
        let paceNotification20 = UNMutableNotificationContent()
        let paceNotification21 = UNMutableNotificationContent()
        let paceNotification22 = UNMutableNotificationContent()
        let paceNotification23 = UNMutableNotificationContent()
        // maybe move everything above out to the VC if it doesn't notifiy me at 12:15
        
        
        if interval == 1 {
            return paceNotification1
        } else if interval == 2 {
            return paceNotification2
        } else if interval == 3 {
            return paceNotification3
        } else if interval == 4 {
            return paceNotification4
        } else if interval == 5 {
            return paceNotification5
        } else if interval == 6 {
            return paceNotification6
        } else if interval == 7 {
            return paceNotification7
        } else if interval == 8 {
            return paceNotification8
        } else if interval == 9 {
            return paceNotification9
        } else if interval == 10 {
            return paceNotification10
        } else if interval == 11 {
            return paceNotification11
        } else if interval == 12 {
            return paceNotification12
        } else if interval == 13 {
            return paceNotification13
        } else if interval == 14 {
            return paceNotification14
        } else if interval == 15 {
            return paceNotification15
        } else if interval == 16 {
            return paceNotification16
        } else if interval == 17 {
            return paceNotification17
        } else if interval == 18 {
            return paceNotification18
        } else if interval == 19 {
            return paceNotification19
        } else if interval == 20 {
            return paceNotification20
        } else if interval == 21 {
            return paceNotification21
        } else if interval == 22 {
            return paceNotification22
        } else {
            return paceNotification23
        }
        
    }
    
    // Maybe I should only send like 4 notifications for pace increases. So if the first 3 are ignored the 4th says something like, "Turning off notifications until you open the app again."
    let testNotification = UNMutableNotificationContent()
    func notificationTesting() {
        let content = testNotification
        content.title = "This is a test."
        content.body = "Drink \(currentAmountToAdd)."
        content.categoryIdentifier = "addWaterCategory"
        content.sound = UNNotificationSound.default()

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let requestIdentifier = "testNotification"
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        
        
        
        
       
        
        
        
        
        UNUserNotificationCenter.current().add(request) { (error) in
            
            if let error = error {
                print("Error with repeating notification setting. \(error)")
            }
        }

    }
    
    func interactionTest() {
        let addAndGoAction = UNNotificationAction(identifier: "addWaterAndGoInteraction", title: "Add \(currentAmountToAdd)ml and launch app", options: [.foreground])
        let addWaterAction = UNNotificationAction(identifier: "addWaterInteraction", title: "Add \(currentAmountToAdd)ml", options: [])
        //        change options to 'options: [.forground] to launch app

        let category = UNNotificationCategory(identifier: "addWaterCategory", actions: [addAndGoAction, addWaterAction], intentIdentifiers: [], options: [])
        //intentidentifier is for SiriKit
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        
    }
    
    func setNotification(notification: UNMutableNotificationContent, fireTime: Int, identifier: String, paceGoal: Int) {
            let content = notification
            content.title = "You need to drink some water"
            content.body = "Your goal pace has just increased to \(paceGoal)ml"
            content.categoryIdentifier = "addWaterCategory"
        content.sound = UNNotificationSound.default()

        
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(fireTime), repeats: false)
        
            let requestIdentifier = identifier
            let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        
            UNUserNotificationCenter.current().add(request) { (error) in
                
                if let error = error {
                    print("Uh oh! We had an error: \(error)")
                }
            }
        }
    
    let repeatingNotification = UNMutableNotificationContent()
    func setRepeatingNotification(howOften: Int) {
        let content = repeatingNotification
        content.title = "Drink water, you unhydrated bastard."
        content.body = "I'm going to keep annoying you until you do."
        content.categoryIdentifier = "addWaterCategory"
        content.sound = UNNotificationSound.default()

        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 900, repeats: true)
        
        let requestIdentifier = "repeatingNotification"
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        
        
        
        
        let addWaterAction = UNNotificationAction(identifier: "addWaterInteraction", title: "Add \(currentAmountToAdd)", options: [])
        
        let category = UNNotificationCategory(identifier: "addWaterCategory", actions: [addWaterAction], intentIdentifiers: [], options: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])

        content.categoryIdentifier = "addWaterCategory"
        
        
        
        
        UNUserNotificationCenter.current().add(request) { (error) in
            
            if let error = error {
                print("Error with repeating notification setting. \(error)")
            }
        }
        
        // add foreground action take them to app
        //maybe a dismiss action
        // check that it is displaying the correct current amount to add
        
        
        
        // Not sure if this is the right place: 
//        addNotificationInteractions()
    }
    
    func addNotificationInteractions() {
        let addWaterAction = UNNotificationAction(identifier: "addWaterInteraction", title: "Add \(currentAmountToAdd)", options: [])
        
        let category = UNNotificationCategory(identifier: "addWaterCategory", actions: [addWaterAction], intentIdentifiers: [], options: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])
    }
    
    
    func checkIfCancelRepeatingReminder() {
        let currentInterval = getCurrentInterval()
        if totalWaterConsumed >= currentInterval.getGoalPerInterval() {
            cancelNotification(notificationIdentifier: "repeatingNotification")
        }
    }
    
    func cancelNotification(notificationIdentifier: String) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [notificationIdentifier])
    }
    
    func deleteOldNotificationsFromNC() {
        // So this will fire when they launch the app, meaning they have no need of the old notifications
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
    
    // delete old pace notifications upon launching the app again
    
    
    
    
    
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////
    //                 Timer Related Functions
    ////////////////////////////////////////////////////////////////////////////////////////////
    
    func setCount() {
        defer {
            count = getSecondsUntilNextInterval()
        }
        func getSecondsUntilNextInterval() -> Int {
            setCurrentTime()
            let currentInterval = getCurrentInterval()
            let nextInterval = getNextInterval(currentInterval: currentInterval.getWhichInterval())
            
            return nextInterval.getIntervalStartTimeInSeconds() - getTimeInSecondsFromStart(time: currentTime)    }
    }
    
    func timerFunc() {
        defer {
            if count == 0 {
                setCount()
            }
            
            let time = convertSecondsToClock(timeInSeconds: count)
            updateClockLabel(minutes: time.0, seconds: time.1)
            
            count -= 1
            
        }
        
        func updateClockLabel(minutes: Int, seconds: Int) {
            var minutesString = ""
            // add a 0 if it's under a minute
            minutesString = String(minutes)
            var stringSeconds = ""
            if seconds < 10 {
                stringSeconds += "0"
            }
            if minutes < 1 {
                minutesString = "0"
            }
            stringSeconds += String(seconds)
            timeUntilNextIntervalLabel.text = "Time Until Next Interval: \(minutesString):\(stringSeconds)"
            
        }
        
        func convertSecondsToClock(timeInSeconds: Int) -> (minutes: Int, seconds: Int){
            let minutes = timeInSeconds / 60
            let seconds = timeInSeconds % 60
            
            return (minutes, seconds)
        }
    }
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////
    //                 Interval Related Functions
    ////////////////////////////////////////////////////////////////////////////////////////////
    
    
    func getCurrentInterval() -> Interval {
        setCurrentTime()
        let timeSinceStart = getTimeInSecondsFromStart(time: currentTime)
        
        let arrayOfIntervals = getArrayOfIntervals()
        var previousInterval = interval0
        
        for x in arrayOfIntervals {
            if timeSinceStart < x.intervalStartTimeInSecondsSinceStart {
                return previousInterval
            }
            previousInterval = x
        }
        return interval0
    }
    
    func getNextInterval(currentInterval: Int) -> Interval{
        if currentInterval == 0 {
            return interval1
        } else if currentInterval == 1 {
            return interval2
        } else if currentInterval == 2 {
            return interval3
        } else if currentInterval == 3 {
            return interval4
        } else if currentInterval == 4 {
            return interval5
        } else if currentInterval == 5 {
            return interval6
        } else if currentInterval == 6 {
            return interval7
        } else if currentInterval == 7 {
            return interval8
        } else if currentInterval == 8 {
            return interval9
        } else if currentInterval == 9 {
            return interval10
        } else if currentInterval == 10 {
            return interval11
        } else if currentInterval == 11 {
            return interval12
        } else if currentInterval == 12 {
            return interval3
        } else if currentInterval == 13 {
            return interval14
        } else if currentInterval == 14 {
            return interval15
        } else if currentInterval == 15 {
            return interval16
        } else if currentInterval == 16 {
            return interval17
        } else if currentInterval == 17 {
            return interval18
        } else if currentInterval == 18 {
            return interval19
        } else if currentInterval == 19 {
            return interval20
        }else if currentInterval == 20 {
            return interval21
        } else if currentInterval == 21 {
            return interval22
        } else if currentInterval == 22 {
            return interval23
        } else {
            return interval0
        }
        
    }
    
    func iterateThroughIntervals(arrayOfIntervals: [Interval]) {
        
        defer {
            var count = 0
            var arrayOfIntervalGoals = setUpPerIntervalGoalArray()
            var arrayOfIntervalStartTimes = settingUpIntervalStartTimes()
            var arrayOfPressAmounts = setAmountPerPress()
            var numberOfIntervals = getNumberOfIntervals()
            
            for x in arrayOfIntervals {
                x.labelIntervals(whichInterval: count, interval: x)
                //PROBLEM IF It's after 12 and the bed time is 2 am. Figure this out
                x.setActiveTrackingIntervals(whichInterval: count, interval: x, hoursAwake: getNumberOfIntervals())
                x.addIntervalStartTimes(interval: x, timeInSeconds: arrayOfIntervalStartTimes[count])
                x.addGoalPerInterval(interval: x, goal: arrayOfIntervalGoals[count])
                x.addAmountOfWaterToAddPerPress(amount: arrayOfPressAmounts[count])
                
                x.addNotificationIdentifier(identifier: arrayOfNotificationIdentifiers[count])
                x.setIsNotificationHour(interval: count, numberOfIntervals: numberOfIntervals)
                
                
                
                if x.isNotificationInterval {
                    let notification = getNotificationForInterval(interval: x.getWhichInterval())
                    setNotification(notification: notification, fireTime: x.getIntervalStartTimeInSeconds(), identifier: x.getIntervalNotificationIdentifier(), paceGoal: x.getGoalPerInterval())
                }
                count += 1
            }
        }
        func settingUpIntervalStartTimes() -> [Int]{
            var arrayOfIntervalStartTimes = [0, 3600]
            
            let totalNumberOfIntervals = getNumberOfIntervals()
            //        setUpTimeObjects()
            
            let startTimeInSeconds = startTime.getTimeInSeconds()
            let bedTimeInSeconds = bedTime.getTimeInSeconds()
            let totalSecondsPlannedAwake = bedTimeInSeconds - startTimeInSeconds
            let timeAfterFirstInterval = totalSecondsPlannedAwake - 3600
            
            
            let intervalLength = timeAfterFirstInterval / totalNumberOfIntervals
            
            
            var total = 3600
            for _ in 1..<24{
                let newTotal = total + intervalLength
                total = newTotal
                
                arrayOfIntervalStartTimes.append(newTotal)
            }
            
            
            return arrayOfIntervalStartTimes
            
        }
        
        
        func setUpPerIntervalGoalArray() -> [Int]{
            
            var total = goal / 5
            
            let totalNumberOfIntervals = getNumberOfIntervals()
            let amountToAdd = (goal - (goal / 5)) / (totalNumberOfIntervals - 1)
            var arrayOfIntervalGoals: [Int] = []
            
            for _ in 1...totalNumberOfIntervals {
                arrayOfIntervalGoals.append(total)
                total += amountToAdd
            }
            
            for _ in arrayOfIntervalGoals.count...24 {
                arrayOfIntervalGoals.append(0)
            }
            
            
            return arrayOfIntervalGoals
        }
        
        func setAmountPerPress() -> [Int] {
            var arrayOfPressAmounts: [Int] = []
            var total = goal / 5 / 4
            let totalNumberOfIntervals = getNumberOfIntervals()
            let amountToAdd = (goal - (goal / 5)) / (totalNumberOfIntervals - 1)
            for _ in 1...24 {
                arrayOfPressAmounts.append(total)
                total = amountToAdd
            }
            return arrayOfPressAmounts
        }
        
        func getNumberOfIntervals() -> Int{
            var numberOfIntervals = 0
            
            if bedTime.day != startTime.day {
                numberOfIntervals =  (24 - startTime.hour) + bedTime.hour
            } else {
                numberOfIntervals =  bedTime.hour - startTime.hour
            }
            if startTime.minute > 30 {
                numberOfIntervals -= 1
            }
            return numberOfIntervals
        }
        
    }
    
    
    
    
    
    
    
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////
    //                 Time Related Functions
    ////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    
    func setTimeClassObjects(timeObjects: Time, timeArray: [Int]) {
        timeObjects.setYear(updatedYear: timeArray[0])
        timeObjects.setMonth(updatedMonth: timeArray[1])
        timeObjects.setDay(updatedDay: timeArray[2])
        timeObjects.setHour(updatedHour: timeArray[3])
        timeObjects.setMinutes(updatedMinutes: timeArray[4])
        timeObjects.setSeconds(updatedSeconds: timeArray[5])
        
    }
    
    func setCurrentTime() {
        defer {
            let time = getCurrentTimeArray()
            setTimeClassObjects(timeObjects: currentTime, timeArray: time)
        }
        
        func getCurrentTimeArray() -> [Int] {
            let currentDate = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy:MM:dd:HH:mm:ss"
            let convertedDate = dateFormatter.string(from: currentDate)
            var seperatedComponents = convertedDate.components(separatedBy: ":")
            let intSeperatedComponents = [Int(seperatedComponents[0])!, Int(seperatedComponents[1])!, Int(seperatedComponents[2])!, Int(seperatedComponents[3])!, Int   (seperatedComponents[4])!, Int(seperatedComponents[5])!]
            return intSeperatedComponents
        }
    }
    //
    
    func setLastDayTracked() {
        //        setCurrentTime()
        lastDayTracked = currentTime
        
        
    }
    
    func setTomorrowsDate() {
        let tomorrowsDate = Date(timeIntervalSinceNow: 86400)
        let tomorrowsTimeArray = getDateAndTimeArray(dateObject: tomorrowsDate)
        setTimeClassObjects(timeObjects: tomorrow, timeArray: tomorrowsTimeArray)
    }
    
    func setStartTime() {
        let startTimeDateAndTime = getDateAndTimeArray(dateObject: Date())
        setTimeClassObjects(timeObjects: startTime, timeArray: startTimeDateAndTime)
    }
    
    func setBedTime() {
        bedTime = startTime
        if bedTimeHour > 24 {
            setTomorrowsDate()
            bedTime = tomorrow
            bedTime.setHour(updatedHour: bedTimeHour - 24)
            
        } else {
            bedTime.setHour(updatedHour: bedTimeHour)
            
            
        }
        bedTime.setMinutes(updatedMinutes: 0)
        bedTime.setSeconds(updatedSeconds: 0)
        
        
    }
    
    
    func getDateAndTimeArray(dateObject: Date) -> [Int] {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy:MM:dd:HH:mm:ss"
        let convertedDate = dateFormatter.string(from: dateObject)
        var seperatedComponents = convertedDate.components(separatedBy: ":")
        let intSeperatedComponents = [Int(seperatedComponents[0])!, Int(seperatedComponents[1])!, Int(seperatedComponents[2])!, Int(seperatedComponents[3])!, Int   (seperatedComponents[4])!, Int(seperatedComponents[5])!]
        return intSeperatedComponents
    }
    
    func getTimeInSecondsFromStart(time: Time) -> Int {
        let startTimeInSeconds = startTime.getTimeInSeconds()
        let timeInSeconds = time.getTimeInSeconds()
        
        return timeInSeconds - startTimeInSeconds
    }


}

extension ViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        switch response.actionIdentifier {
        case "addWaterInteraction":
            addCurrentAmountToTotal()
        case "addWaterAndGoInteraction":
            addCurrentAmountToTotal()
        default:
            print("Error")
        }
    }
}
