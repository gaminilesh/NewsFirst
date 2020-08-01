//
//  UIViewControllerExtented.swift
//  MobifinX1_Swift
//
//  Created by ravi's imac on 5/18/17.
//  Copyright © 2017 ravi's imac. All rights reserved.
//

import Foundation
import UIKit

//class PNMXUIExtened {
//    
////https://stackoverflow.com/questions/57943692/swift-change-status-bar-color-for-ios-13
//    class func setStatusBarBackgroundColor(color: UIColor?,isAlpha:Bool = false) {
//        //UIApplication.statusBarBackgroundColor = color
//
//        //        setStatusBarBackgroundColor(color: color)
//        if #available(iOS 13.0, *) {
//                let statusBar = UIView(frame: UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
//                statusBar.backgroundColor = color
//                statusBar.tag = 123456789
//                if isAlpha == true{
//                    statusBar.removeFromSuperview()
//                    if let statusBarFrame = UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame {
//                        let statusBar = UIView(frame: statusBarFrame)
//                        statusBar.backgroundColor = UIColor.white
//                        UIApplication.shared.keyWindow?.addSubview(statusBar)
//                    }
//                }else{
//                    UIApplication.shared.keyWindow?.addSubview(statusBar)
//                }
//        }else{
//            guard let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else { return }
//            statusBar.backgroundColor = color
//        }
//    }
//}

protocol InstantiableFromStoryboard {}

extension InstantiableFromStoryboard {

    static func viewController(storyboard: String = Constants.Storyboard.Main, bundle: Bundle? = nil, identifier: String? = nil) -> Self {
        var strClass = ""
        if let identifier = identifier {
            strClass = identifier
        } else {
            strClass = String(describing: self)
        }
        guard let viewController = UIStoryboard(name: storyboard, bundle: bundle).instantiateViewController(withIdentifier: strClass) as? Self else {
            fatalError("Cannot instantiate view controller of type " + (identifier ?? ""))
        }
        return viewController
    }
}
extension UIViewController: InstantiableFromStoryboard {}

extension UIViewController {

    class func viewControllerMainStoryboard() -> UIViewController {
        return UIViewController.viewController(storyboard: Constants.Storyboard.Main)
    }

    var isModal: Bool {
        if presentingViewController != nil {
            return true
        }
        if navigationController?.presentingViewController?.presentedViewController == navigationController {
            return true
        }
        if tabBarController?.presentingViewController is UITabBarController {
            return true
        }
        return false
    }
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }

}
