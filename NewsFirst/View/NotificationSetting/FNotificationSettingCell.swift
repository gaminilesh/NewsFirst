//
//  LeftMenuCell.swift
//  MobifinX1_Swift
//
//  Created by nilesh on 29/01/18.
//  Copyright © 2018 ravi's imac. All rights reserved.
//

import UIKit

class FNotificationSettingCell: UITableViewCell {
    @IBOutlet weak var lblTittle: UILabel!
    @IBOutlet weak var switchOnOff: UISwitch!
    var switchOnOffActionListener:((Bool)->Swift.Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .gray
        backgroundColor = UIColor.clear

        // Initialization code
        lblTittle.font = AppFont.Title3
        lblTittle.textColor = appTheamColor.black
    }

    @IBAction func switchValueChange(_ sender: UISwitch) {
        if let switchOnOffActionListener = switchOnOffActionListener {
            switchOnOffActionListener(sender.isOn)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
