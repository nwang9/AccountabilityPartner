//
//  CommentTableViewCell.swift
//  AccountabilityPartner
//
//  Created by Nicholas Wang on 8/23/17.
//
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var commentDescription: UILabel!
    @IBOutlet weak var commentDate: UILabel!
    @IBOutlet weak var commentAuthor: UIButton!
    
    @IBAction func startChatWithCommenter(_ sender: Any) {
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
