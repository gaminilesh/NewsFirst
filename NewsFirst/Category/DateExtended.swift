//
//  File.swift
//  MobifinX1_Swift
//
//  Created by ravi's imac on 9/7/17.
//  Copyright © 2017 ravi's imac. All rights reserved.
//

import Foundation

extension NSDate{

    func dateString(format:String)->String?{//Date To Return String
        
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale =  NSLocale(localeIdentifier: AppConfigure.fixLanguage) as Locale// Locale(identifier: AppConfigure.fixLanguage)

        let myString = formatter.string(from: self as Date)
        return myString
    }
    
}


extension Date {
    func daysBetweenDates(endDate: Date) -> Int?
    {
        let calendar = Calendar.current
         let components = calendar.dateComponents([.day], from: self, to: endDate)
         if let day = components.day {
            return day
        }
        return nil
    }

    func interval(ofComponent comp: Calendar.Component, fromDate date: Date) -> Int {
        
        let currentCalendar = Calendar.current
        
        guard let start = currentCalendar.ordinality(of: comp, in: .era, for: date) else { return 0 }
        guard let end = currentCalendar.ordinality(of: comp, in: .era, for: self) else { return 0 }
        
        return end - start
    }
    func dateString(format:String)->String?{//Date To Return String
        
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: AppConfigure.fixLanguage)

        let myString = formatter.string(from: self as Date)
        return myString
    }

    func dateStringWithLocalization(format:String)->String?{//Date To Return String
        
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: LLanguage.appleLanguage)

        let myString = formatter.string(from: self as Date)
        return myString
    }

    

    func getLast6Month() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -6, to: self)
    }
    
    func getLast3Month() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -3, to: self)
    }
    func getToday() -> Date? {
        return Calendar.current.date(byAdding: .day, value: 0, to: self)
    }
    
    func getYesterday() -> Date? {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)
    }

    func getLastWeekday() -> Date? {
        return Calendar.current.date(byAdding: .weekday, value: -1, to: self)
    }

    func getLast7Day() -> Date? {
        return Calendar.current.date(byAdding: .day, value: -7, to: self)
    }
    func getLast30Day() -> Date? {
        return Calendar.current.date(byAdding: .day, value: -30, to: self)
    }
    
    func getPreviousMonth() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -1, to: self)
    }
    
    // This Month Start
    func getThisMonthStart() -> Date? {
        let components = Calendar.current.dateComponents([.year, .month], from: self)
        return Calendar.current.date(from: components)!
    }
    
    func getThisMonthEnd() -> Date? {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.month += 1
        components.day = 1
        components.day -= 1
        return Calendar.current.date(from: components as DateComponents)!
    }
    
    //Last Month Start
    func getLastMonthStart() -> Date? {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.month -= 1
        return Calendar.current.date(from: components as DateComponents)!
    }
    
    //Last Month End
    func getLastMonthEnd() -> Date? {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.day = 1
        components.day -= 1
        return Calendar.current.date(from: components as DateComponents)!
    }
    
    
    
    
    
    
    //Last 3 Month Start
    func getLast3MonthStart() -> Date? {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.month -= 3
        return Calendar.current.date(from: components as DateComponents)!
    }
    
    //Last 3 Month End
    func getLast3MonthEnd() -> Date? {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.day = 1
        components.day -= 3
        return Calendar.current.date(from: components as DateComponents)!
    }

    
    
    //Last 6 Month Start
    func getLast6MonthStart() -> Date? {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.month -= 6
        return Calendar.current.date(from: components as DateComponents)!
    }
    
    //Last 6 Month End
    func getLast6MonthEnd() -> Date? {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.day = 1
        components.day -= 6
        return Calendar.current.date(from: components as DateComponents)!
    }

}



extension Date {
   
    var ticks: UInt64 {
        return UInt64((self.timeIntervalSince1970 + 62_135_596_800) * 10_000_000)
    }
   
    var age: Int {
        return Calendar.current.dateComponents([.year], from: self, to: Date()).year!
    }

   
    
    
    //Last Two Month Start
    func getLastTwoMonthStart() -> Date? {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.month -= 2
        return Calendar.current.date(from: components as DateComponents)!
    }
    
    //Last Two Month End
    func getLastTwoMonthEnd() -> Date? {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.day = 2
        components.day -= 2
        return Calendar.current.date(from: components as DateComponents)!
    }
    
    
    //last Year Start
    func getLastYearStart() -> Date? {
        let components:NSDateComponents = Calendar.current.dateComponents([.year], from: self) as NSDateComponents
        components.year -= 1
        return Calendar.current.date(from: components as DateComponents)!

    }
    
    //Last Year End
    func getLastYearEnd() -> Date? {
        let components:NSDateComponents = Calendar.current.dateComponents([.year], from: self) as NSDateComponents
        components.year -= 1
        components.month = 12
        components.day = 31
        return Calendar.current.date(from: components as DateComponents)!
        
    }
    
    
    
    func getLastQuarterMonthStart() -> Date? {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.month -= 3
        return Calendar.current.date(from: components as DateComponents)!
    }
    
    
    func getLastQuarterMonthEnd() -> Date? {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.day = 3
        components.day -= 3
        return Calendar.current.date(from: components as DateComponents)!
    }
    
    
    func startOfWeek()-> Date {
        return Calendar.current.date(byAdding: .weekday, value: -7, to: self)!

//        let date = Calendar.current.date(from: Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))!
//        let dslTimeOffset = NSTimeZone.local.daylightSavingTimeOffset(for: date)
//        return date.addingTimeInterval(dslTimeOffset)
    }
    
    func endOfWeek()-> Date {
        return Calendar.current.date(byAdding: .weekday, value: -7, to: self)!
//        return Calendar.current.date(byAdding: .second, value: 604799, to: self.startOfWeek())!
    }
    func dateStringWithTimeZoneAndLocalization(format: String) -> String? {//Date To Return String
        
        let formatter = DateFormatter()
        formatter.dateFormat = format
        //formatter.locale = Locale(identifier: LLanguage.appleLanguageInShort)
        //formatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let myString = formatter.string(from: self as Date)
        return myString
    }
 }
