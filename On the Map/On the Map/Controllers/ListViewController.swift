//
//  ListViewController.swift
//  On the Map
//
//  Created by osama on 5/1/20.
//  Copyright © 2020 Udacity. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, LocationSelectionDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dataProvider: DataProvider!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - UIViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(reloadStarted), name: .reloadStarted, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(reloadCompleted), name: .reloadCompleted, object: nil)
        
        dataProvider.delegate = self
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
        
        reloadCompleted()
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Helpers
    
    @objc func reloadStarted () {
        performUIUpdatesOnMain {
            self.activityIndicator.startAnimating()
        }
    }
    
    @objc func reloadCompleted() {
        performUIUpdatesOnMain {
            self.activityIndicator.stopAnimating()
            self.tableView.reloadData()
        }
    }
    
    // MARK: - LocationSelectionDelegate
    
    func didSelectLocation(info: StudentInformation) {
        openWithSafari(info.mediaURL)
    }
    
}

