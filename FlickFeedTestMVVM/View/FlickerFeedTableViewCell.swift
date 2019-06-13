//
//  FlickerFeedTableViewCell.swift
//  FlickFeedTestMVVM
//
//  Created by Maheep on 06/06/19.
//  Copyright © 2019 Maheep. All rights reserved.
//

import UIKit
import SDWebImage

class FlickerFeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backgroundImage : UIImageView!
    
    @IBOutlet weak var authorLabel : UILabel!
    
    var flickerViewModel : FlickerFeedViewModel?
    
    func setupCell(_ flickerViewModel : FlickerFeedViewModel?)  {
        
        if let _flickerViewModel = flickerViewModel {
            
            self.authorLabel.text =  _flickerViewModel.authorValue
            self.backgroundImage.sd_setImage(with: URL(string: _flickerViewModel.mediaUrl), completed: nil)
        }
        
    }
    
}
