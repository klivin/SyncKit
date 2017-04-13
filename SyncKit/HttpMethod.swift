//
//  HttpMethod.swift
//  SyncKit
//
//  Created by Kevin Weiler on 4/12/17.
//  Copyright © 2017 KLivin. All rights reserved.
//

import Foundation

enum HttpMethod<Body> {
    case get
    case put(Body)
    case delete
    case post(Body)
}

extension HttpMethod {
    var string: String {
        get {
            switch self {
            case .get:
                return "GET"
            case .put:
                return "PUT"
            case .post:
                return "POST"
            case .delete:
                return "DELETE"
            }
        }
    }
    func map<B>(f:(Body) -> B) -> HttpMethod<B> {
        switch self {
        case .get:
            return .get
        case .post(let body):
            return .post(f(body))
        case .delete:
            return .delete
        case .put(let body):
            return .put(f(body))
        }
    }
}
