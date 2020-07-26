//
//  ddd.swift
//  MobifinElite
//
//  Created by Nilesh on 06/03/20.
//  Copyright © 2020 Panamax IOS Team. All rights reserved.
//

import UIKit

extension UICollectionView {
    func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
