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
    init(id: LeftMenuEnum, name: String) {
        self.id = id
        self.name = name
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

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fillData()
    }
    
    func fillData() {
        tableData.removeAll()
        
        tableData.append(LeftMenuModel(id: .home, name: "Home"))
        tableData.append(LeftMenuModel(id: .search, name: "Search"))

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
            cell.lblName.text = tableData[indexPath.row].name
            
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


