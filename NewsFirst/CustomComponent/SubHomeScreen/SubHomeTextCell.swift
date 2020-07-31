//
//  SubHomeTextCell.swift
//  NewsFirst
//
//  Created by Ankit Sojitra on 31/07/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//

import UIKit

class SubHomeTextCell: UITableViewCell {

    @IBOutlet weak var lblText: UILabel!
    
    var objNews : News? {
        didSet {
            setData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUI() {  // Set font and Color
        lblText.text = ""//obj.dateTime
        lblText.font = AppFont.Callout
        lblText.textColor = appTheamColor.black
    }

    func setData() {
        guard let obj = objNews else {
            return
        }
        lblText.text = obj._description
    }
}
