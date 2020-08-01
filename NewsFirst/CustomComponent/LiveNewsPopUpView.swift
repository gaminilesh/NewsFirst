//
//  LiveNewsPopUpView.swift
//  NewsFirst
//
//  Created by Ankit Sojitra on 30/07/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//

import UIKit

class LiveNewsPopUpView: UIView {
    
    var contentView:UIView?
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tblList: UITableView!
    
    var newsList = [News]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        xibSetup()
    }
    
    func xibSetup() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        contentView = view
        registeNib()
        setUI()
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "LiveNewsPopUpView", bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func registeNib() {
        tblList.register(UINib(nibName: "HomeImageWithTextCell", bundle: nil), forCellReuseIdentifier: "HomeImageWithTextCell")
        tblList.register(UINib(nibName: "HomePhotoCell", bundle: nil), forCellReuseIdentifier: "HomePhotoCell")
        tblList.register(UINib(nibName: "HomeTitleCell", bundle: nil), forCellReuseIdentifier: "HomeTitleCell")
        tblList.delegate = self
        tblList.dataSource = self        
    }
    
    func setUI() {
        lblTitle.font = AppFont.Medium_Headline
//        lblTitle.textColor = appTheamColor.white
        
//        lblDescription.font = AppFont.Medium_Callout
//        lblDescription.textColor = appTheamColor.white
    }
}


extension LiveNewsPopUpView : UITableViewDelegate, UITableViewDataSource {
    
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

