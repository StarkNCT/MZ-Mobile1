//
//  ViewController.swift
//  MZ Mobile
//
//  Created by Тим on 11.04.2023.
//

import UIKit
import FeedKit

class ViewController: UIViewController {
    
    @IBOutlet  weak var dataSource: DataSource!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        dataSource.parent = self
        
        let feedURLString = "https://zona.media/rss"
        
        let feedURL: URL = URL(string: feedURLString)!
        
        let parser = FeedParser(URL: feedURL)
        
        
        parser.parseAsync { (result: Result<Feed, ParserError>) in
            switch result {
            case .success(let feed):
                if let rssFeed = feed.rssFeed, let items = rssFeed.items {
                    DispatchQueue.main.async {
                        //update
                        self.dataSource.items = items
                        self.tableView.reloadData()
                    }
                }
                
            case .failure(let error):
                print("FEED ERROR: \(error.errorDescription)")
            }
            
        }
        
    }
    

}

