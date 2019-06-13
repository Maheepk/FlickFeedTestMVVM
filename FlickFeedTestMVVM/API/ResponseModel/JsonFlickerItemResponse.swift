//
//  JsonFlickerItem.swift
//  FlickFeedTestMVVM
//
//  Created by Maheep on 06/06/19.
//  Copyright © 2019 Maheep. All rights reserved.
//

import Foundation

class JsonFlickerItemResponse: Codable {
    
    var title: String?
    var link : String?
    var data_taken : String?
    var published : String?
    var author : String?
    var media : JsonFlickerMediaResponse?
    
    init() {
        
    }
    
    init(title: String?, link: String?, data_taken: String?, author : String?, media : JsonFlickerMediaResponse?) {
        
        self.title = title
        self.link = link
        self.data_taken = data_taken
        self.author = author
        self.media = media
    }
    
    convenience init(data: Data?) throws {
        let me = try newJSONDecoder().decode(JsonFlickerItemResponse.self, from: data!)
        try self.init(title: me.title, link: me.link, data_taken: me.data_taken, author: me.author, media: me.media)
        
    }
    
    func getModel(data: Data?) throws-> JsonFlickerItemResponse  {
        let me = try newJSONDecoder().decode(JsonFlickerItemResponse.self, from: data!)
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

