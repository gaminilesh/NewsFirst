//
//  LeftMenuCell.swift
//  MobifinX1_Swift
//
//  Created by nilesh on 29/01/18.
//  Copyright © 2018 ravi's imac. All rights reserved.
//

import UIKit

class SaveStoryCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitile: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .gray
        backgroundColor = UIColor.clear
        
        lblTitle.font = AppFont.Body
        lblTitle.textColor = appTheamColor.black

        lblSubTitile.font = AppFont.Footnote
        lblSubTitile.textColor = appTheamColor.grey

        imgView.layer.cornerRadius = 4
        imgView.clipsToBounds = true

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
