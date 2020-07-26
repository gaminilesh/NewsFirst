//
//  appTheamColor.swift
//  MobifinX1_Swift
//
//  Created by Ravi Malviya on 27/04/18.
//  Copyright © 2018 ravi's imac. All rights reserved.
//
//https://simple.wikipedia.org/wiki/List_of_colors
import UIKit
fileprivate struct AppColors {
    
    //MARK: Color
    static let primary = #colorLiteral(red: 0.9019607843, green: 0, blue: 0.4941176471, alpha: 1) //Merchant App (RGB : 230,0,126)
    
    static let secondary = #colorLiteral(red: 0, green: 0.6235294118, blue: 0.5960784314, alpha: 1) //Agent App
    
    static let Appbackground = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1) //Customer App
    static let formelementBackground = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    static let enterText = #colorLiteral(red: 0.4039215686, green: 0.4039215686, blue: 0.4039215686, alpha: 1)
    static let placeholderText = #colorLiteral(red: 0.7743244767, green: 0.7743428349, blue: 0.7743329406, alpha: 1)
    static let text = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
    static let textDisplay = #colorLiteral(red: 0.168627451, green: 0.168627451, blue: 0.168627451, alpha: 1)
    static let clearColor = UIColor.clear
    
    static let placeholderPrimaryOpp = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7)
    
    let clearColor = UIColor.clear
    
    
    //OLd Color below
    
    static var AppBlue_057AAE : UIColor = #colorLiteral(red: 0.01960784314, green: 0.4784313725, blue: 0.6823529412, alpha: 1) //_057AAE
    static var AppBlue_0BAFF8 : UIColor =  #colorLiteral(red: 0.0431372549, green: 0.6862745098, blue: 0.9725490196, alpha: 1) //0BAFF8
    static var AppOrange_FB6D0E : UIColor = #colorLiteral(red: 0.9843137255, green: 0.4274509804, blue: 0.05490196078, alpha: 1) //#FB6D0E
    static var AppGray_373737 : UIColor =  #colorLiteral(red: 0.2156862745, green: 0.2156862745, blue: 0.2156862745, alpha: 1) //#373737 // Use for BackGroundAds
    static var AppGray_E4E4E4 : UIColor =  #colorLiteral(red: 0.8941176471, green: 0.8941176471, blue: 0.8941176471, alpha: 1) //#E4E4E4  //Use Ony BackGroundAds light BG
    static var AppGray_474747 : UIColor =  #colorLiteral(red: 0.2784313725, green: 0.2784313725, blue: 0.2784313725, alpha: 1) //#474747 //Use For Dashboard BG
    //Use For Text
    static var AppGray_9AA3AF : UIColor =  #colorLiteral(red: 0.9019607843, green: 0, blue: 0.4941176471, alpha: 0.7) //#9AA3AF  //User For Dark Text
    static var AppDarkBlue_601EE5 : UIColor =  #colorLiteral(red: 0.4980392157, green: 0.3490196078, blue: 0.768627451, alpha: 1) //#601EE5
    //Fix Color Not Change
    static var AppGray_EEEEEE : UIColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1) //#EEEEEE
    static var AppGray_F6F6F6 : UIColor =  #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1) //#F6F6F6
    static var AppGray_E2E2E2 : UIColor = #colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8862745098, alpha: 1) //#E2E2E2  //Sepreter  // Border
    static var AppGray_FCF9F9 : UIColor = #colorLiteral(red: 0.9882352941, green: 0.9764705882, blue: 0.9764705882, alpha: 1) //##FCF9F9  //Border View BackGround
    static var AppRed_D52222 : UIColor = #colorLiteral(red: 0.8352941176, green: 0.1333333333, blue: 0.1333333333, alpha: 1) //#D52222
    static var AppOrange_F37437 : UIColor = #colorLiteral(red: 0.9529411765, green: 0.4549019608, blue: 0.2156862745, alpha: 1) //#F37437
    static var AppGreen_4BBF7D : UIColor = #colorLiteral(red: 0.2941176471, green: 0.7490196078, blue: 0.4901960784, alpha: 1) //#4BBF7D
    static var AppWhite_FFFFFF : UIColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) //#FFFFFF
    static let textBlack = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    static let sucessPartial = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)

}

var appTheamColor = AppColor()

class AppColor {
    

    var appClear : UIColor = {
           return AppColors.clearColor
       }()
    
    var appWhite : UIColor = {
        return AppColors.formelementBackground
    }()
    var background : UIColor = {
        return AppColors.formelementBackground
    }()
    
    var Text : UIColor = {
        return AppColors.enterText
    }()
    

}



fileprivate var style : Bool = true
var isDark : Bool {
    set {
        if newValue != style {
            style = newValue
            AppUserDefaults.isDarkMode = newValue
            NotificationCenter.default.post(name: .changeTheme , object: nil)
            appTheamColor = AppColor()
        }
    }
    get {
        return style
    }
}



