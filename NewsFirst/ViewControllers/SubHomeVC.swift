//
//  SubHomeVC.swift
//  NewsFirst
//
//  Created by Ankit Sojitra on 31/07/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//
import UIKit
protocol MyDataSendingDelegateProtocol {
    func selectedBottomMenu(contentModel: BottomTabMenuModel)
}

class SubHomeVC: BaseViewController {
    
    class func getInstance()-> SubHomeVC {
        SubHomeVC.viewController(storyboard: Constants.Storyboard.Dashboard)
    }
    var delegate: MyDataSendingDelegateProtocol? = nil

    var lastPoint : CGPoint = CGPoint.zero
    var pinViewFram : CGRect = CGRect.zero
    var selectedId = 0
    var name : String! = ""
    @IBOutlet weak var tblList: UITableView!
    @IBOutlet weak var bottomView: UIView!
    var reppleView = RippleView.instanceFromNib()
    let bottomTabView = BottomCustomTab.instanceFromNib()
    
    @IBOutlet weak var viewBrekingNews: BreakingNewsView!
    @IBOutlet weak var viewBrekingNewsHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewLiveNewsPopup: LiveNewsPopUpView!
    @IBOutlet weak var viewLiveNewsPopupHeightConstraint: NSLayoutConstraint!
    var heightConstraint : NSLayoutConstraint!
    let geaderView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 80))
    var newsList = [News]()
    
    var newsDetail: NewsDetail?
    var jsonFileName: String = "0"
    
        var urlList = ["https://testingbeta.in/assets/images/6.jpeg", "https://testingbeta.in/assets/images/4.jpeg", "https://testingbeta.in/assets/images/3.jpeg", "https://testingbeta.in/assets/images/2.jpeg"]

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bottomTabView.selectIndex = selectedId

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tblList.tableFooterView = UIView()
        var v = SubHomeHeaderView.instanceFromNib()
        geaderView.addSubview(v)
        
        registeNib()
        
        if let path = Bundle.main.path(forResource: jsonFileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let person = jsonResult["Detail"] as? [Any] {
                    
                    if let df = person.first as? [String:Any] {
                        self.newsDetail = NewsDetail(dict: df)
                        if let list = self.newsDetail?.newsList {
                            self.newsList = list
                        }
                    }
                    self.tblList.reloadData()
                    print(person)
                }
            } catch {
            }
        }
        
        geaderView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        geaderView.backgroundColor = .yellow
        tblList.tableHeaderView = geaderView
        // tblList.tableHeaderView?.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        v.translatesAutoresizingMaskIntoConstraints = false
        geaderView.addConstraint(NSLayoutConstraint(item: v, attribute: .top, relatedBy: .equal, toItem: geaderView, attribute: .top, multiplier: 1, constant: 0))
        geaderView.addConstraint(NSLayoutConstraint(item: v, attribute: .leading, relatedBy: .equal, toItem: geaderView, attribute: .leading, multiplier: 1, constant: 0))
        geaderView.addConstraint(NSLayoutConstraint(item: v, attribute: .trailing, relatedBy: .equal, toItem: geaderView, attribute: .trailing, multiplier: 1, constant: 0))
        v.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        geaderView.clipsToBounds = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.hideWithAnimation(hidden: true)
        }
        
        
        bottomView.addSubview(bottomTabView)
        bottomTabView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomView.addConstraint(NSLayoutConstraint(item: bottomTabView, attribute: .top, relatedBy: .equal, toItem: bottomView, attribute: .top, multiplier: 1, constant: 0))
        bottomView.addConstraint(NSLayoutConstraint(item: bottomTabView, attribute: .bottom, relatedBy: .equal, toItem: bottomView, attribute: .bottom, multiplier: 1, constant: 0))
        bottomView.addConstraint(NSLayoutConstraint(item: bottomTabView, attribute: .leading, relatedBy: .equal, toItem: bottomView, attribute: .leading, multiplier: 1, constant: 0))
        bottomView.addConstraint(NSLayoutConstraint(item: bottomTabView, attribute: .trailing, relatedBy: .equal, toItem: bottomView, attribute: .trailing, multiplier: 1, constant: 0))
        
        bottomTabView.selectedActionListener = {[weak self] (content) in
            DispatchQueue.main.async() {
                if let weakSelf = self {
                    if weakSelf.bottomTabView.selectIndex != content.id{
                        weakSelf.delegate?.selectedBottomMenu(contentModel: content)
                        weakSelf.navigationController?.popViewController(animated: true)
                    }
                }
            }
        }

        v.lblTitle.text = name
        v.handleBackButton = { [weak self] (sender) in
            if let weakSelf = self {
                weakSelf.navigationController?.popViewController(animated: true)
            }
            
        }
        
    }
    
    func hideWithAnimation(hidden: Bool) {
        tblList.beginUpdates()
        //  heightConstraint.constant = 0
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.tblList.tableHeaderView = self?.geaderView
            self?.geaderView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 50)
        }
        tblList.endUpdates()
    }
    
    //TODO:- Custome Navigation Render.
    func setupNavigation()  {
    }
    
    @objc override func goLeftNavigationAction(sender: Any) {
    }
    func registeNib() {
        tblList.register(UINib(nibName: "HomeImageWithTextCell", bundle: nil), forCellReuseIdentifier: "HomeImageWithTextCell")
        tblList.register(UINib(nibName: "HomePhotoCell", bundle: nil), forCellReuseIdentifier: "HomePhotoCell")
        tblList.register(UINib(nibName: "HomeTitleCell", bundle: nil), forCellReuseIdentifier: "HomeTitleCell")
        tblList.register(UINib(nibName: "SubHomeBulletCell", bundle: nil), forCellReuseIdentifier: "SubHomeBulletCell")
        tblList.register(UINib(nibName: "SubHomeTextCell", bundle: nil), forCellReuseIdentifier: "SubHomeTextCell")
        tblList.register(UINib(nibName: "SubHomeDetailCell", bundle: nil), forCellReuseIdentifier: "SubHomeDetailCell")
        tblList.register(UINib(nibName: "SubHomeAdvertiseCell", bundle: nil), forCellReuseIdentifier: "SubHomeAdvertiseCell")
        tblList.register(UINib(nibName: "SectionHeader", bundle: nil), forCellReuseIdentifier: "SectionHeader")
        tblList.register(UINib(nibName: "BlankCell", bundle: nil), forCellReuseIdentifier: "BlankCell")

    }
}
extension SubHomeVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return newsList.count
        }
        else {
            return urlList.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        else {
            return 55
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionHeader") as? SectionHeader
        return cell?.contentView ?? nil
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let news = newsList[indexPath.row]
            if news._type == NewsType.Details.rawValue {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SubHomeDetailCell") as? SubHomeDetailCell
                cell?.objNews = newsDetail
                return cell ?? UITableViewCell()
            }
            else if news._type == NewsType.BulletArrow.rawValue {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SubHomeBulletCell") as? SubHomeBulletCell
                cell?.objNews = news
                return cell ?? UITableViewCell()
            }
            else if news._type == NewsType.BulletNumber.rawValue {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SubHomeBulletCell") as? SubHomeBulletCell
                cell?.objNews = news
                return cell ?? UITableViewCell()
            }
            else if news._type == NewsType.Text.rawValue {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SubHomeTextCell") as? SubHomeTextCell
                cell?.objNews = news
                return cell ?? UITableViewCell()
            }
            else if news._type == NewsType.Advertise.rawValue {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SubHomeAdvertiseCell") as? SubHomeAdvertiseCell
                cell?.objNews = news
                return cell ?? UITableViewCell()
            }
        }
        else {
            //if news._type == NewsType.List.rawValue {
                let cell = tableView.dequeueReusableCell(withIdentifier: "HomeImageWithTextCell") as? HomeImageWithTextCell
               // cell?.objNews = news
            if urlList[indexPath.row] != "" {
                cell?.imgvPhoto.kf.setImage(with: URL(string: urlList[indexPath.row])!)
            }
            cell?.lblTime.text = ""
            cell?.lblDescription.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has"
                return cell ?? UITableViewCell()
           // }
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "BlankCell") as? BlankCell
        cell?.separatorInset = UIEdgeInsets(top: 0, left: UIScreen.main.bounds.size.width, bottom: 0, right: 0)

        return cell ?? UITableViewCell()

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Cell : \(indexPath.row)")
    }
    
}



