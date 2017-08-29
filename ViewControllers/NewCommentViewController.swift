//
//  NewCommentViewController.swift
//  AccountabilityPartner
//
//  Created by Nico on 8/23/17.
//
//

import UIKit
import Parse

class NewCommentViewController: UIViewController {

    @IBOutlet weak var currentTitle: UILabel!
    @IBOutlet weak var commentText: UITextView!
    
    var postTitle = ""
    var postId = ""
    
    func goToComments() {
        let vc:PostDetailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "postDetails") as! PostDetailsViewController
        self.navigationController?.pushViewController(vc,animated: true)
    }
    
    func submitComment() {
        let myComment = PFObject(className:"Comment")
        myComment["description"] = commentText.text
        myComment["post_id"] = postId
        myComment["user_id"] = PFUser.current()
        myComment.saveInBackground()
        
        //Go back to Post once comment is saved
        let vc:PostDetailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "postDetails") as! PostDetailsViewController
        self.navigationController?.pushViewController(vc,animated: true)
        
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Navbar setup
        let rightButtonItem = UIBarButtonItem.init(
            title: "Submit",
            style: .done,
            target: self,
            action: #selector(submitComment)
        )
        
        let leftButtonItem = UIBarButtonItem.init(
            title: "Back",
            style: .done,
            target: self,
            action: #selector(goToComments)
        )
        
        self.navigationItem.setRightBarButton(rightButtonItem, animated: false)
        self.navigationItem.setLeftBarButton(leftButtonItem, animated: false)
        self.navigationItem.title = "Add Comment"
        self.currentTitle.text = postTitle
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  

}
