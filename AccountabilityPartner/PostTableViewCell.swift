//
//  PostTableViewCell.swift
//  AccountabilityPartner
//
//  Created by Nico on 8/17/17.
//
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postDate: UILabel!
    
    @IBOutlet weak var postTitle: UIButton!
    
    @IBOutlet weak var postAuthor: UIButton!
    
    
    @IBAction func sendToChatPage(_ sender: Any) {
    }
    
    @IBAction func sendToPostDetails(_ sender: Any) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
