//
//  SubHomeHeaderView.swift
//  NewsFirst
//
//  Created by Ankit Sojitra on 31/07/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//

import UIKit

class SubHomeHeaderView: UIView {
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnTag: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var imgvEye: UIImageView!
    @IBOutlet weak var lblViewCount: UILabel!
    
    
    class func instanceFromNib() -> SubHomeHeaderView {
        return UINib(nibName: "SubHomeHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! SubHomeHeaderView
    }
    
    override func draw(_ rect: CGRect) {
        setUI()
    }
    
    func setUI() {  // Set font and Color
    }
    
    
}

