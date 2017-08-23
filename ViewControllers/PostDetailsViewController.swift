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
    
    
    addCommentTextField.addTarget(self, action: "goToNewComment :", forControlEvents: UIControlEvents.TouchDown)
    
    func myTargetFunction(textField: UITextField) {
        // user touch field
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
    }
}
