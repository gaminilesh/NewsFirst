//
//  HomeAdvertiseCell.swift
//  NewsFirst
//
//  Created by Ankit Sojitra on 01/08/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//

import UIKit

class SubHomeAdvertiseCell: UITableViewCell {
    
    @IBOutlet weak var imgvAds: UIImageView!
    
    
    var objNews : News? {
        didSet {
            setData()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imgvAds.layer.cornerRadius = 5
        self.imgvAds.clipsToBounds = true

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    func setData() {
        guard let obj = objNews else {
            return
        }
        
        if let str = obj.imageURl, str != "" {
            imgvAds.kf.setImage(with: URL(string: str)!)
        }
    }
    
}

