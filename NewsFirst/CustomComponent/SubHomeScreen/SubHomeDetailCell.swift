//
//  SubHomeDetailCell.swift
//  NewsFirst
//
//  Created by Ankit Sojitra on 31/07/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//

import UIKit

class SubHomeDetailCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lbldateTime: UILabel!
    @IBOutlet weak var imgvPhoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
