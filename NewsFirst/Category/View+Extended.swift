//
//  ff.swift
//  MobifinElite
//
//  Created by Nilesh on 06/03/20.
//  Copyright © 2020 Panamax IOS Team. All rights reserved.
//

import UIKit
//https://stackoverflow.com/questions/24857986/load-a-uiview-from-nib-in-swift
//extension UIView {
//    class func fromNib<T: UIView>() -> T {
//        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
//    }
//}
//
//public protocol NibInstantiatable {
//    static func nibName() -> String
//}
//
//extension NibInstantiatable {
//    static func nibName() -> String {
//        return String(describing: self)
//    }
//
//}
//
//extension NibInstantiatable where Self: UIView {
//    static func fromNib() -> Self {
//        let bundle = Bundle(for: self)
//        let nib = bundle.loadNibNamed(nibName(), owner: self, options: nil)
//        return nib!.first as! Self
//
//    }
//
//}
extension UIView {

    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        
        self.layer.add(animation, forKey: nil)
    }
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1

        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }

    // OUTPUT 2
    func dropShadow(color: UIColor = .black, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius

        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    var screenshot: UIImage? {
        
        var size = CGSize.zero
        if let scrollView = self as? UIScrollView {
            size = CGSize(width: scrollView.contentSize.width, height: scrollView.contentSize.height)
        } else {
            size = CGSize(width: self.bounds.width, height: self.bounds.height)
        }
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        let context = UIGraphicsGetCurrentContext()
        
        let previousFrame = self.frame
        
        self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: size.width, height: size.height)
        
        self.layer.render(in: context!)
        
        self.frame = previousFrame
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
