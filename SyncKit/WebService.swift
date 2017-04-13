//
//  WebService.swift
//  SyncKit
//
//  Created by Kevin Weiler on 4/12/17.
//  Copyright © 2017 KLivin. All rights reserved.
//

import Foundation


final class Webservice {
    
    func parseErrorData(data : Data?) -> String? {
        guard let data = data else { return nil }
        if let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) {
            return (json as! JSONDictionary)["error"] as? String
        }
        return nil
    }
    
    func load<A>(resource: Resource<A>, completion: @escaping (Result<A>) -> ()) {
        let request = NSMutableURLRequest(resource: resource)
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            guard error != nil else {
                if let msg = self.parseErrorData(data: data) {
                    completion(Result.fail(NSError.customError(message: msg)))
                } else if let error = (response as? HTTPURLResponse)?.errorFromStatusCode() {
                    completion(Result.fail(error))
                } else {
                    completion(Result.fail(NSError.notParseableError()))
                }
                return
            }
            
            if let result = data.flatMap(resource.parse) {
                print("hi \(result)")
                completion(Result.success(result))
            } else {
                completion(Result.fail(NSError.noDataError()))
            }
        }
        task.resume()
    }
}
