//
//  FlickerFeedViewModel.swift
//  FlickFeedTestMVVM
//
//  Created by Maheep on 06/06/19.
//  Copyright © 2019 Maheep. All rights reserved.
//

import Foundation

protocol FlickerFeedViewModelDelegate {
    
    func flickerFeedData(_ viewModel : FlickerFeedViewModel?)
    
    func flickerFeedGetError(_ error : Error?)
}

class FlickerFeedViewModel {
    
    public var flickerFeedModel = JsonFlickerItemResponse()
    
    var flickerFeedViewModel = [FlickerFeedViewModel]()
    
    var delegate : FlickerFeedViewModelDelegate?
    
    init(flickerFeedModel: JsonFlickerItemResponse)
    {
        self.flickerFeedModel = flickerFeedModel
    }
    
    init( _ delegate : FlickerFeedViewModelDelegate)
    {
        self.delegate = delegate
        
        fetchFlickerFeeds { (success, response, error) in
            
            if success {
                self.delegate?.flickerFeedData(self)
            } else {
                self.delegate?.flickerFeedGetError(error)
            }
        }
    }
    
    func getFlickerFeedViewModel(_ items : [JsonFlickerItemResponse]?) -> [FlickerFeedViewModel] {
        
        var flickerFeedViewModels = [FlickerFeedViewModel]()
        
        if let array = items {
            for obj in array {
                flickerFeedViewModels.append(FlickerFeedViewModel.init(flickerFeedModel: obj))
            }
            return flickerFeedViewModels
        }
        return flickerFeedViewModels
        
    }
    
    func fetchFlickerFeeds(requestCompleted : @escaping (_ succeeded: Bool, _ result: JsonFlickerFeedResponse?, _ error : Error?) -> ()) {
        
        FlickerFeedService().getFlickerFeed(success: { (response) in
            
            self.flickerFeedViewModel = self.getFlickerFeedViewModel(response.items)
            
            requestCompleted(true, response, nil)
            
        }) { (error) in
            requestCompleted(false,nil,error)
            log.debug(error)
        }
        
    }
    
    public var authorValue: String {
        return flickerFeedModel.author ?? ""
    }

    public var mediaUrl: String {
        return flickerFeedModel.media?.m ?? ""
    }
}
