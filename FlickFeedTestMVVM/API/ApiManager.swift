//
//  ApiManager.swift
//  FlickFeedTestMVVM
//
//  Created by Maheep on 06/06/19.
//  Copyright © 2019 Maheep. All rights reserved.
//

import Foundation
import Alamofire

typealias JSObject = [String: Any]
typealias JSArray = [JSObject]

typealias Completion = (DataResponse<Any>) -> Void
typealias downloadCompletion = (HTTPURLResponse) -> Void

let api = ApiManager()

final class ApiManager {
    
    var defaultHTTPHeaders: [String: String] {
        let headers: [String: String] = ["Content-Type" : "application/json","Accept" : "application/json"]
        return headers
    }
    
    
//    var bearerToken :  [String : String] {
//        let bearerToken = "Bearer \(accessToken)"
//        return ["Authorization" : bearerToken]
//    }
}

