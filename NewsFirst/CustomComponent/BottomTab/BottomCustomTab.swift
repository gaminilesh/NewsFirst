//
//  BottomCustomTab.swift
//  NewsFirst
//
//  Created by Ankit Sojitra on 29/07/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//

import UIKit
class BottomTabMenuModel {
    var id: Int = 0
    var name: String = ""
    var fileName: String = ""
    var isSelected: Bool = false
    init(id: Int, name: String,fileName: String,isSelected:Bool = false) {
        self.id = id
        self.name = name
        self.fileName = fileName
        self.isSelected = isSelected
    }
}

class BottomCustomTab: UIView {
    
    @IBOutlet weak var clvList: UICollectionView!
    
    var newsCategotyList = [BottomTabMenuModel]()
    var selectedActionListener:((BottomTabMenuModel)->Swift.Void)?

    class func instanceFromNib() -> BottomCustomTab {
        return UINib(nibName: "BottomCustomTab", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! BottomCustomTab
    }
    
    override func draw(_ rect: CGRect) {
        setUI()
    }
    
    func setUI() {  // Set font and Color
        registeNib()
        newsCategotyList.append(BottomTabMenuModel(id: 0, name: "Top News", fileName: "Data",isSelected: true))
        newsCategotyList.append(BottomTabMenuModel(id: 1, name: "Politics", fileName: "Politics"))
        newsCategotyList.append(BottomTabMenuModel(id: 2, name: "Business", fileName: "Business"))
        newsCategotyList.append(BottomTabMenuModel(id: 3, name: "Sports", fileName: "Sports"))
        newsCategotyList.append(BottomTabMenuModel(id: 4, name: "Movies", fileName: "Movies"))
        newsCategotyList.append(BottomTabMenuModel(id: 5, name: "Prime", fileName: "Prime"))
        newsCategotyList.append(BottomTabMenuModel(id: 6, name: "Real Estate", fileName: "Data"))
        newsCategotyList.append(BottomTabMenuModel(id: 7, name: "Stock", fileName: "Politics"))
        newsCategotyList.append(BottomTabMenuModel(id: 8, name: "Quick", fileName: "Business"))
        newsCategotyList.append(BottomTabMenuModel(id: 9, name: "Live", fileName: "Sports"))

        clvList.delegate = self
        clvList.dataSource = self
    }
    
    func registeNib() {
        let viewNib = UINib(nibName: "BottomCustomTabCell", bundle: nil)
        clvList.register(viewNib, forCellWithReuseIdentifier: "BottomCustomTabCell")
    }
}

extension BottomCustomTab : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsCategotyList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BottomCustomTabCell", for: indexPath) as! BottomCustomTabCell
        cell.lblTitle.text = newsCategotyList[indexPath.row].name
        if newsCategotyList[indexPath.row].isSelected == true{
            cell.lblTitle.textColor = cell.seperaterView.backgroundColor
            cell.seperaterView.isHidden = false
        }else{
            cell.lblTitle.textColor = appTheamColor.black
            cell.seperaterView.isHidden = true
        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedData = newsCategotyList.filter { (model) -> Bool in
            model.isSelected == true
        }
        for model in selectedData {
            model.isSelected = false
        }
        newsCategotyList[indexPath.row].isSelected = true
        if let selectedActionListener = selectedActionListener {
            selectedActionListener(newsCategotyList[indexPath.row])
        }
        clvList.reloadData()
    }
    //** Size for the cells in the Waterfall Layout */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let fontAttributes = [NSAttributedString.Key.font: AppFont.Headline]
        let size1 = (newsCategotyList[indexPath.row].name).size(withAttributes: fontAttributes)
        let size = CGSize(width: (size1.width + 20), height: collectionView.frame.size.height)
        return size        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.zero
    }
}
