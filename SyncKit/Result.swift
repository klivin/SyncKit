//
//  Result.swift
//  SyncKit
//
//  Created by Kevin Weiler on 4/12/17.
//  Copyright © 2017 KLivin. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case fail(NSError)
}
extension Result {
    func errorMessage() ->  String? {
        print("creating error message")
        if case let .fail(error) = self, let message = error.userInfo["error"] as? String {
            return message
        }
        return nil
    }
    
}
