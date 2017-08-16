//
//  NewPostViewController.swift
//  AccountabilityPartner
//
//  Created by Nico on 8/10/17.
//
//

import Foundation
import UIKit
import Parse

class NewPostViewController: UIViewController, UINavigationBarDelegate {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    
    @IBAction func submitNewPost(_ sender: Any) {
        let currentUser = PFUser.current()
        let myPost = PFObject(className:"Post")
        myPost["title"] = titleTextField.text
        myPost["description"] = descriptionTextField.text
        myPost["parent"] = currentUser
        
        // save Post
        myPost.saveInBackground()
        
        //Go Back to all posts
        let vc:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Homepage")
        self.navigationController?.pushViewController(vc,animated: true)

    }
    
}
