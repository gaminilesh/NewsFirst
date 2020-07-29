//
//  BottomCustomTab.swift
//  NewsFirst
//
//  Created by Ankit Sojitra on 29/07/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//

import UIKit

class BottomCustomTab: UIView {
    
    @IBOutlet weak var clvList: UICollectionView!
    
    
    class func instanceFromNib() -> BottomCustomTab {
        return UINib(nibName: "BottomCustomTab", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! BottomCustomTab
    }
    
    override func draw(_ rect: CGRect) {
        setUI()
    }
    
    func setUI() {  // Set font and Color
        registeNib()
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
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BottomCustomTabCell", for: indexPath) as! BottomCustomTabCell
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    //** Size for the cells in the Waterfall Layout */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 60, height: collectionView.frame.size.height)
        return size        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.zero
    }
}
