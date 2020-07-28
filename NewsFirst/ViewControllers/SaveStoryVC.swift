//
//  ViewController.swift
//  NewsFirst
//
//  Created by  Mac on 7/26/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//

import UIKit
import SideMenu
class RecommendedModel {
    var id: String = ""
    var title: String = ""
    var subTitle: String = ""
    var imageURL: String?
    init(dic:NSDictionary) {
        self.id = dic.value(forKey: "Id") as? String ?? ""
        self.title = dic.value(forKey: "Title") as? String ?? ""
        self.subTitle = ((dic.value(forKey: "DateTime") as? String ?? "").date(format: "dd-mm-yyyy HH:mm:ss")?.dateString(format: "dd MMM yyyy")) ?? ""//02-7-2020 12:30:00
        self.imageURL = dic.value(forKey: "ImageUrl") as? String ?? ""
    }

}
class SaveStoryVC: UIViewController {
    var recommendedList:[RecommendedModel] = []

    @IBOutlet weak var tableview: UITableView!
    class func getInstance()-> SaveStoryVC {
        return SaveStoryVC.viewController(storyboard: Constants.Storyboard.SideMenu)
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
        if let path = Bundle.main.path(forResource: "SavedStories", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>,
                    let servicesArray = jsonResult["list"] as? NSArray {
                     for (_, obj) in servicesArray.enumerated() {
                        if let servicesDict = obj as? NSDictionary{
                            let recommendedModel = RecommendedModel(dic: servicesDict)
                            recommendedList.append(recommendedModel)
                        }
                        tableview.reloadData()
                     }
                }
              } catch {
                   // handle error
              }
        }



        tableview.contentInset = UIEdgeInsets(top: -1, left: 0, bottom: 0, right: 0)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.tableFooterView = UIView()
        tableview.reloadData()
    }
    
}
extension SaveStoryVC: UITableViewDataSource, UITableViewDelegate {
    // MARK:- UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recommendedList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SaveStoryCell", for: indexPath) as? SaveStoryCell {
            cell.selectionStyle = .none
            cell.lblTitle.text = recommendedList[indexPath.row].title
            cell.lblSubTitile.text = recommendedList[indexPath.row].subTitle
            cell.imgView.imageFromUrl(urlString: recommendedList[indexPath.row].imageURL, placeholderImage: "")

            
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
}

