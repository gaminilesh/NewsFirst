//
//  SectionHeader.swift
//  NewsFirst
//
//  Created by Ankit Sojitra on 01/08/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//

import UIKit

class SectionHeader: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        lblTitle.text = "Popular Stories"//obj.dateTime
        lblTitle.font = AppFont.Medium_Title3
        lblTitle.textColor = appTheamColor.black

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
