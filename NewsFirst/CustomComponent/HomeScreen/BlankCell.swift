//
//  HomeTitleCell.swift
//  NewsFirst
//
//  Created by Ankit Sojitra on 28/07/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//

import UIKit

class BlankCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

