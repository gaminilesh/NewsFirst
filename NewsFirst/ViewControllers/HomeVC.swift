//
//  ViewController.swift
//  NewsFirst
//
//  Created by  Mac on 7/26/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//

import UIKit
import SideMenu

class HomeVC: UIViewController {

    class func getInstance()-> HomeVC {
        return HomeVC.viewController(storyboard: Constants.Storyboard.Dashboard)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func leftMenuAction(_ sender: Any) {
        let sideMenu = LeftMenuVC.getInstance()
        let menu = SideMenuNavigationController(rootViewController: sideMenu)
        menu.navigationBar.isHidden = true
        menu.leftSide = LLanguage.isRTL == true ? false : true
        menu.menuWidth = UIScreen.main.bounds.width * 0.85
        menu.statusBarEndAlpha = 0
        menu.presentationStyle = .menuSlideIn
        menu.presentationStyle.presentingEndAlpha = CGFloat(0.6)
        present(menu, animated: true, completion: nil)
    }
    
}

