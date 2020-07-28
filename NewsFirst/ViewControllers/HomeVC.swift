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
    
    @IBOutlet weak var tblList: UITableView!

    var newsList = [News]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tblList.tableFooterView = UIView()
        
        registeNib()
        let list = JSONReaderManager.sharedInstance.ReadJSON(_insideNodeValue: "Business")
        if list.count > 0 {
            for obj in list {
                print(obj)
                if let json = obj as? [String:Any] {
                    newsList.append(News(dict: json))
                }
            }
            tblList.reloadData()
        }
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
    func registeNib() {
        tblList.register(UINib(nibName: "HomeImageWithTextCell", bundle: nil), forCellReuseIdentifier: "HomeImageWithTextCell")
        tblList.register(UINib(nibName: "HomePhotoCell", bundle: nil), forCellReuseIdentifier: "HomePhotoCell")
        tblList.register(UINib(nibName: "HomeTitleCell", bundle: nil), forCellReuseIdentifier: "HomeTitleCell")
        
    }
    
}
extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let news = newsList[indexPath.row]
        print("Index Of cell id :\(indexPath.row) and Cell Type is \(news._type)")
       // print(news.type)
        if news._type == NewsType.List.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeImageWithTextCell") as? HomeImageWithTextCell
            cell?.objNews = news
            return cell ?? UITableViewCell()
        }
        else if news._type == NewsType.Photos.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomePhotoCell") as? HomePhotoCell
            cell?.tblReference = tblList
            cell?.objNews = news
            return cell ?? UITableViewCell()
        }
        else if news._type == NewsType.Title.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTitleCell") as? HomeTitleCell
           
            cell?.objNews = news
            return cell ?? UITableViewCell()
        }
        return UITableViewCell()
//
//        //
//        let cell = tableView.dequeueReusableCell(withIdentifier: "HomePhotoCell") as? HomePhotoCell
//        cell?.tblReference = tblList
//        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Cell : \(indexPath.row)")
    }
    
}



import Foundation
import SwiftyJSON

class JSONReaderManager
{
    static let sharedInstance = JSONReaderManager()
    func ReadJSON(_insideNodeValue:String!) -> NSArray
    {
           if let path = Bundle.main.path(forResource: "newsfirst-Backupexport", ofType: "json") {
               do {
                   let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                do {
                    let v = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    print("=================")
                    print(v)
                    print("=================")
                              } catch {
                                  print(error.localizedDescription)
                              }
                   let jsonObj = try JSON(data: data)
                   let TabValues = jsonObj["Data1"]["Dashboard"][_insideNodeValue]
                   let allvalues = convertToDictionary(text: TabValues.stringValue)!
                   let requestDataDict:NSDictionary = allvalues as NSDictionary
                   let newDict =  ((requestDataDict.value(forKey: "Dashboard") as! NSArray)[0] as! NSDictionary).value(forKey: "Data") as! NSArray
                   print(newDict)
                   return newDict
                   
               } catch let error {
                    print("parse error: \(error.localizedDescription)")
                    return []
               }
           } else {
               print("Invalid filename/path.")
                return []
           }
       }
     func convertToDictionary(text: String) -> [String: Any]? {
           if let data = text.data(using: .utf8) {
               do {
                   return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
               } catch {
                   print(error.localizedDescription)
               }
           }
           return nil
       }
}
