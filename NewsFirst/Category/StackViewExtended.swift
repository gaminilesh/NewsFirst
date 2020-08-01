//
//  ff.swift
//  MobifinElite
//
//  Created by Nilesh on 06/03/20.
//  Copyright © 2020 Panamax IOS Team. All rights reserved.
//

import UIKit

extension UIStackView {
    func removeAllArrangedSubviews() {
        arrangedSubviews.forEach { $0.removeFromSuperview() }


//        let removedSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
//            self.removeArrangedSubview(subview)
//            return allSubviews + [subview]
//        }
//
//        for v in removedSubviews {
//            if v.superview != nil {
//                NSLayoutConstraint.deactivate(v.constraints)
//                v.removeFromSuperview()
//            }
//        }
    }
}
