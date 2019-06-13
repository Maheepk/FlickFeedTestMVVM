//
//  APIUrls.swift
//  FlickFeedTestMVVM
//
//  Created by Maheep on 06/06/19.
//  Copyright © 2019 Maheep. All rights reserved.
//

import Foundation

class APIUrls: NSObject {
    
    class func PHOTO_PUBLIC_URL() -> String {
        return String(format: "%@%@", Environment(),"feeds/photos_public.gne?tags=dog&tagmode=any&per_page=40&format=json&nojsoncallback=1");
    }
    
    // Base URL with respect to App Environment
    class func Environment() -> String
    {
//        switch HPBUtil.loadEnvironment() {
//        }
        
        return "https://www.flickr.com/services/"
    }
}
