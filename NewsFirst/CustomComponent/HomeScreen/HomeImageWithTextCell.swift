//
//  HomeImageWithTextCell.swift
//  NewsFirst
//
//  Created by Ankit Sojitra on 27/07/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//

import UIKit
import Kingfisher

class HomeImageWithTextCell: UITableViewCell {

    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imgvPhoto: UIImageView!
    
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
        imgvPhoto.layer.cornerRadius = 8
        imgvPhoto.clipsToBounds = true
        lblDescription.font = AppFont.Callout
        lblDescription.textColor = .black
    }
    
    func setData() {
        guard let obj = objNews else {
            return
        }
        lblDescription.text = obj.title
        if let str = obj.imageURl, str != "" {
            imgvPhoto.kf.setImage(with: URL(string: str)!)
        }
    }
}
