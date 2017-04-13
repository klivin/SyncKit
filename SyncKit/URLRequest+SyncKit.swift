//
//  URLRequest+SyncKit.swift
//  SyncKit
//
//  Created by Kevin Weiler on 4/12/17.
//  Copyright © 2017 KLivin. All rights reserved.
//

import Foundation

extension NSMutableURLRequest {
    convenience init<A>(resource: Resource<A>) {
        self.init(url: resource.url as URL)
        if let headers = resource.headerFields {
            for (key, value) in headers {
                setValue(key, forHTTPHeaderField: value)
            }
        }
        
        httpMethod = resource.method.string
        setValue(resource.contentType, forHTTPHeaderField: "Content-Type")
        
        if case let .post(data) = resource.method {
            httpBody = data as Data
        }
    }
}

