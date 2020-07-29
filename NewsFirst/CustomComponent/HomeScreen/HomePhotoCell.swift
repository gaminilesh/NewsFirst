//
//  HomePhotoCell.swift
//  NewsFirst
//
//  Created by Ankit Sojitra on 27/07/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//

import UIKit

enum PhotoCellType : String {
    case Photos = "Photos"
    case Video = "Video"
}

class HomePhotoCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var pageIndicater: UIPageControl!
    @IBOutlet weak var clvList: UICollectionView!
    var tblReference : UITableView!
    
    var _type : PhotoCellType! = .Photos
    
    var imageList : [News]?
    
    var objNews : News? {
           didSet {
               setData()
           }
       }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUI()
        registeNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func setUI() {  // Set font and Color
        lblCount.layer.cornerRadius = lblCount.frame.size.height / 2
        lblCount.clipsToBounds = true
        
        lblTitle.text = "Photos"
        lblTitle.font = AppFont.Bold_Title3
        lblDescription.font = AppFont.Bold_Callout
        
        pageIndicater.currentPage = 0
        pageIndicater.numberOfPages = 10
        lblCount.text = "1/10"
    }
    
    func registeNib() {
        let viewNib = UINib(nibName: "CollectionViewPhotoCell", bundle: nil)
        clvList.register(viewNib, forCellWithReuseIdentifier: "CollectionViewPhotoCell")
    }
     
    
    func setData() {
        guard let obj = objNews else {
            return
        }
        imageList = obj.newsList
        lblDescription.text = obj.title
        
        if _type == .Video {
            lblTitle.text = "Video"
            pageIndicater.isHidden = true
            lblCount.isHidden = true
        }
        else {
            lblTitle.text = "Photos"
            pageIndicater.isHidden = false
            lblCount.isHidden = false
            pageIndicater.numberOfPages = imageList?.count ?? 0
            lblCount.text = "1/\(imageList?.count ?? 0)"
        }
        
        clvList.reloadData()
    }
    
}

extension HomePhotoCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let c = (scrollView.contentOffset.x / UIScreen.main.bounds.size.width)
        let current = Int((scrollView.contentOffset.x / UIScreen.main.bounds.size.width))
        pageIndicater.currentPage = current
        lblCount.text = "\(current + 1)/\(imageList?.count ?? 0)"
        print("Scrollview index : \(c)")
        
//        if current % 2 == 0 {
//            lblDescription.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem"
//        }
//        else {
//          lblDescription.text = "Lorem Ipsum is simply dummy text of"
//        }
      //  tblReference.reloadData()
    }
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView){
        let c = (scrollView.contentOffset.x / UIScreen.main.bounds.size.width)
        print("Scrollview index : \(c)")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (_type == .Video ? 1 : (imageList?.count ?? 0))
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewPhotoCell", for: indexPath) as! CollectionViewPhotoCell
        
        if _type == .Video {
            if let str = objNews?.imageURl, str != "" {
                cell.imgvPhoto.kf.setImage(with: URL(string: str)!)
            }
        }
        else {
            let news = imageList?[indexPath.row]
            if let str = news?.imageURl, str != "" {
                cell.imgvPhoto.kf.setImage(with: URL(string: str)!)
            }
        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    //** Size for the cells in the Waterfall Layout */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {        
        let size = CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.width)
        return size
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.zero
    }
}

