//
//  Date+SyncKit.swift
//  SyncKit
//
//  Created by Kevin Weiler on 4/12/17.
//  Copyright © 2017 KLivin. All rights reserved.
//

import Foundation

var _utcDateFormatter : DateFormatter? = nil

extension DateFormatter {
    class func utcDateFormatter() -> DateFormatter {
        if _utcDateFormatter == nil {
            let formatter =  DateFormatter()
            formatter.dateFormat = "yyyy'-'MM'-'dd' 'HH':'mm':'ss'"
            formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
            formatter.timeZone = TimeZone(identifier: "UTC")
            _utcDateFormatter = formatter
        }
        return _utcDateFormatter!;
        
    }
}
