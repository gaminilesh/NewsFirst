//
//  BottomCustomTabCell.swift
//  NewsFirst
//
//  Created by Ankit Sojitra on 29/07/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//

import UIKit

class BottomCustomTabCell: UICollectionViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var seperaterView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblTitle.font = AppFont.Headline
        lblTitle.textColor = appTheamColor.black
        seperaterView.backgroundColor = appTheamColor.red
    }

}
