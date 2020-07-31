//
//  CustomTitleView.swift
//  MobifinElite
//
//  Created by Nilesh on 14/04/20.
//  Copyright © 2020 Panamax IOS Team. All rights reserved.
//

import UIKit

class NavigationTitleView: UIView {
    @IBOutlet weak var contentView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        translatesAutoresizingMaskIntoConstraints = false
    }

    override var intrinsicContentSize: CGSize {
      return UIView.layoutFittingExpandedSize
    }
    private func commonInit() {
        Bundle.main.loadNibNamed("NavigationTitleView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}
