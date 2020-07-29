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
    
    var lastPoint : CGPoint = CGPoint.zero
     var pinViewFram : CGRect = CGRect.zero
    
    @IBOutlet weak var tblList: UITableView!
    var reppleView = RippleView.instanceFromNib()
    
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
        
        
        reppleView.frame = CGRect(x: (UIScreen.main.bounds.size.width - 90), y: (UIScreen.main.bounds.size.height - 110), width: 50, height: 50)
        
        self.view.addSubview(reppleView)
        
        reppleView.showRippleEffecr = true
         
        let img = UIImageView()
        img.tag = 120
        pinViewFram = CGRect(x: 100, y: 400, width: 100, height: 100)
        img.frame = pinViewFram
        img.backgroundColor = .red
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.draggedView(_:)))
        img.isUserInteractionEnabled = true
        img.addGestureRecognizer(panGesture)
        
        self.view.addSubview(img)
        
        
        let v = BottomCustomTab.instanceFromNib()
        v.frame = CGRect(x: 0, y: 200, width: UIScreen.main.bounds.size.width, height: 40)
        self.view.addSubview(v)
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
    
    
        @objc func draggedView(_ sender:UIPanGestureRecognizer) {
    
            switch sender.state {
                case .began:
                    var center = sender.view?.frame.origin
                    let translation = sender.translation(in: sender.view)
                    center = CGPoint(x: center!.x + translation.x, y: center!.y + translation.y)
                    lastPoint = translation
                    break;
                case .changed:
                    if let _ = sender.view as? UIImageView {
                        //SA
                        let translation = sender.translation(in: sender.view)
                        let diffX = lastPoint.x - translation.x
                        let diffY = lastPoint.y - translation.y
    
    
                        lastPoint = translation
    
                        pinViewFram.origin.x = pinViewFram.origin.x - diffX
                        pinViewFram.origin.y = pinViewFram.origin.y - diffY
    
                        sender.view?.frame = pinViewFram
                    }
                    break;
                case .ended:
                    if let viewDrag = sender.view as? UIImageView {
                        print(viewDrag.frame.origin.x)
                        let xPos = (viewDrag.frame.origin.x + viewDrag.frame.width)
                        let yPos = (viewDrag.frame.origin.y + viewDrag.frame.height)
    
                        UIView.animate(withDuration: 0.3) {
                            viewDrag.transform = CGAffineTransform.identity
                        }
    
                        if xPos >= UIScreen.main.bounds.width {
                            UIView.animate(withDuration: 0.3) {
                                viewDrag.frame.origin.x = (UIScreen.main.bounds.width - viewDrag.frame.width - 10.0)
                                self.pinViewFram.origin.x = (UIScreen.main.bounds.width - viewDrag.frame.width - 10.0)
                            }
                        } else if(viewDrag.frame.origin.x <= 0) {
                            UIView.animate(withDuration: 0.3) {
                                viewDrag.frame.origin.x = 10.0
                                self.pinViewFram.origin.x = 10.0
                            }
                        }
    
                        if yPos >= UIScreen.main.bounds.height {
                            UIView.animate(withDuration: 0.3) {
                                viewDrag.frame.origin.y = (UIScreen.main.bounds.height - viewDrag.frame.height - 10.0)
                                self.pinViewFram.origin.y = (UIScreen.main.bounds.height - viewDrag.frame.height - 10.0)
                            }
                        } else if(viewDrag.frame.origin.y <= 0) {
                            UIView.animate(withDuration: 0.3) {
                                viewDrag.frame.origin.y = 10.0
                                self.pinViewFram.origin.y = 10.0
                            }
                        }
                        viewDrag.layoutIfNeeded()
                        viewDrag.setNeedsLayout()
                        viewDrag.setNeedsDisplay()
                    }
                    print("Ended..")
                    break;
                default:
                    break;
            }
    
        }
    //    if let pinScoreView = PinScoreView().loadNib() as? PinScoreView {
    //        APPDELEGATE.window?.addSubview(pinScoreView)
    //        pinScoreView.backgroundColor = .clear
    //        pinScoreView.tag = 77654
    //        pinScoreView.layoutIfNeeded()
    //        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.draggedView(_:)))
    //        pinScoreView.isUserInteractionEnabled = true
    //        pinScoreView.addGestureRecognizer(panGesture)
    //        pinViewFram = CGRect(x: 0, y: (APPDELEGATE.window!.bounds.height / 2 - 40), width: 150, height: 150)
    //        pinScoreView.frame = pinViewFram
    //    }

        func insideDraggableArea(point : CGPoint, viewDrag: UIView) -> Bool {
            //print(viewDrag.frame.origin.x + viewDrag.frame.width)
            return ((point.x) > 0 && (viewDrag.frame.origin.x + viewDrag.frame.width) < UIScreen.main.bounds.width) &&
                (point.y > 0 && point.y < UIScreen.main.bounds.height)
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
            cell?._type = .Photos
            cell?.objNews = news
            return cell ?? UITableViewCell()
        }
        else if news._type == NewsType.Title.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTitleCell") as? HomeTitleCell
           
            cell?.objNews = news
            return cell ?? UITableViewCell()
        }
        else if news._type == NewsType.Videos.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomePhotoCell") as? HomePhotoCell
            cell?._type = .Video
            cell?.tblReference = tblList
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
