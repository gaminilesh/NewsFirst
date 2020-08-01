//
//  SubHomeHeaderView.swift
//  NewsFirst
//
//  Created by Ankit Sojitra on 31/07/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//

import UIKit

class SubHomeHeaderView: UIView {
    @IBOutlet weak var btnFontA: UIButton!
    @IBOutlet weak var btnFontAPluse: UIButton!
    @IBOutlet weak var btnFontAPlusePluse: UIButton!
    @IBOutlet weak var btnClose: UIButton!

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnTag: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var imgvEye: UIImageView!
    @IBOutlet weak var lblViewCount: UILabel!

    @IBOutlet weak var viewCount: UIView!

    @IBAction func btnAPlusePluse(_ sender: Any) {
//        isHiddenAnimated(value: false)
    }
    @IBAction func btnCloseAction(_ sender: Any) {
//        isHiddenAnimated(value: true)
    }
    
    func isHiddenAnimated(value: Bool, duration: Double = 0.2) {
        UIView.animate(withDuration: duration) { [weak self] in
            self?.btnFontA.isHidden = value
            self?.btnFontAPluse.isHidden = value
            self?.btnClose.isHidden = value
        }
    }

    class func instanceFromNib() -> SubHomeHeaderView {
        return UINib(nibName: "SubHomeHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! SubHomeHeaderView
    }
    
    override func draw(_ rect: CGRect) {
        setUI()
    }
    
    func setUI() {  // Set font and Color
        lblViewCount.text = "1000 People viewed this story"//obj.dateTime
        lblViewCount.font = AppFont.Medium_Footnote
        lblViewCount.textColor = appTheamColor.white
        
        lblTitle.font = AppFont.Medium_Title2
        lblTitle.textColor = appTheamColor.black

        btnBack.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        btnBack.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        btnBack.layer.shadowOffset = CGSize(width: 0, height: 2)
        btnBack.layer.shadowOpacity = 1.0
        btnBack.layer.shadowRadius = 10.0
        btnBack.layer.masksToBounds = false
        btnBack.adjustsImageWhenHighlighted = false

        isHiddenAnimated(value: true)
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
    
    
    var handleBackButton : ((UIButton)->Void)? = nil
    @IBAction func btnBackTap(_ sender: UIButton) {
        if handleBackButton != nil {
            handleBackButton?(sender)
        }
    }
    
    
}

