//
//  AllPostsViewController.swift
//  AccountabilityPartner
//
//  Created by Nico on 8/10/17.
//
//

import Foundation
import UIKit
import Parse

class AllPostsViewController: NavBarViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var postTitle: UIButton!
    @IBAction func goToPostDetails(_ sender: UIButton) {
        let vc:PostDetailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "postDetails") as! PostDetailsViewController
        vc.postId = sender.accessibilityIdentifier!
        self.navigationController?.pushViewController(vc,animated: true)
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        let vc:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chat")
        self.navigationController?.pushViewController(vc,animated: true)
    }
    
    
    @IBOutlet weak var postAuthor: UIButton!
    @IBOutlet weak var postDate: UILabel!
    
    //arrays to organize post attributes
    var postTitles = [String]()
    var postAuthors = [String]()
    var postDates = [String]()
    var postIds = [String]()
    
    // Brings you to the new post creation page
    @IBAction func goToNewPost(_ sender: Any) {
        let vc:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "newPost")
        self.navigationController?.pushViewController(vc,animated: true)
    }
    
    //Define rows etc.
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
        
    }
    
    // Create cell
    public func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "postCell") as! PostTableViewCell
        
        cell.postTitle.setTitle(postTitles[indexPath.row],for: .normal)
        cell.postTitle.accessibilityIdentifier = postIds[indexPath.row]
        
        cell.postAuthor.setTitle(postAuthors[indexPath.row], for: .normal)
        
        cell.postDate.text = postDates[indexPath.row]
        
        return cell
        
        /*cell.textLabel?.text = "1 " + item.Size + " " + item.Color + " " + item.objectType
        for groupItem in foundIds {
            if item.Id == groupItem {
                cell.backgroundColor = UIColor.green
                break
            } else {
                cell.backgroundColor = UIColor.red
            }
        }
        */
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //For post date calculations
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let userQuery = PFQuery(className: "User")
        let postQuery = PFQuery(className: "Post")
        postQuery.findObjectsInBackground(block: { (objects, error) in
            if let posts = objects {
                for post in posts {
                    // Fill Arrays with Data
                    if let postTitle = post["title"] as? String {
                        self.postTitles.append(postTitle)
                        self.postIds.append(post.objectId!) as? String
                    }
                    if let postDate = formatter.string(from: post.createdAt!) as? String {
                        self.postDates.append(postDate)
                    }
                    // Find the User who made each post
                    userQuery.whereKey("object_id", equalTo: post["user_id"])
                    userQuery.findObjectsInBackground(block: {(objects, error) in
                        if let users = objects {
                            for user in users {
                                self.postAuthors.append(user["username"] as! String)
                            }
                        }
                    })
                    
                }
            }
        })
    }
 
}
