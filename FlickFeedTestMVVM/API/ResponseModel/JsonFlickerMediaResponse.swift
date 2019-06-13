//
//  JsonFlickerMediaResponse.swift
//  FlickFeedTestMVVM
//
//  Created by Maheep on 06/06/19.
//  Copyright © 2019 Maheep. All rights reserved.
//

import Foundation

class JsonFlickerMediaResponse:Codable {
    
    var m : String?
    

    init(m: String?) {
        
        self.m = m
    }
    
    convenience init(data: Data?) throws {
        let me = try newJSONDecoder().decode(JsonFlickerMediaResponse.self, from: data!)
        try self.init(m: me.m)
        
    }
    
    func getModel(data: Data?) throws-> JsonFlickerMediaResponse  {
        let me = try newJSONDecoder().decode(JsonFlickerMediaResponse.self, from: data!)
        return me
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    func jsonData() throws -> Data? {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: (try self.jsonData())!, encoding: encoding)
    }
    
    
}

