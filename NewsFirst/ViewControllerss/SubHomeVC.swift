//
//  SubHomeVC.swift
//  NewsFirst
//
//  Created by Ankit Sojitra on 31/07/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//
import UIKit

class SubHomeVC: BaseViewController {
    
    class func getInstance()-> SubHomeVC {
        SubHomeVC.viewController(storyboard: Constants.Storyboard.Dashboard)
    }
    
    var lastPoint : CGPoint = CGPoint.zero
    var pinViewFram : CGRect = CGRect.zero
    
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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
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
        tblList.tableHeaderView?.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        v.translatesAutoresizingMaskIntoConstraints = false
        geaderView.addConstraint(NSLayoutConstraint(item: v, attribute: .top, relatedBy: .equal, toItem: geaderView, attribute: .top, multiplier: 1, constant: 0))
        geaderView.addConstraint(NSLayoutConstraint(item: v, attribute: .leading, relatedBy: .equal, toItem: geaderView, attribute: .leading, multiplier: 1, constant: 0))
        geaderView.addConstraint(NSLayoutConstraint(item: v, attribute: .trailing, relatedBy: .equal, toItem: geaderView, attribute: .trailing, multiplier: 1, constant: 0))
        v.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        geaderView.clipsToBounds = true
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
            return 3
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        else {
            return 40
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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
        
        
//        print("Index Of cell id :\(indexPath.row) and Cell Type is \(news._type)")
//        // print(news.type)
//        if news._type == NewsType.List.rawValue {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeImageWithTextCell") as? HomeImageWithTextCell
//            cell?.objNews = news
//            return cell ?? UITableViewCell()
//        }
//        else if news._type == NewsType.Photos.rawValue {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "HomePhotoCell") as? HomePhotoCell
//            cell?.tblReference = tblList
//            cell?._type = .Photos
//            cell?.objNews = news
//            return cell ?? UITableViewCell()
//        }
//        else if news._type == NewsType.Title.rawValue {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTitleCell") as? HomeTitleCell
//            cell?.objNews = news
//            return cell ?? UITableViewCell()
//        }
//        else if news._type == NewsType.Videos.rawValue {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "HomePhotoCell") as? HomePhotoCell
//            cell?._type = .Video
//            cell?.tblReference = tblList
//            cell?.objNews = news
//            return cell ?? UITableViewCell()
//        }
        return UITableViewCell()
        //
        //        //
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "HomePhotoCell") as? HomePhotoCell
        //        cell?.tblReference = tblList
        //        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Cell : \(indexPath.row)")
        tblList.beginUpdates()
        
         
      //  heightConstraint.constant = 0
        UIView.animate(withDuration: 0.3) {
           self.tblList.tableHeaderView = self.geaderView
            self.geaderView.frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50)
        }
        tblList.endUpdates()
        
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

