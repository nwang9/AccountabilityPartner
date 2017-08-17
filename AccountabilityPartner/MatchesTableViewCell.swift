//
//  MatchesTableViewCell.swift
//  AccountabilityPartner
//
//  Created by Nico on 8/17/17.
//
//

import UIKit

class MatchesTableViewCell: UITableViewCell {

    @IBOutlet weak var matchDisplayName: UILabel!
    
    
    
    @IBOutlet weak var messageTextField: UITextField!
    
    
    @IBAction func sendMessage(_ sender: Any) {
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
