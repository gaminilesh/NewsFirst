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
         geaderView.heightAnchor.constraint(equalToConstant: 50).isActive = true
         geaderView.backgroundColor = .yellow
//        geaderView.addConstraint(heightConstraint)
//        heightConstraint.isActive = true
        
        tblList.tableHeaderView = geaderView
        tblList.tableHeaderView?.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
     //   self.view.addSubview(reppleView)
        
//        let img = UIImageView()
//        img.tag = 120
//        pinViewFram = CGRect(x: 100, y: 400, width: 100, height: 100)
//        img.frame = pinViewFram
//        img.backgroundColor = .red
//        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.draggedView(_:)))
//        img.isUserInteractionEnabled = true
//        img.addGestureRecognizer(panGesture)
        
     //   self.view.addSubview(img)
        
        //        let panGesture1 = UIPanGestureRecognizer(target: self, action: #selector(self.draggedLiveNewsView(_:)))
        //        viewLiveNewsPopup.isUserInteractionEnabled = true
        //        viewLiveNewsPopup.addGestureRecognizer(panGesture1)
//
//        bottomView.addSubview(bottomTabView)
//        bottomTabView.translatesAutoresizingMaskIntoConstraints = false
//
//
//        bottomView.addConstraint(NSLayoutConstraint(item: bottomTabView, attribute: .top, relatedBy: .equal, toItem: bottomView, attribute: .top, multiplier: 1, constant: 0))
//        bottomView.addConstraint(NSLayoutConstraint(item: bottomTabView, attribute: .bottom, relatedBy: .equal, toItem: bottomView, attribute: .bottom, multiplier: 1, constant: 0))
//        bottomView.addConstraint(NSLayoutConstraint(item: bottomTabView, attribute: .leading, relatedBy: .equal, toItem: bottomView, attribute: .leading, multiplier: 1, constant: 0))
//        bottomView.addConstraint(NSLayoutConstraint(item: bottomTabView, attribute: .trailing, relatedBy: .equal, toItem: bottomView, attribute: .trailing, multiplier: 1, constant: 0))
//
//        //        let views = ["view":bottomTabView]
//        //        bottomView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[view]", options: [], metrics: nil, views: views))
//        //        bottomView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[view]", options: [], metrics: nil, views: views))
//
//        //        bottomTabView.frame = CGRect(x: 0, y: 200, width: UIScreen.main.bounds.size.width, height: 40)
//        //        self.view.addSubview(bottomTabView)
//        //bottomTabView.clvList.reloadData()
//        bottomView.layoutIfNeeded()
//        setupNavigation()
//
//        // reppleView.frame = CGRect(x: (UIScreen.main.bounds.size.width - 85), y: (UIScreen.main.bounds.size.height - 125), width: 50, height: 50)
//
//
//        reppleView.translatesAutoresizingMaskIntoConstraints = false
//
//        //        reppleView.addConstraint(NSLayoutConstraint(item: bottomTabView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50))
//        //         reppleView.addConstraint(NSLayoutConstraint(item: bottomTabView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50))
//        self.view.addConstraint(NSLayoutConstraint(item: reppleView, attribute: .bottom, relatedBy: .equal, toItem: bottomView, attribute: .top, multiplier: 1, constant: -35))
//
//        self.view.addConstraint(NSLayoutConstraint(item: reppleView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: -35))
//        reppleView.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        reppleView.widthAnchor.constraint(equalToConstant: 50).isActive = true
//
//        reppleView.showRippleEffecr = true
//
//        reppleView.onRippleTap = { (sender) in
//            self.viewLiveNewsPopup.isHidden = false
//            self.reppleView.isHidden = true
//        }
//
//        viewBrekingNews.onButtonCloseTap = { (sender) in
//            self.viewBrekingNewsHeightConstraint.constant = 0
//            UIView.animate(withDuration: 0.9, animations: {
//                self.view.layoutIfNeeded()
//            })
//        }
//        viewLiveNewsPopup.newsList = [newsList[1], newsList[2]]
    }
    
    //TODO:- Custome Navigation Render.
    func setupNavigation()  {
        //            extendedLayoutIncludesOpaqueBars = true
        //            setNavigationBarSetup()
        //            navigationLeftButtonSetup(action: #selector(goLeftNavigationAction(sender:)))
    }
    
    
    @objc override func goLeftNavigationAction(sender: Any) {
        //            let sideMenu = LeftMenuVC.getInstance()
        //            let menu = SideMenuNavigationController(rootViewController: sideMenu)
        //            menu.navigationBar.isHidden = true
        //            menu.leftSide = LLanguage.isRTL == true ? false : true
        //            menu.menuWidth = UIScreen.main.bounds.width * 0.85
        //            menu.statusBarEndAlpha = 0
        //            menu.presentationStyle = .menuSlideIn
        //            menu.presentationStyle.presentingEndAlpha = CGFloat(0.6)
        //            present(menu, animated: true, completion: nil)
    }
    func registeNib() {
        tblList.register(UINib(nibName: "HomeImageWithTextCell", bundle: nil), forCellReuseIdentifier: "HomeImageWithTextCell")
        tblList.register(UINib(nibName: "HomePhotoCell", bundle: nil), forCellReuseIdentifier: "HomePhotoCell")
        tblList.register(UINib(nibName: "HomeTitleCell", bundle: nil), forCellReuseIdentifier: "HomeTitleCell")
        tblList.register(UINib(nibName: "SubHomeBulletCell", bundle: nil), forCellReuseIdentifier: "SubHomeBulletCell")
        tblList.register(UINib(nibName: "SubHomeTextCell", bundle: nil), forCellReuseIdentifier: "SubHomeTextCell")
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
                    } else if(viewDrag.frame.origin.y <= 80) {
                        UIView.animate(withDuration: 0.3) {
                            viewDrag.frame.origin.y = 80.0
                            self.pinViewFram.origin.y = 80.0
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
    
    var heightOfView : CGFloat = 175
    var lastPoint1 : CGFloat = 0
    @objc func draggedLiveNewsView(_ sender:UIPanGestureRecognizer) {
        
        switch sender.state {
            case .began:
                let c = sender.location(in: sender.view).y
                //                location(in view: UIView?) -> CGPoint
                lastPoint1 = sender.location(in: sender.view).y //sender.view?.frame.origin.y as! CGFloat
                break;
            case .changed:
                if let viewDrag = sender.view as? LiveNewsPopUpView {
                    //SA
                    let c = sender.location(in: sender.view).y
                    let translation = sender.view?.frame.origin
                    //                    let diffX = lastPoint1.x - translation.x
                    let diffY = lastPoint1 + c
                    
                    viewLiveNewsPopupHeightConstraint.constant = viewLiveNewsPopupHeightConstraint.constant - diffY
                    // viewDrag.layoutIfNeeded()
                    lastPoint1 = c
                    // sender.view?.frame = pinViewFram
                }
                break;
            case .ended:
                if let viewDrag = sender.view as? LiveNewsPopUpView {
                    //                    print(viewDrag.frame.origin.x)
                    //                    let xPos = (viewDrag.frame.origin.x + viewDrag.frame.width)
                    //                    let yPos = (viewDrag.frame.origin.y + viewDrag.frame.height)
                    //
                    //                    UIView.animate(withDuration: 0.3) {
                    //                        viewDrag.transform = CGAffineTransform.identity
                    //                    }
                    //
                    //                    if xPos >= UIScreen.main.bounds.width {
                    //                        UIView.animate(withDuration: 0.3) {
                    //                            viewDrag.frame.origin.x = (UIScreen.main.bounds.width - viewDrag.frame.width - 10.0)
                    //                            self.pinViewFram.origin.x = (UIScreen.main.bounds.width - viewDrag.frame.width - 10.0)
                    //                        }
                    //                    } else if(viewDrag.frame.origin.x <= 0) {
                    //                        UIView.animate(withDuration: 0.3) {
                    //                            viewDrag.frame.origin.x = 10.0
                    //                            self.pinViewFram.origin.x = 10.0
                    //                        }
                    //                    }
                    //
                    //                    if yPos >= UIScreen.main.bounds.height {
                    //                        UIView.animate(withDuration: 0.3) {
                    //                            viewDrag.frame.origin.y = (UIScreen.main.bounds.height - viewDrag.frame.height - 10.0)
                    //                            self.pinViewFram.origin.y = (UIScreen.main.bounds.height - viewDrag.frame.height - 10.0)
                    //                        }
                    //                    } else if(viewDrag.frame.origin.y <= 80) {
                    //                        UIView.animate(withDuration: 0.3) {
                    //                            viewDrag.frame.origin.y = 80.0
                    //                            self.pinViewFram.origin.y = 80.0
                    //                        }
                    //                    }
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
extension SubHomeVC : UITableViewDelegate, UITableViewDataSource {
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
