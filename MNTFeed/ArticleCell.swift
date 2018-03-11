//
//  ArticleCell.swift
//  MNTFeed
//
//  Created by Cons Bulaqueña on 12/03/2018.
//  Copyright © 2018 consios. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var desc: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
