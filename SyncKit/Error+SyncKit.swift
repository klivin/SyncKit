//
//  Error+SyncKit.swift
//  SyncKit
//
//  Created by Kevin Weiler on 4/12/17.
//  Copyright © 2017 KLivin. All rights reserved.
//

import Foundation

extension NSError {
    class func noDataError() -> NSError{
        let error = NSError(domain: NetService.errorDomain, code: 101, userInfo: ["error": "No data returned"])
        return error
    }
    
    class func notParseableError() -> NSError{
        let error = NSError(domain: NetService.errorDomain, code: 101, userInfo: ["error": "Error returned is not parseable"])
        return error
    }
    
    class func customError(message: String) -> NSError {
        let error = NSError(domain: NetService.errorDomain, code: 102, userInfo: ["error": message])
        return error
    }
    
}
