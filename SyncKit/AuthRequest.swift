//
//  AuthRequest.swift
//  SyncKit
//
//  Created by Kevin Weiler on 4/12/17.
//  Copyright © 2017 KLivin. All rights reserved.
//

import Foundation


struct AuthToken {
    let sessionToken : String
    init(json : JSONDictionary) {
        sessionToken = json["result"] as! String
    }
}

struct AuthRequest : BaseRequest {
    var url = NSURL(string: "TODO")!
    
    func get(facebookToken: String) -> Resource<AuthToken>? {
        let params = ["facebookToken": facebookToken]
        let auth = Resource<AuthToken>(url: url, method: HttpMethod.post(params), parseJSON: AuthToken.init)
        return auth
    }
}
