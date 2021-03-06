//
//  LeftMenuCell.swift
//  MobifinX1_Swift
//
//  Created by nilesh on 29/01/18.
//  Copyright © 2018 ravi's imac. All rights reserved.
//

import UIKit

class LeftMenuCell: UITableViewCell {
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var imgArrowIcon: UIImageView!
    @IBOutlet weak var switchControler: UISwitch!

    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblName.font = AppFont.Subhead
        lblName.textColor = appTheamColor.black
    }
    @IBAction func switchValueChange(_ sender: UISwitch) {
        if sender.isOn == true{
            switchControler.tintColor = appTheamColor.green
        }else{
            switchControler.tintColor = appTheamColor.red
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // this is new
    // check ankit
}