//    import Foundation
//    import SwiftyJSON
//
//    class JSONReaderManager
//    {
//        static let sharedInstance = JSONReaderManager()
//        func ReadJSON(_insideNodeValue:String!) -> NSArray
//        {
//               if let path = Bundle.main.path(forResource: "newsfirst-Backupexport", ofType: "json") {
//                   do {
//                       let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
//                    do {
//                        let v = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
//                        print("=================")
//                        print(v)
//                        print("=================")
//                                  } catch {
//                                      print(error.localizedDescription)
//                                  }
//                       let jsonObj = try JSON(data: data)
//                       let TabValues = jsonObj["Data1"]["Dashboard"][_insideNodeValue] // print(jsonObj["Data1"]["Dashboard"].dictionary?.keys)
//                       let allvalues = convertToDictionary(text: TabValues.stringValue)!
//                       let requestDataDict:NSDictionary = allvalues as NSDictionary
//                       let newDict =  ((requestDataDict.value(forKey: "Dashboard") as! NSArray)[0] as! NSDictionary).value(forKey: "Data") as! NSArray
//                       print(newDict)
//                       return newDict
//
//                   } catch let error {
//                        print("parse error: \(error.localizedDescription)")
//                        return []
//                   }
//               } else {
//                   print("Invalid filename/path.")
//                    return []
//               }
//           }
//         func convertToDictionary(text: String) -> [String: Any]? {
//               if let data = text.data(using: .utf8) {
//                   do {
//                       return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
//                   } catch {
//                       print(error.localizedDescription)
//                   }
//               }
//               return nil
//           }
//    }

