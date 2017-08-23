//
//  NewCommentViewController.swift
//  AccountabilityPartner
//
//  Created by Nico on 8/23/17.
//
//

import UIKit

class NewCommentViewController: UIViewController {

    func goToComments() {
        
    }
    
    func submitComment() {
        
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
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  

}
