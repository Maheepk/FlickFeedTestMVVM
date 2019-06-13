//
//  BaseResponse.swift
//  FlickFeedTestMVVM
//
//  Created by Maheep on 06/06/19.
//  Copyright © 2019 Maheep. All rights reserved.
//

import UIKit
import Foundation

class JsonFlickerFeedResponse: Codable {
    
    var title: String?
    var link : String?
    var description : String?
    var modified : String?
    var items : [JsonFlickerItemResponse]?
    
    init() {
        
    }
    
    init(title : String?, link : String?, description : String?, modified : String?, items : [JsonFlickerItemResponse]?) {
        
        self.title = title
        self.link = link
        self.description = description
        self.modified = modified
        self.items = items
        
    }
    
    convenience init(data: Data?) throws {
        let me = try newJSONDecoder().decode(JsonFlickerFeedResponse.self, from: data!)
        try self.init(title: me.title, link: me.link, description: me.description, modified: me.modified, items: me.items)
        
    }
    
    func getModel(data: Data?) throws-> JsonFlickerFeedResponse  {
        let me = try newJSONDecoder().decode(JsonFlickerFeedResponse.self, from: data!)
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

