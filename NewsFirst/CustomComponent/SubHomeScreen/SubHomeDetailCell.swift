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
        setUI()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUI() {  // Set font and Color
        lblTitle.text = ""//obj.dateTime
        lblTitle.font = AppFont.Bold_Title3
        lblTitle.textColor = appTheamColor.black
        
        lblAuthor.text = ""//obj.dateTime
        lblAuthor.font = AppFont.caption1
        lblAuthor.textColor = appTheamColor.grey

        
        lbldateTime.text = ""//obj.dateTime
        lbldateTime.font = AppFont.caption1
        lbldateTime.textColor = appTheamColor.grey

    }

    func setData() {
        guard let obj = objNews else {
            return
        }
        lblTitle.text = obj.title
        lblAuthor.text = "Story by: \(obj.storyby ?? "")"
        lbldateTime.text = obj.dateTime?.date(format: "dd-MM-yyyy HH:mm:ss")?.dateString(format: "dd MMM yyyy | HH:mm:ss a")
        if let str = obj.imageURl, str != "" {
            imgvPhoto.kf.setImage(with: URL(string: str)!)
        }
    }
}
