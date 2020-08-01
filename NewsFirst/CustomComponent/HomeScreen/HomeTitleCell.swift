//
//  HomeTitleCell.swift
//  NewsFirst
//
//  Created by Ankit Sojitra on 28/07/20.
//  Copyright © 2020 iOS Dev. All rights reserved.
//

import UIKit
public extension CAGradientLayer {

    /// Sets the start and end points on a gradient layer for a given angle.
    ///
    /// - Important:
    /// *0°* is a horizontal gradient from left to right.
    ///
    /// With a positive input, the rotational direction is clockwise.
    ///
    ///    * An input of *400°* will have the same output as an input of *40°*
    ///
    /// With a negative input, the rotational direction is clockwise.
    ///
    ///    * An input of *-15°* will have the same output as *345°*
    ///
    /// - Parameters:
    ///     - angle: The angle of the gradient.
    ///
    public func calculatePoints(for angle: CGFloat) {


        var ang = (-angle).truncatingRemainder(dividingBy: 360)

        if ang < 0 { ang = 360 + ang }

        let n: CGFloat = 0.5

        switch ang {

        case 0...45, 315...360:
            let a = CGPoint(x: 0, y: n * tanx(ang) + n)
            let b = CGPoint(x: 1, y: n * tanx(-ang) + n)
            startPoint = a
            endPoint = b

        case 45...135:
            let a = CGPoint(x: n * tanx(ang - 90) + n, y: 1)
            let b = CGPoint(x: n * tanx(-ang - 90) + n, y: 0)
            startPoint = a
            endPoint = b

        case 135...225:
            let a = CGPoint(x: 1, y: n * tanx(-ang) + n)
            let b = CGPoint(x: 0, y: n * tanx(ang) + n)
           startPoint = a
            endPoint = b

        case 225...315:
            let a = CGPoint(x: n * tanx(-ang - 90) + n, y: 0)
            let b = CGPoint(x: n * tanx(ang - 90) + n, y: 1)
            startPoint = a
            endPoint = b

        default:
            let a = CGPoint(x: 0, y: n)
            let b = CGPoint(x: 1, y: n)
            startPoint = a
            endPoint = b

        }
    }

    /// Private function to aid with the math when calculating the gradient angle
    private func tanx(_ 𝜽: CGFloat) -> CGFloat {
        return tan(𝜽 * CGFloat.pi / 180)
    }


    // Overloads

    /// Sets the start and end points on a gradient layer for a given angle.
    public func calculatePoints(for angle: Int) {
        calculatePoints(for: CGFloat(angle))
    }

    /// Sets the start and end points on a gradient layer for a given angle.
    public func calculatePoints(for angle: Float) {
        calculatePoints(for: CGFloat(angle))
    }

    /// Sets the start and end points on a gradient layer for a given angle.
    public func calculatePoints(for angle: Double) {
        calculatePoints(for: CGFloat(angle))
    }

}
class GradientView: UIView {
    override open class var layerClass: AnyClass {
       return CAGradientLayer.classForCoder()
    }
//As discussed in call for gradient color
//<gradient
//        android:endColor="#00000000"
//        android:centerColor="@color/red_light"
//        android:startColor="@color/red"
//        android:angle="90"
//        android:dither="true"
//        />
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let gradientLayer = layer as! CAGradientLayer

        gradientLayer.colors = [UIColor.white.withAlphaComponent(0.0).cgColor, appTheamColor.red_light.withAlphaComponent(0.5).cgColor,appTheamColor.red.withAlphaComponent(1.0).cgColor]
        gradientLayer.calculatePoints(for: 90)

    }
}

class HomeTitleCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var imgvPhoto: UIImageView!
    @IBOutlet weak var imgvShadow: UIImageView!
    
    
    var objNews : News? {
           didSet {
               setData()
           }
       }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUI()
       
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func setUI() {  // Set font and Color
        lblTitle.text = ""
        lblTitle.font = AppFont.Bold_Title3
        lblTitle.textColor = appTheamColor.white
        
        lblTime.text = ""//obj.dateTime
        lblTime.font = AppFont.Bold_Footnote
        lblTime.textColor = appTheamColor.white

    }
    
   
    func setData() {
        guard let obj = objNews else {
            return
        }
        lblTitle.text = obj.title
        lblTime.text = "5 Minutes ago"//obj.dateTime
        if let str = obj.imageURl, str != "" {
            imgvPhoto.kf.setImage(with: URL(string: str)!)
        }
    }
    
}

