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

    @IBOutlet weak var viewCount: UIView!

    class func instanceFromNib() -> SubHomeHeaderView {
        return UINib(nibName: "SubHomeHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! SubHomeHeaderView
    }
    
    override func draw(_ rect: CGRect) {
        setUI()
    }
    
    func setUI() {  // Set font and Color
        lblViewCount.text = "1000 People viewed this story"//obj.dateTime
        lblViewCount.font = AppFont.Medium_caption1
        lblViewCount.textColor = appTheamColor.white
        UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat,.autoreverse], animations: {
            self.imgvEye.alpha = 0.0
        }, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.hideWithAnimation(hidden: true)
        }

    }
    func hideWithAnimation(hidden: Bool) {
//        UIView.animate(withDuration: 0.2, delay: 0, options: [], animations: {
//            self.viewCount.alpha = 0 // Here you will get the animation you want
//        }, completion: { _ in
//            self.viewCount.isHidden = true // Here you hide it when animation done
//            self.layoutIfNeeded()
//        })
    }

    
}

