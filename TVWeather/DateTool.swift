//
//  DateTool.swift
//  Weather
//
//  Created by Mujtaba Alam on 24/10/2016.
//  Copyright © 2016 Mujtaba Alam. All rights reserved.
//

import Foundation


class DateTool: NSObject {
    
    // MARK: - Day from Unix Time
    
    static func dayFrom(time: Int) -> String {
        return dayFrom(time: time, showTime: false)
    }
    
    /**
     Get day/time from unix time
     - Parameter time: Pass unix time
     - Parameter showTime: Boolean to show time
     
     - Returns: Day or Day with time
     
     */
    
    static func dayFrom(time: Int, showTime: Bool) -> String {
        let date = NSDate(timeIntervalSince1970: TimeInterval(time))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = showTime ? "HH:mm" : "EE"
        return dateFormatter.string(from: date as Date)
    }
}
