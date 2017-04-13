//
//  URLResponse+SyncKit.swift
//  SyncKit
//
//  Created by Kevin Weiler on 4/12/17.
//  Copyright © 2017 KLivin. All rights reserved.
//

import Foundation

extension HTTPURLResponse {
    func errorFromStatusCode() -> NSError {
        let errorMsg = HTTPURLResponse.localizedString(forStatusCode: statusCode)
        let error = NSError(domain: NetService.errorDomain, code: statusCode, userInfo: ["error": errorMsg])
        return error
    }
}
