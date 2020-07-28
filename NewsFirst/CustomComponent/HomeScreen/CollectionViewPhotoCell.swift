//
//  CollectionViewPhotoCell.swift
//  NewsFirst
//
//  Created by Ankit Sojitra on 27/07/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//

import UIKit

class CollectionViewPhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var imgvPhoto: UIImageView!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnTag: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK:- Button Action
    @IBAction func btnShareTap(_ sender: UIButton) {
    }
    @IBAction func btnTagTap(_ sender: UIButton) {
    }
}

