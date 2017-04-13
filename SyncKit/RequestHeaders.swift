//
//  RequestHeaders.swift
//  SyncKit
//
//  Created by Kevin Weiler on 4/12/17.
//  Copyright © 2017 KLivin. All rights reserved.
//

import Foundation


struct RequestHeaders {
    
    static func allHeaders() -> [String : String]? {
        var headers = ["x-client-type" : "ios",
                       "x-client-version": "5.0" ]
        if let curVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            headers["x-client-version"] = curVersion
        }
        
        //        headers["Authorization"] = "Bearer " + "fake.session.asdfqwerqwer2341234"
        
        return headers
        
    }
}
