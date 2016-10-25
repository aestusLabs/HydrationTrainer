//
//  Time.swift
//  Hydration Trainer
//
//  Created by Ian Kohlert on 2016-10-25.
//  Copyright © 2016 Ian Kohlert. All rights reserved.
//

import Foundation

class Time {
    var year = 0
    var month = 0
    var day = 0
    var hour = 0
    var minute = 0
    var seconds = 0
    
    //    var daysInMonth = 30
    
    func setYear(updatedYear:Int) {
        year = updatedYear
    }
    func setMonth(updatedMonth: Int) {
        month = updatedMonth
    }
    func setDay(updatedDay: Int) {
        day = updatedDay
    }
    func setHour(updatedHour: Int) {
        hour = updatedHour
    }
    func setMinutes(updatedMinutes: Int) {
        minute = updatedMinutes
    }
    func setSeconds(updatedSeconds: Int) {
        seconds = updatedSeconds
    }
    
    func getTimeInSeconds() -> Int {
        let yearInSeconds = year * 31536000
        let monthInSeconds = month * 2628000
        let dayInSeconds = day * 86400
        let hourInSeconds = hour * 3600
        let minuteInSeconds = minute * 60
        
        return yearInSeconds + monthInSeconds + dayInSeconds + hourInSeconds + minuteInSeconds + seconds
    }
    
    
    
}
