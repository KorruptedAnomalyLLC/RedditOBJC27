//
//  PostTableViewController.swift
//  RedditOBJC27
//
//  Created by Austin West on 7/3/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import UIKit

class PostTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        AJDWPostController.shared().fetchPosts { (success) in
            if success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                // Cry... Alot.
            }
        }

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return AJDWPostController.shared().posts.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell

        let post = AJDWPostController.shared().posts[indexPath.row]
        
        AJDWPostController.shared().fetchImage(post) { (image) in
            DispatchQueue.main.async {
                cell?.titleLabel.text = post.title
                cell?.nameLabel.text = post.name
                cell?.postImageView.image = image
            }
        }
        return cell ?? UITableViewCell()
    }
    
}
