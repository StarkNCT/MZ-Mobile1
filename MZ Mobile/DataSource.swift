//
//  DataSource.swift
//  MZ Mobile
//
//  Created by Тим on 11.04.2023.
//
import Foundation
import UIKit
import FeedKit
import SafariServices

class DataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var parent: UIViewController?
    
    var items: [RSSFeedItem] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath)
        
        guard let cell = cell as? ArticleCell
        else {
            return cell
        }
        
        
        let index = indexPath.row
        let item = items[index]
        
        
        cell.articleTitle.text = item.title ?? "Default Title"
        cell.articleBody.text = item.link ?? "NO LINK AVAILABLE"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //make a screen
        let index = indexPath.row
        let item = items[index]
        
        if let urlString = item.link, let parent = parent {
            let url: URL = URL(string: urlString)!
            let safariViewController = SFSafariViewController(url: url)
        
            parent.present(safariViewController, animated: true)
        }
        // webbrauser
        // presetnt
    }
}
