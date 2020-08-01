//
//  LeftMenuVC.swift
//  MobifinX1_Swift
//
//  Created by ravi's imac on 6/19/17.
//  Copyright © 2017 ravi's imac. All rights reserved.
//

import UIKit
struct LeftMenuModel {
    var id: LeftMenuEnum = .none
    var name: String = ""
    var image: String = ""
    var isArrow: Bool = false
    var isSwitch: Bool = false
    init(id: LeftMenuEnum, name: String,image: String, isArrow:Bool = false, isSwitch:Bool = false) {
        self.id = id
        self.name = name
        self.image = image
        self.isArrow = isArrow
        self.isSwitch = isSwitch
    }
}

enum LeftMenuEnum: Int {
    case none = 0
    case home
    case search
    case saveStories
    case notificationSetting
    case breakingNewsHub
    case notificationHub
    case lightMode
    case aboutNewsFirst
    case callNewsFirst
    case advertiseOnNewsFirst
    case clearAppCache
    case shareThisApp
    case rateThisApp
    case leglePage

}

class LeftMenuVC: UIViewController {

    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var lblVerison: UILabel!
    @IBOutlet weak var viewVersion: UIView!
    var tableData = [LeftMenuModel]()


    class func getInstance()-> LeftMenuVC {
       return LeftMenuVC.viewController(storyboard: Constants.Storyboard.SideMenu)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let jeremyGif = UIImage.gifImageWithName("splashgif")
//        topImageView.image = jeremyGif
        self.view.backgroundColor = appTheamColor.white
        viewVersion.backgroundColor = appTheamColor.greyLight
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        fillData()
    }
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
    override var prefersStatusBarHidden: Bool {
          return false
    }
    func fillData() {
        tableData.removeAll()
        
        tableData.append(LeftMenuModel(id: .home, name: "Home", image: "home"))
        tableData.append(LeftMenuModel(id: .search, name: "Search", image: "search"))
        tableData.append(LeftMenuModel(id: .saveStories, name: "Save Stories", image: "savedStories"))
        tableData.append(LeftMenuModel(id: .notificationSetting, name: "Notification Setting", image: "notificationSetting",isArrow:true))
        tableData.append(LeftMenuModel(id: .breakingNewsHub, name: "Breaking News Hub", image: "breakingNewsHub",isArrow:true))
        tableData.append(LeftMenuModel(id: .notificationHub, name: "Notification Hub", image: "notificationHub",isArrow:true))
//        if AppUserDefaults.isDarkMode == true {
        tableData.append(LeftMenuModel(id: .lightMode, name: "Night Mode", image: "nightMode", isArrow: false, isSwitch: true))

//        }else{
//            tableData.append(LeftMenuModel(id: .lightMode, name: "Light Mode", image: "nightMode"))
//        }
        tableData.append(LeftMenuModel(id: .aboutNewsFirst, name: "About NewsFirst", image: "aboutNewsfirst",isArrow:true))
        tableData.append(LeftMenuModel(id: .callNewsFirst, name: "Call NewsFirst", image: "callNewsFirst"))
        tableData.append(LeftMenuModel(id: .advertiseOnNewsFirst, name: "Advertise On NewsFirst", image: "advertiseOnNewsfirst",isArrow:true))
        tableData.append(LeftMenuModel(id: .clearAppCache, name: "Clear App Cache", image: "clearAppCache"))
        tableData.append(LeftMenuModel(id: .shareThisApp, name: "Share This App", image: "shareThisApp"))
        tableData.append(LeftMenuModel(id: .rateThisApp, name: "Rate This App", image: "rateThisApp"))
        tableData.append(LeftMenuModel(id: .leglePage, name: "Legle Page", image: "legalPages",isArrow:true))

        myTableView.reloadData()
        myTableView.tableFooterView = UIView(frame: .zero)

    }
    func changeViewController(_ menu: LeftMenuModel) {
        if menu.id == LeftMenuEnum.home {
            let controller = HomeVC.getInstance()
            self.navigationController?.pushViewController(controller, animated: true)
        }

//        if menu.id == LeftMenuEnum.notificationSetting {
//            let controller = NotificationSettingVC.getInstance()
//            self.navigationController?.pushViewController(controller, animated: true)
//        }
//        else if menu.id == LeftMenuEnum.saveStories {
//            let controller = SaveStoryVC.getInstance()
//            self.navigationController?.pushViewController(controller, animated: true)
//        }else if menu.id == LeftMenuEnum.lightMode{
//            if AppUserDefaults.isDarkMode == true {
//                isDark = false
//            }else{
//                isDark = true
//            }
//            AppDelegate.shared.setInitialViewController()
//        }

    }
}


extension LeftMenuVC: UITableViewDataSource, UITableViewDelegate {

    // MARK:- UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "LeftMenuCell", for: indexPath) as? LeftMenuCell {
            cell.selectionStyle = .gray
            cell.backgroundColor = UIColor.clear
            cell.imgIcon.image = UIImage(named:tableData[indexPath.row].image )
            cell.lblName.text = tableData[indexPath.row].name
            if tableData[indexPath.row].isArrow {
                cell.imgArrowIcon.isHidden = false
            }else {
                cell.imgArrowIcon.isHidden = true
            }
            if tableData[indexPath.row].isSwitch {
                cell.switchControler.isHidden = false
            }else {
                cell.switchControler.isHidden = true
            }
            cell.switchControler.tintColor = .red
            cell.tintColor = appTheamColor.black

            return cell
        }
        return UITableViewCell()
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.changeViewController(tableData[indexPath.row])
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


