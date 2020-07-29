//
//  LeftMenuCell.swift
//  MobifinX1_Swift
//
//  Created by nilesh on 29/01/18.
//  Copyright © 2018 ravi's imac. All rights reserved.
//

import UIKit

class HNotificationSettingCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .gray
        backgroundColor = UIColor.clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
