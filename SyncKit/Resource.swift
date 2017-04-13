//
//  Resource.swift
//  SyncKit
//
//  Created by Kevin Weiler on 4/12/17.
//  Copyright © 2017 KLivin. All rights reserved.
//

import Foundation

struct Resource<A> {
    let url : NSURL
    let method : HttpMethod<Data>
    let parse : (Data) -> A?
    let contentType : String?
    var headerFields : [String: String]?
}

extension Resource {
    init(url: NSURL, method : HttpMethod<Any> = .get, contentType: String = "application/json", parseJSON: @escaping (JSONDictionary) -> A?) {
        self.headerFields = RequestHeaders.allHeaders()
        self.contentType = contentType
        self.url = url
        self.method = method.map(f: { json in
            return try! JSONSerialization.data(withJSONObject: json, options: [])
        })
        self.parse = {
            data in
            
            print("we're parsing")
            do {
                let jsonData = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions())
                let jsonDict = jsonData as! JSONDictionary
                return parseJSON(jsonDict) // if return nil, we assume error
            } catch let error as NSError {
                print(error)
            }
            return nil
        }
    }
}
