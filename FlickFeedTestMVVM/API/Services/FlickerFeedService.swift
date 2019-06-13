//
//  FlickerFeedService.swift
//  FlickFeedTestMVVM
//
//  Created by Maheep on 06/06/19.
//  Copyright © 2019 Maheep. All rights reserved.
//

import Foundation
import Alamofire

class FlickerFeedService {
    
    /**
     GET Flicker Feed from server request
     */
    
    func getFlickerFeed( success : ((_ response: JsonFlickerFeedResponse) -> Void)?, failure : @escaping failureBlock) {
        
        let urlStr = APIUrls.PHOTO_PUBLIC_URL()
        
        Client().sendTheWebServiceAccordingToType(method: .get, urlString: urlStr, parameters: nil, headers: nil, encoding: JSONEncoding.default, success: { (response) in
            
            do {
                
                if let data = response.data{
                    self.showResult(data: data)
                    let result = try JsonFlickerFeedResponse(data: data)
                    success?(result)
                } else {
                    failure(Api.Error.emptyData)
                }
            } catch {
                log.debug(error)
                failure(error)
            }
            
        }) { (error) in
            failure(error)
        }
        
    }
    
    func showResult(data : Data){
        do {
            if let jsonArray = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? Dictionary<String,Any>
            {
                log.debug(jsonArray)
            } else {
                log.debug("bad json")
            }
        } catch let error as NSError {
            log.debug(error)
        }
    }
}


