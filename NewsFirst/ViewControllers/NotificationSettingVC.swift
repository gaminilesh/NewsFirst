//
//  ViewController.swift
//  NewsFirst
//
//  Created by  Mac on 7/26/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//

import UIKit
import SideMenu
class NotificationSettingModel {
    var id: Int = 0
    var chaildArray: [Any] = []
    init(id: Int, chaildArray: [Any]) {
        self.id = id
        self.chaildArray = chaildArray
    }
}
class FirstSectionNotificationSettingModel {
    var title: String = ""
    var switch_: Bool = false
    init(title: String, switch_:Bool = false) {
        self.title = title
        self.switch_ = switch_
    }
}
class SecondSectionNotificationSettingModel {
    var title: String = ""
    var checkBoxOnOff: Bool = false
    init(title: String, checkBoxOnOff:Bool = false) {
        self.title = title
        self.checkBoxOnOff = checkBoxOnOff
    }
}
class ThirdSectionNotificationSettingModel {
    var title: String = ""
    var subTitle: String = ""
    var switch_: Bool = false
    init(title: String,subTitle: String, switch_:Bool = false) {
        self.subTitle = subTitle
        self.title = title
        self.switch_ = switch_
    }
}

class NotificationSettingVC: UIViewController {
    var mainNotificationList:[NotificationSettingModel] = []

    @IBOutlet weak var tableview: UITableView!
    class func getInstance()-> NotificationSettingVC {
        return NotificationSettingVC.viewController(storyboard: Constants.Storyboard.SideMenu)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        renderTableData()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    func renderTableData()  {
        var firstSectionNotificationSettingModel:[FirstSectionNotificationSettingModel] = []
        firstSectionNotificationSettingModel.append(FirstSectionNotificationSettingModel(title: "Notifications"))

        var secondSectionNotificationSettingModel:[SecondSectionNotificationSettingModel] = []
        secondSectionNotificationSettingModel.append(SecondSectionNotificationSettingModel(title: "Breaking News"))
        secondSectionNotificationSettingModel.append(SecondSectionNotificationSettingModel(title: "Top News"))
        secondSectionNotificationSettingModel.append(SecondSectionNotificationSettingModel(title: "Politics"))
        secondSectionNotificationSettingModel.append(SecondSectionNotificationSettingModel(title: "Sports"))
        secondSectionNotificationSettingModel.append(SecondSectionNotificationSettingModel(title: "Business"))
        secondSectionNotificationSettingModel.append(SecondSectionNotificationSettingModel(title: "Prime"))
        secondSectionNotificationSettingModel.append(SecondSectionNotificationSettingModel(title: "Promotions"))

    
        var thirdSectionNotificationSettingModel:[ThirdSectionNotificationSettingModel] = []
        thirdSectionNotificationSettingModel.append(ThirdSectionNotificationSettingModel(title: "Notification at night", subTitle: "(11:00PM to 6:00AM)"))
        thirdSectionNotificationSettingModel.append(ThirdSectionNotificationSettingModel(title: "Sound / Vibration", subTitle: "Click here to managenotification sound/vibration"))
        thirdSectionNotificationSettingModel.append(ThirdSectionNotificationSettingModel(title: "Refresh App in background", subTitle: "Auto-refresh news after 20 mins."))

        mainNotificationList.append(NotificationSettingModel(id: 0, chaildArray: firstSectionNotificationSettingModel))
        mainNotificationList.append(NotificationSettingModel(id: 1, chaildArray: secondSectionNotificationSettingModel))
        mainNotificationList.append(NotificationSettingModel(id: 2, chaildArray: thirdSectionNotificationSettingModel))
        
        tableview.contentInset = UIEdgeInsets(top: -1, left: 0, bottom: 0, right: 0)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.reloadData()
    }
    
}
extension NotificationSettingVC: UITableViewDataSource, UITableViewDelegate {
    // MARK:- UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return mainNotificationList.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainNotificationList[section].chaildArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FNotificationSettingCell", for: indexPath) as? FNotificationSettingCell,
            let model = mainNotificationList[indexPath.section].chaildArray[indexPath.row] as? FirstSectionNotificationSettingModel {
            cell.selectionStyle = .none
            cell.lblTittle.text = model.title
            cell.switchOnOff.setOn(model.switch_, animated: true)
            cell.switchOnOffActionListener = {(isSelected:Bool) in
                model.switch_ = isSelected
            }

            return cell
        }
        else if let cell = tableView.dequeueReusableCell(withIdentifier: "SNotificationSettingCell", for: indexPath) as? SNotificationSettingCell,
            let model = mainNotificationList[indexPath.section].chaildArray[indexPath.row] as? SecondSectionNotificationSettingModel {
            cell.selectionStyle = .none
            cell.lblTittle.text = model.title
//            cell.btnOnOffActionListener = {[weak self] (isSelected:Bool) in
//                model.checkBoxOnOff = isSelected
////                DispatchQueue.main.async() {
////                    if let weakSelf = self {
////                    }
////                }
//            }
            cell.btnOnOffActionListener = {(isSelected:Bool) in
                model.checkBoxOnOff = isSelected
            }
            return cell
        }
        else if let cell = tableView.dequeueReusableCell(withIdentifier: "TNotificationSettingCell", for: indexPath) as? TNotificationSettingCell,
            let model = mainNotificationList[indexPath.section].chaildArray[indexPath.row] as? ThirdSectionNotificationSettingModel {
            cell.selectionStyle = .none
//            let paragraphStyle = NSMutableParagraphStyle()
//            paragraphStyle.lineSpacing = 2
            let mutableTitle = "\(model.title)".mutableAttributedString(font: AppFont.Callout, textColor: appTheamColor.black)
            mutableTitle.append("\n\(model.subTitle)".mutableAttributedString(font: AppFont.Footnote, textColor: appTheamColor.grey))
            cell.lblTittle.attributedText = mutableTitle
            cell.switchOnOff.setOn(model.switch_, animated: true)
            cell.switchOnOffActionListener = {(isSelected:Bool) in
                model.switch_ = isSelected
            }
            return cell
        }
        return UITableViewCell()
        
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
         if let cell = tableView.dequeueReusableCell(withIdentifier: "HNotificationSettingCell") as? HNotificationSettingCell {
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 1.0 : 32
    }



}

