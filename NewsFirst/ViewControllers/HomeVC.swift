//
//  ViewController.swift
//  NewsFirst
//
//  Created by  Mac on 7/26/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//

import UIKit
import SideMenu

class HomeVC: BaseViewController,MyDataSendingDelegateProtocol {
    
    class func getInstance()-> HomeVC {
        return HomeVC.viewController(storyboard: Constants.Storyboard.Dashboard)
    }
    @IBOutlet weak var menuButton: UIButton!

    @IBOutlet weak var topConstraintOfBrekingNews: NSLayoutConstraint!
    var lastPoint : CGPoint = CGPoint.zero
    var pinViewFram : CGRect = CGRect.zero
    

    @IBOutlet weak var tblList: UITableView!
    @IBOutlet weak var bottomView: UIView!
    //    var reppleView = RippleView.instanceFromNib()
    let bottomTabView = BottomCustomTab.instanceFromNib()
    
    @IBOutlet weak var viewBrekingNews: BreakingNewsView!
    @IBOutlet weak var viewBrekingNewsHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewLiveNewsPopup: LiveNewsPopUpView!
    @IBOutlet weak var viewLiveNewsPopupHeightConstraint: NSLayoutConstraint!
    
    var newsList = [News]()
    var current = ""
    var id = 0
    var name : String! = "Top News"
    func changeData(str:String) {
        if let lf = finalData?[str] as? [News] {
            newsList = lf
            if newsList.first?._type == NewsType.Breaking.rawValue {
                newsList.remove(at: 0)
            }
            tblList.reloadData()
        }

        self.tblList.scrollToRow(at: IndexPath(item: 0, section: 0), at: .top, animated: false)
    }
    
