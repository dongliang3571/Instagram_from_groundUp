//
//  DetailTableViewCell.swift
//  instagram_from_scratch
//
//  Created by dong liang on 3/20/16.
//  Copyright © 2016 dong. All rights reserved.
//

import UIKit
import ParseUI

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImage: PFImageView!
    
    @IBOutlet weak var caption: UILabel!

    @IBOutlet weak var username: UILabel!
    
    
    
    var instagramPost: PFObject! {
        didSet {
            self.userImage.file = instagramPost["media"] as? PFFile
            self.userImage.loadInBackground()
            self.caption.text = instagramPost["caption"] as? String
            let user = instagramPost["author"] as? PFUser
            
            self.username.text = user?.username

            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
