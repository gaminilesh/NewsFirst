//
//  AppDelegateUIExtended.swift
//  MobifinX1_Swift
//
//  Created by ravi's imac on 5/29/17.
//  Copyright © 2017 ravi's imac. All rights reserved.
//


import UIKit
import MessageUI

class BaseViewController:UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = appTheamColor.black
    }
    struct NavigationStyles {
        private var _barTintColor: UIColor = appTheamColor.AppNavigation
        var barTintColor: UIColor {
            get { return _barTintColor }
            set { _barTintColor = newValue }
        }
        
        private var _tintColor: UIColor = appTheamColor.white
        var tintColor: UIColor {
            get { return _tintColor }
            set { _tintColor = newValue }
        }

        //Title
        private var _titleColor: UIColor = appTheamColor.black
        var titleColor: UIColor {
            get { return _titleColor }
            set { _titleColor = newValue }
        }
        private var _titleFont: UIFont = AppFont.Body
        var titleFont: UIFont {
            get { return _titleFont }
            set { _titleFont = newValue }
        }
        
    }
    struct RightBarButtonStyles {
        //Left Button
        //Title
        private var _image: UIImage = #imageLiteral(resourceName: "menu")
        var image: UIImage {
            get { return _image }
            set { _image = newValue }
        }
    }
    struct LeftBarButtonStyles {
        //Right Button
        //Title
        private var _image: UIImage = #imageLiteral(resourceName: "menu")
        var image: UIImage {
            get { return _image }
            set { _image = newValue }
        }

    }

    var navigationStyles = NavigationStyles()
    var leftBarButtonStyles = LeftBarButtonStyles()
    var rightBarButtonStyles = RightBarButtonStyles()
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

    func setNavigationBarSetup(isNavigationBarHiddne : Bool = false) {
        self.navigationController?.navigationBar.isHidden = isNavigationBarHiddne
        navigationController?.navigationBar.isTranslucent = false // If use true then show tranfer color from statusbar and navigationbar
        //Remove Botton Show
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

        navigationController?.navigationBar.barTintColor = navigationStyles.barTintColor // BG Colour
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: navigationStyles.titleColor, NSAttributedString.Key.font:navigationStyles.titleFont]  // Text Colour
        navigationController?.navigationBar.tintColor = navigationStyles.tintColor
        centeredNavBarImage()

    }
   
    func navigationLeftButtonSetup(action: Selector? = #selector(goLeftNavigationAction(sender:))) {

        let image : UIImage = leftBarButtonStyles.image.withRenderingMode(.alwaysOriginal)
        let leftButton = UIBarButtonItem(image: image, landscapeImagePhone: .checkmark, style: .done, target: self, action: action)
        navigationItem.leftBarButtonItem = leftButton

    }
    func centeredNavBarImage (){
        let view = NavigationTitleView()
        navigationItem.titleView = view
        
    }

    @objc func goLeftNavigationAction(sender: Any) {

        var isModal: Bool {
            return self.presentingViewController?.presentedViewController == self
                || (self.navigationController != nil && self.navigationController?.presentingViewController?.presentedViewController == self.navigationController)
                || self.tabBarController?.presentingViewController is UITabBarController
        }

        if isModal == true {
            self.dismiss(animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    func navigationRightButtonSetup(action: Selector? = #selector(goRightNavigationAction(sender:))) {
        let image : UIImage = rightBarButtonStyles.image.withRenderingMode(.alwaysOriginal)
        let rightButton = UIBarButtonItem(image: image, landscapeImagePhone: .checkmark, style: .done, target: self, action: action)
        navigationItem.rightBarButtonItem = rightButton
    }

    @objc func goRightNavigationAction(sender: Any) {

        var isModal: Bool {
            return self.presentingViewController?.presentedViewController == self
                || (self.navigationController != nil && self.navigationController?.presentingViewController?.presentedViewController == self.navigationController)
                || self.tabBarController?.presentingViewController is UITabBarController
        }

        if isModal == true {
            self.dismiss(animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
