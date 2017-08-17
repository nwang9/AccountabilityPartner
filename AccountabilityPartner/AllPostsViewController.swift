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
    @IBAction func goToPostDetails(_ sender: Any) {
    }
    
    @IBAction func sendMessage(_ sender: Any) {
    }
    @IBOutlet weak var postAuthor: UIButton!
    @IBOutlet weak var postDate: UILabel!
    
    
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
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "postCell")
        
        
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
        return cell
    }
    

}
