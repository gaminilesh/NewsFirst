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
    init(id: LeftMenuEnum, name: String,image: String, isArrow:Bool = false) {
        self.id = id
        self.name = name
        self.image = image
        self.isArrow = isArrow
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
        let jeremyGif = UIImage.gifImageWithName("splashgif")
        topImageView.image = jeremyGif

        viewVersion.backgroundColor = appTheamColor.greyLight
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fillData()
    }
    
    func fillData() {
        tableData.removeAll()
        
        tableData.append(LeftMenuModel(id: .home, name: "Home", image: "home"))
        tableData.append(LeftMenuModel(id: .search, name: "Search", image: "search"))
        tableData.append(LeftMenuModel(id: .saveStories, name: "Save Stories", image: "savedStories"))
        tableData.append(LeftMenuModel(id: .notificationSetting, name: "Notification Setting", image: "notificationSetting",isArrow:true))
        tableData.append(LeftMenuModel(id: .breakingNewsHub, name: "Breaking News Hub", image: "breakingNewsHub",isArrow:true))
        tableData.append(LeftMenuModel(id: .notificationHub, name: "Notification Hub", image: "notificationHub",isArrow:true))
        tableData.append(LeftMenuModel(id: .shareThisApp, name: "Share This App", image: "shareThisApp"))
        tableData.append(LeftMenuModel(id: .rateThisApp, name: "Rate This App", image: "rateThisApp"))
        tableData.append(LeftMenuModel(id: .leglePage, name: "Legle Page", image: "legalPages",isArrow:true))

        myTableView.reloadData()
        myTableView.tableFooterView = UIView(frame: .zero)

    }
    func changeViewController(_ menu: LeftMenuModel) {
        
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
                cell.accessoryType = .disclosureIndicator;
            }else {
                cell.accessoryType = .none;
            }

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


