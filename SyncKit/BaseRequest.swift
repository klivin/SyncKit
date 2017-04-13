//
//  BaseRequest.swift
//  SyncKit
//
//  Created by Kevin Weiler on 4/12/17.
//  Copyright © 2017 KLivin. All rights reserved.
//

import Foundation

protocol BaseRequest {
    var rootKey : String { get }
    var url : NSURL { get set }
}

extension BaseRequest {
    var rootKey : String {
        get {
            return "result"
        }
    }
}
