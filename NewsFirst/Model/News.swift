//
//  News.swift
//  NewsFirst
//
//  Created by Ankit Sojitra on 27/07/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//

import UIKit

enum NewsType: String {
    case Title = "Title"
    case List = "List"
    case Advertise = "Advertise"
    case Photos = "Photos"
    case Videos = "Videos"
    case Breaking = "Breaking"
    case Text = "Text"
    case Details = "Details"
    case BulletArrow = "BulletArrow"
    case BulletNumber = "BulletNumber"
    case Twitter = "Twitter"
    case Instagram = "Instagram"
}
class News: NSObject {
    var dateTime : String?
    var _description : String?
    var id : Int?
    var imageURl : String?
    var title : String?
    var _type: String! = ""
    
    var newsList : [News]?
    
    init(dict:[String:Any]) {
        super.init()
        
        if let str = dict["DateTime"] as? String {
            dateTime = str
        }
        if let str = dict["Description"] as? String {
            _description = str
        }
        if let str = dict["Id"] as? Int {
            id = str
        }
        if let str = dict["ImageUrl"] as? String {
            imageURl = str
        }
        if let str = dict["Title"] as? String {
            title = str
        }
        if let str = dict["Type"] as? String {
            _type = str
        }
        if let list = dict["NewsList"] as? [Any], list.count > 0  {
            newsList = [News]()
            for obj in list {
                if let json = obj as? [String:Any] {
                    newsList?.append(News(dict: json))
                }
            }
        }
    }
    
}
