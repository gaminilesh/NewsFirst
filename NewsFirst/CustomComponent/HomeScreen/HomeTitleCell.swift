//
//  HomeTitleCell.swift
//  NewsFirst
//
//  Created by Ankit Sojitra on 28/07/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//

import UIKit

class HomeTitleCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var imgvPhoto: UIImageView!
    @IBOutlet weak var imgvShadow: UIImageView!
    
    
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
        lblTitle.text = ""
        lblTitle.font = AppFont.Bold_Title3
        lblTitle.textColor = appTheamColor.white
        
        lblTime.text = ""//obj.dateTime
        lblTime.font = AppFont.Bold_Footnote
        lblTime.textColor = appTheamColor.white

    }
    
   
    func setData() {
        guard let obj = objNews else {
            return
        }
        lblTitle.text = obj.title
        lblTime.text = "5 Minutes ago"//obj.dateTime
        if let str = obj.imageURl, str != "" {
            imgvPhoto.kf.setImage(with: URL(string: str)!)
        }
    }
    
}

