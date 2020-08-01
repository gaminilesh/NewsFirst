//
//  appTheamColor.swift
//  MobifinX1_Swift
//
//  Created by Ravi Malviya on 27/04/18.
//  Copyright © 2018 ravi's imac. All rights reserved.
//
//https://simple.wikipedia.org/wiki/List_of_colors
import UIKit

var appTheamColor = AppColor()

class AppColor {
    var AppNavigation : UIColor = {  // Use Navigationbar Submmit Button Utility Button
        return  #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
    }()

    var appColorPrimary : UIColor = {
     return  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }()
    /// Change Theme Light To Dark
    var white : UIColor = {
     if isDark {
         return  #colorLiteral(red: 0.03137254902, green: 0.05882352941, blue: 0.1137254902, alpha: 1)
     }else{
         return  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
     }
    }()
    var grey : UIColor = {
     return  #colorLiteral(red: 0.4941176471, green: 0.4941176471, blue: 0.4941176471, alpha: 1)  //7E7E7E
    }()
    var greyLight : UIColor = {
     return  #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1) //F1F1F1
    }()
    var view : UIColor = {
     return  #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9372549057, alpha: 1)  //EFEFEF
    }()
    var view1 : UIColor = {
     return  #colorLiteral(red: 0.9960784314, green: 0.9960784314, blue: 0.9960784314, alpha: 1)  //FEFEFE
    }()

    var viewLight : UIColor = {
     return  #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)  //F7F7F7
    }()
    /// Change Theme Light To Dark
    var black : UIColor = {
     if isDark {
         return  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
     }else{
         return  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
     }
    }()
    var red : UIColor = {
     return  #colorLiteral(red: 0.6666666667, green: 0.08235294118, blue: 0.07058823529, alpha: 1) //aa1512
    }()
    var red_light : UIColor = {
     return  #colorLiteral(red: 0.8901960784, green: 0.7098039216, blue: 0.7058823529, alpha: 1)  //E3B5B4
    }()

    var green : UIColor = {
     return  #colorLiteral(red: 0.2196078431, green: 0.5568627451, blue: 0.2352941176, alpha: 1)  //388E3C
    }()

    var redSwitch : UIColor = {
     return  #colorLiteral(red: 0.8274509804, green: 0.1843137255, blue: 0.1843137255, alpha: 1)
    }()
    var shimmerBackground : UIColor = {
     return  #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1) //DDDDDD
    }()
}



fileprivate var style : Bool = false
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




