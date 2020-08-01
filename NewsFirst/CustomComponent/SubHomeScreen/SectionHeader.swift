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
    @IBOutlet weak var viewOne: UIView!
    @IBOutlet weak var viewSecond: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        lblTitle.text = "Popular Stories"//obj.dateTime
        lblTitle.font = AppFont.Medium_Title3
        lblTitle.textColor = appTheamColor.black

        drawDottedLine(start: CGPoint(x: viewOne.bounds.minX, y: viewOne.bounds.minY), end: CGPoint(x: viewOne.bounds.maxX, y: viewOne.bounds.minY), view: viewOne)
        drawDottedLine(start: CGPoint(x: viewOne.bounds.minX, y: viewOne.bounds.minY), end: CGPoint(x: viewOne.bounds.maxX, y: viewOne.bounds.minY), view: viewSecond)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
