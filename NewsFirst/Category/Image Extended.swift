//
//  Image+Extended.swift
//  MobifinElite
//
//  Created by Nilesh on 13/03/20.
//  Copyright © 2020 Panamax IOS Team. All rights reserved.
//

import UIKit
import SDWebImage
import SDWebImage.UIButton_WebCache

extension UIImageView {
    public func imageFromUrl(urlString: String?, placeholderImage:String, isRefreshCash:Bool = true) {

        if let urlString = urlString {
            if isRefreshCash == true {
                self.sd_setImage(with: URL(string: urlString), placeholderImage: UIImage(named: placeholderImage), options: .refreshCached)
                self.sd_imageIndicator = SDWebImageActivityIndicator.gray
                self.sd_imageIndicator = SDWebImageProgressIndicator.`default`
            }
            else{
                self.sd_setImage(with: URL(string: urlString), placeholderImage: UIImage(named: placeholderImage))
                self.sd_imageIndicator = SDWebImageActivityIndicator.gray
                self.sd_imageIndicator = SDWebImageProgressIndicator.`default`
            }
        }
        else{
            self.image = UIImage(named: placeholderImage)
        }
    }
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

extension UIButton{
    public func setBackgroundImageWithURL(urlString: String?, placeholderImage:String, isRefreshCash:Bool = true) {
        
        if let urlString = urlString {
            if isRefreshCash == true {
                self.sd_setImage(with: URL(string: urlString), for: .normal, placeholderImage: UIImage(named: placeholderImage), options: .refreshCached)
                self.imageView?.contentMode = .scaleAspectFit
            }
            else{
                self.sd_setBackgroundImage(with: URL(string: urlString), for: .normal, completed: nil)
                self.imageView?.contentMode = .scaleAspectFit
            }
        }
        else{
            self.imageView?.image = UIImage(named: placeholderImage)
        }
    }

}
extension UIImage {
    convenience init?(url: URL?) {
        guard let url = url else { return nil }

        do {
            let data = try Data(contentsOf: url)
            self.init(data: data)
        } catch {
            print("Cannot load image from url: \(url) with error: \(error)")
            return nil
        }
    }
    func renderResizedImage (newWidth: CGFloat) -> UIImage {
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale
        let newSize = CGSize(width: newWidth, height: newHeight)

        let renderer = UIGraphicsImageRenderer(size: newSize)

        let image = renderer.image { (context) in
            self.draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: newSize))
        }
        return image
    }
    func scaled(to maxSize: CGFloat) -> UIImage? {
        let aspectRatio: CGFloat = min(maxSize / size.width, maxSize / size.height)
        let newSize = CGSize(width: size.width * aspectRatio, height: size.height * aspectRatio)
        let renderer = UIGraphicsImageRenderer(size: newSize)
        return renderer.image { context in
            draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: newSize))
        }
    }
    func resizeImageNewHeight( newHeight: CGFloat) -> UIImage {
        var scale = CGFloat()
        var newWidth = CGFloat()
        
        if self.size.height > newHeight{
            scale = newHeight / self.size.height
            newWidth = self.size.width * scale
        }
        else{
            newWidth = self.size.width
        }
        
        UIGraphicsBeginImageContext(CGSize(width:newWidth, height:newHeight))
        self.draw(in: CGRect(x:0, y:0, width:newWidth, height:newHeight))
        
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }

}

//myImageView.sd_imageIndicator = SDWebImageProgressIndicator.default
//myImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
//myImageView.imageFromUrl(urlString: fileUrl, placeholderImage: "",isRefreshCash: true)
