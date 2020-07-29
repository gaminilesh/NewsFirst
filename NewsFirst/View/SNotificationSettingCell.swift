//
//  LeftMenuCell.swift
//  MobifinX1_Swift
//
//  Created by nilesh on 29/01/18.
//  Copyright © 2018 ravi's imac. All rights reserved.
//

import UIKit

class SNotificationSettingCell: UITableViewCell {
    @IBOutlet weak var lblTittle: UILabel!
    @IBOutlet weak var btnOnOff: UIButton!

    var btnOnOffActionListener:((Bool)->Swift.Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .gray
        backgroundColor = UIColor.clear

        // Initialization code
        lblTittle.font = AppFont.Callout
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func btnAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if let btnOnOffActionListener = btnOnOffActionListener {
            btnOnOffActionListener(sender.isSelected)
        }
    }
}
