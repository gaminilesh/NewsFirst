//
//  SubHomeDetailCell.swift
//  NewsFirst
//
//  Created by Ankit Sojitra on 31/07/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//

import UIKit

class SubHomeDetailCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lbldateTime: UILabel!
    @IBOutlet weak var imgvPhoto: UIImageView!
    
    var objNews : NewsDetail? {
        didSet {
            setData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData() {
        guard let obj = objNews else {
            return
        }
        lblTitle.text = obj._description
        lblAuthor.text = obj.storyby
        lbldateTime.text = obj.dateTime
        if let str = obj.imageURl, str != "" {
            imgvPhoto.kf.setImage(with: URL(string: str)!)
        }
    }
}
