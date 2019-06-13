//
//  FlickerFeedViewController.swift
//  FlickFeedTestMVVM
//
//  Created by Maheep on 06/06/19.
//  Copyright © 2019 Maheep. All rights reserved.
//

import UIKit

class FlickerFeedViewController: UIViewController {

    var flickerFeedViewModel : FlickerFeedViewModel!
    
    @IBOutlet weak var tableView : UITableView!

    @IBOutlet weak var activityIndicator : UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViewModel()
    }
    
    
    func initViewModel() {
        
        activityIndicator.isHidden = true
        flickerFeedViewModel = FlickerFeedViewModel(self)
    }
    
}

extension FlickerFeedViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flickerFeedViewModel.flickerFeedViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlickerFeedCell", for: indexPath) as! FlickerFeedTableViewCell
        
        cell.setupCell(flickerFeedViewModel.flickerFeedViewModel[indexPath.row])
        
        return cell
    }
}


extension FlickerFeedViewController : FlickerFeedViewModelDelegate {
    func flickerFeedGetError(_ error: Error?) {
        activityIndicator.isHidden = true
        
        self.perform(#selector(self.alert(message:title:)), with: error?.localizedDescription ?? "", afterDelay: 1)
        
    }
    
    func flickerFeedData(_ viewModel: FlickerFeedViewModel?) {
        
        activityIndicator.isHidden = true
        self.tableView.reloadData()
    }
    
}