    @IBAction func menuButtomAction(_ sender: Any) {
        let sideMenu = LeftMenuVC.getInstance()
        let menu = SideMenuNavigationController(rootViewController: sideMenu)
        menu.navigationBar.isHidden = true
        menu.leftSide = LLanguage.isRTL == true ? false : true
        menu.menuWidth = 260
        menu.statusBarEndAlpha = 0
        menu.presentationStyle = .menuSlideIn
        menu.presentationStyle.presentingEndAlpha = CGFloat(0.6)
        present(menu, animated: true, completion: nil)
    }
    var finalData: [String:Any]?
    func selectedBottomMenu(contentModel: BottomTabMenuModel) {
        bottomTabView.selectIndex = contentModel.id
        self.name = contentModel.name
        self.id = contentModel.id
        self.changeData(str: contentModel.fileName)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tblList.tableFooterView = UIView()
        self.viewBrekingNewsHeightConstraint.constant = 80
        
        registeNib()
        
        finalData = JSONReaderManager.sharedInstance.ReadJSON(_insideNodeValue: "Business")
        if let lf = finalData?["Data"] as? [News] {
            newsList = lf
            if newsList.first?._type == NewsType.Breaking.rawValue {
                newsList.remove(at: 0)
            }
            tblList.reloadData()
        }
        
        menuButton.setImage(#imageLiteral(resourceName: "menu"), for: .normal)
        menuButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        menuButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        menuButton.layer.shadowOpacity = 1.0
        menuButton.layer.shadowRadius = 10.0
        menuButton.layer.masksToBounds = false
        menuButton.adjustsImageWhenHighlighted = false

        //  self.passJsonFileName(fileName: "Data")
        //        let list = JSONReaderManager.sharedInstance.ReadJSON(_insideNodeValue: "Business")
        //        if list.count > 0 {
        //            for obj in list {
        //                print(obj)
        //                if let json = obj as? [String:Any] {
        //                    newsList.append(News(dict: json))
        //                }
        //            }
        //            tblList.reloadData()
        //        }
        //
        
        //        self.view.addSubview(reppleView)
        
        //        let img = UIImageView()
        //        img.tag = 120
        //        pinViewFram = CGRect(x: 100, y: 400, width: 100, height: 100)
        //        img.frame = pinViewFram
        //        img.backgroundColor = .red
        //        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.draggedView(_:)))
        //        img.isUserInteractionEnabled = true
        //        img.addGestureRecognizer(panGesture)
        //
        //        self.view.addSubview(img)
        
        //        let panGesture1 = UIPanGestureRecognizer(target: self, action: #selector(self.draggedLiveNewsView(_:)))
        //        viewLiveNewsPopup.isUserInteractionEnabled = true
        //        viewLiveNewsPopup.addGestureRecognizer(panGesture1)
        
        bottomView.addSubview(bottomTabView)
        bottomTabView.translatesAutoresizingMaskIntoConstraints = false
        
        
        bottomView.addConstraint(NSLayoutConstraint(item: bottomTabView, attribute: .top, relatedBy: .equal, toItem: bottomView, attribute: .top, multiplier: 1, constant: 0))
        bottomView.addConstraint(NSLayoutConstraint(item: bottomTabView, attribute: .bottom, relatedBy: .equal, toItem: bottomView, attribute: .bottom, multiplier: 1, constant: 0))
        bottomView.addConstraint(NSLayoutConstraint(item: bottomTabView, attribute: .leading, relatedBy: .equal, toItem: bottomView, attribute: .leading, multiplier: 1, constant: 0))
        bottomView.addConstraint(NSLayoutConstraint(item: bottomTabView, attribute: .trailing, relatedBy: .equal, toItem: bottomView, attribute: .trailing, multiplier: 1, constant: 0))
        
        //        let views = ["view":bottomTabView]
        //        bottomView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[view]", options: [], metrics: nil, views: views))
        //        bottomView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[view]", options: [], metrics: nil, views: views))
        
        //        bottomTabView.frame = CGRect(x: 0, y: 200, width: UIScreen.main.bounds.size.width, height: 40)
        //        self.view.addSubview(bottomTabView)
        //bottomTabView.clvList.reloadData()
        
        bottomTabView.selectedActionListener = {[weak self] (content) in
            DispatchQueue.main.async() {
                if let weakSelf = self {
                    weakSelf.name = content.name
                    weakSelf.id = content.id
                    weakSelf.changeData(str: content.fileName)
                    //weakSelf.passJsonFileName(fileName: content.fileName)
                }
            }
        }
        
        bottomView.layoutIfNeeded()
//        setupNavigation()
        
        // reppleView.frame = CGRect(x: (UIScreen.main.bounds.size.width - 85), y: (UIScreen.main.bounds.size.height - 125), width: 50, height: 50)
        
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
        viewBrekingNews.onButtonCloseTap = { (sender) in
            self.viewBrekingNewsHeightConstraint.constant = 0
            //            UIView.animate(withDuration: 0.9, animations: {
            //                self.view.layoutIfNeeded()
            //            })
            
            UIView.animate(withDuration: 0.9, animations: {
                self.view.layoutIfNeeded()
            }) { (flag) in
                if flag {
                    self.topConstraintOfBrekingNews.priority = UILayoutPriority(rawValue: 997)
                    self.view.layoutIfNeeded()
                }
            }
            
        }
        viewLiveNewsPopup.newsList = [newsList[1], newsList[2]]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    func passJsonFileName(fileName:String)  {
        newsList.removeAll()
        let list = JSONReaderManager.sharedInstance.ReadJSON(_insideNodeValue: fileName)
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
//    //TODO:- Custome Navigation Render.
//    func setupNavigation()  {
//        extendedLayoutIncludesOpaqueBars = true
//        setNavigationBarSetup()
//        navigationLeftButtonSetup(action: #selector(goLeftNavigationAction(sender:)))
//    }
//
//
//    @objc override func goLeftNavigationAction(sender: Any) {
//        let sideMenu = LeftMenuVC.getInstance()
//        let menu = SideMenuNavigationController(rootViewController: sideMenu)
//        menu.navigationBar.isHidden = true
//        menu.leftSide = LLanguage.isRTL == true ? false : true
//        menu.menuWidth = 260
//        menu.statusBarEndAlpha = 0
//        menu.presentationStyle = .menuSlideIn
//        menu.presentationStyle.presentingEndAlpha = CGFloat(0.6)
//        present(menu, animated: true, completion: nil)
//    }
    func registeNib() {
        tblList.register(UINib(nibName: "HomeImageWithTextCell", bundle: nil), forCellReuseIdentifier: "HomeImageWithTextCell")
        tblList.register(UINib(nibName: "HomePhotoCell", bundle: nil), forCellReuseIdentifier: "HomePhotoCell")
        tblList.register(UINib(nibName: "HomeTitleCell", bundle: nil), forCellReuseIdentifier: "HomeTitleCell")
        
        tblList.register(UINib(nibName: "HomeAdvertiseCell", bundle: nil), forCellReuseIdentifier: "HomeAdvertiseCell")
        tblList.register(UINib(nibName: "BlankCell", bundle: nil), forCellReuseIdentifier: "BlankCell")

        
        
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
        else if news._type == NewsType.Advertise.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeAdvertiseCell") as? HomeAdvertiseCell
            cell?.objNews = news
            return cell ?? UITableViewCell()
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "BlankCell") as? BlankCell
            cell?.separatorInset = UIEdgeInsets(top: 0, left: UIScreen.main.bounds.size.width, bottom: 0, right: 0)

            return cell ?? UITableViewCell()
        }
//
//        //
//        let cell = tableView.dequeueReusableCell(withIdentifier: "HomePhotoCell") as? HomePhotoCell
//        cell?.tblReference = tblList
//        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = newsList[indexPath.row]
        print("Selected Cell : \(indexPath.row)")
        if news._type == NewsType.List.rawValue {
            let controller = SubHomeVC.getInstance()
            controller.delegate = self
            controller.name = name
            controller.selectedId = id
            controller.jsonFileName = "\(indexPath.row > 3 ? 1 : indexPath.row)"
            self.navigationController?.pushViewController(controller, animated: true)
        }

    }
    
}



import Foundation
import SwiftyJSON

class JSONReaderManager
{
    static let sharedInstance = JSONReaderManager()
    func ReadJSON(_insideNodeValue:String!) -> [String:Any] {
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
                
                var finalDict = [String:Any]()
                if let fj = jsonObj["Data1"]["Dashboard"].dictionaryObject {
                    for str in fj.keys {
                         var newsList = [News]()
                        let allvalues = convertToDictionary(text: (jsonObj["Data1"]["Dashboard"][str].stringValue))!
                        let requestDataDict:NSDictionary = allvalues as NSDictionary
                        var newDict = ((requestDataDict.value(forKey: "Dashboard") as! NSArray)[0] as! NSDictionary).value(forKey: "Data") as! NSArray
                        if newDict.count > 0 {
                            for obj in newDict {
                                if let json = obj as? [String:Any] {
                                    newsList.append(News(dict: json))
                                }
                            }
                        }
                        finalDict[str] = newsList
                    }
                }
                return finalDict
//                let TabValues = jsonObj["Data1"]["Dashboard"][_insideNodeValue] // print(jsonObj["Data1"]["Dashboard"].dictionary?.keys)
//                let allvalues = convertToDictionary(text: TabValues.stringValue)!
//                let requestDataDict:NSDictionary = allvalues as NSDictionary
//                let newDict =  ((requestDataDict.value(forKey: "Dashboard") as! NSArray)[0] as! NSDictionary).value(forKey: "Data") as! NSArray
//                print(newDict)
//                return newDict
                
            } catch let error {
                print("parse error: \(error.localizedDescription)")
                return [String:Any]()
            }
        } else {
            print("Invalid filename/path.")
            return [String:Any]()
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
