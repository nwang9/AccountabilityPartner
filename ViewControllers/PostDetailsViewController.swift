//
//  PostDetailsViewController.swift
//  AccountabilityPartner
//
//  Created by Nico on 8/10/17.
//
//

import Foundation
import UIKit
import Parse

class PostDetailsViewController: NavBarViewController {
    
    @IBOutlet weak var commentBox: UITextView!
    @IBOutlet weak var postAuthor: UILabel!
    @IBOutlet weak var postDescription: UITextView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var addCommentTextField: UITextField!
    var postId = ""
    
    //TableView
    
    @IBOutlet weak var commentDescription: UILabel!
    @IBOutlet weak var commentAuthor: UIButton!
    var comments = [PFObject]()
    @IBAction func sendCommentAuthorMessage(_ sender: Any) {
        
    }
    
    //Define rows
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
        
    }
    
    // Create cell
    public func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "postCell") as! PostTableViewCell

        cell.commentDescription.text = postDates[indexPath.row]
        
        return cell
    }

    
    // Sends you to the new comment Page
    func goToNewComment() {
        let vc:NewCommentViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chat") as! NewCommentViewController
        vc.postId = postId
        vc.postTitle = self.postTitle.text!
        self.navigationController?.pushViewController(vc,animated: true)
    }
    
    
    
    func getPostAndUsername() {
        let postQuery = PFQuery(className: "Post")
        postQuery.whereKey("objectId", equalTo: postId)
        postQuery.findObjectsInBackground(block: {(objects, error) in
            if let posts = objects {
                for post in posts {
                    if let title = post["title"] as? String {
                        self.postTitle.text = title
                    }
                    if let description = post["description"] as? String {
                        self.postDescription.text = description
                    }
                    
                    // Get Username
                    let userQuery = PFQuery(className:"User")
                    userQuery.whereKey("objectId", equalTo: post["user_id"])
                    userQuery.findObjectsInBackground(block: {(objects, error) in
                        if let users = objects {
                            for user in users {
                                self.postAuthor.text = user["username"] as! String
                                }
                            }
                        })

                    }
                }
            })
        }

    func getComments() {
        let commentQuery = PFQuery(className: "Comment")
    }

    @IBAction func sendPrivateMessage(_ sender: Any) {
        let vc:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chat")
        self.navigationController?.pushViewController(vc,animated: true)
    }
    
    
    @IBAction func submitComment(_ sender: Any) {
        
        let myComment = PFObject(className:"Comment")
        myComment["description"] = commentBox.text
        myComment["user_id"] = PFUser.current()
        myComment.saveInBackground()
    }
    
    override func viewDidLoad() {
        getPostAndUsername()
        getComments()
        addCommentTextField.addTarget(self, action: #selector(PostDetailsViewController.goToNewComment), for: UIControlEvents.touchDown)

    }
}
