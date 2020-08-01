//
//  BreakingNewsView.swift
//  NewsFirst
//
//  Created by Ankit Sojitra on 29/07/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//

import UIKit

class BreakingNewsView: UIView {
    
    var contentView:UIView?
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnClose: UIButton!
    
    var onButtonCloseTap: ((UIButton)->Void)? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        xibSetup()
    }
    
    func xibSetup() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        contentView = view
        setUI()
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "BreakingNewsView", bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func setUI() {
        lblTitle.font = AppFont.Bold_Body
        lblTitle.textColor = appTheamColor.white
        
        lblTime.font = AppFont.caption2
        lblTime.textColor = appTheamColor.white

        lblDescription.font = AppFont.Medium_Subhead
        lblDescription.textColor = appTheamColor.white
    }
    
    
    @IBAction func btnCloseTap(_ sender: UIButton) {
        if onButtonCloseTap != nil {
            onButtonCloseTap?(sender)
        }
    }
    
}

