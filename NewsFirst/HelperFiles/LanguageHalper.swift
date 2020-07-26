//
//  File.swift
//  MobifinElite
//
//  Created by Chirag on 1/7/19.
//  Copyright © 2019 Panamax IOS Team. All rights reserved.
//

import Foundation
import UIKit

//https://medium.com/if-let-swift-programming/working-with-localization-in-swift-4a87f0d393a4

class LanguageModel:Codable {
    var locale: String?
    var rtlLayout: Bool = false
    var languageId: String?
    var icon: String?
    var name: String?
    var sort_order: String?

    var isSelected: Bool = false
    var isDefaultLang: Bool = false

    class func getList(langList:[[String:Any]]) ->[LanguageModel] {
        var array: [LanguageModel] = []
        for dict in langList {
            let model = LanguageModel()
            if let value = dict["locale"] as? String {
                model.locale = value
            }
            if let value = dict["rtlLayout"] as? String {
                if value == "true"{model.rtlLayout = true }
                else{ model.rtlLayout = false }
            }
            if let value = dict["rtlLayout"] as? Bool {
                model.rtlLayout = value
            }
            if let value = dict["languageId"] as? String {
                model.languageId = value
            }
            if let value = dict["icon"] as? String {
                model.icon = value
            }
            if let value = dict["name"] as? String {
                model.name = value
            }
            if let value = dict["sort_order"] as? String {
                model.sort_order = value
            }
            array.append(model)
        }
        return array
    }
}


class LLanguage {
    static var LanguageList:[LanguageModel] = []

//    static let APPLE_LANGUAGE_KEY = "AppleLanguages"

//    fileprivate static var appleLanguageInShort: String{ //en
////        let userdef = UserDefaults.standard
////        let langArray = userdef.object(forKey: LLanguage.APPLE_LANGUAGE_KEY) as? NSArray
////        if let current = langArray?.firstObject as? String {
////            let endIndex = current.startIndex
////            let index = current.index(endIndex, offsetBy: 2)
////            let currentWithoutLocale = String(current[..<index]) // Swift 4
////           // let currentWithoutLocale = current.substring(to: index)  // Swift 3
////            return currentWithoutLocale
////        }
//        return LanguageList.filter { (model) -> Bool in model.isSelected == true }.first?.locale ?? AppConfigure.defaultLanguage
//    }
//

    /// set @lang to be the first in Applelanguages list
    static var appleLanguage: String { //en-EN
        get{
//            let userdef = UserDefaults.standard
//            let langArray = userdef.object(forKey: LLanguage.APPLE_LANGUAGE_KEY) as? NSArray
//            let current = langArray?.firstObject as? String
//            return current
            if let local =  LanguageList.filter({ (model) -> Bool in model.isSelected == true }).first?.locale {
                return local
            }
            LanguageList.filter({ (model) -> Bool in model.locale == AppConfigure.defaultLanguage }).first?.isSelected = true
            return  AppConfigure.defaultLanguage
        }
        set(lang){
//            let userdef = UserDefaults.standard
//            userdef.set([lang], forKey: APPLE_LANGUAGE_KEY)//, appleLanguage
//            userdef.synchronize()
            let selectedData = LanguageList.filter({ (model) -> Bool in model.isSelected == true })
            for model in selectedData { model.isSelected = false }
            LanguageList.filter { (model) -> Bool in model.locale == lang }.first?.isSelected = true
            LLanguage.updateViewSemanticContentAttribute()
        }
    }
    static var isRTL: Bool{
        return LLanguage.LanguageList.filter({ (model) -> Bool in model.isSelected == true }).first?.rtlLayout ?? false
    }

    static func updateViewSemanticContentAttribute()
    {
        if LLanguage.isRTL == true{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        }
        else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
    }
}

class LLocalizer {

    class func doBaseInternationalization() {

//        if AppConfigure.isManulLocalize == true {

            LLanguage.updateViewSemanticContentAttribute()

            //Language reflect whithout restart app.
            MethodSwizzleGivenClassName(cls: Bundle.self, originalSelector: #selector(Bundle.localizedString(forKey:value:table:)), overrideSelector: #selector(Bundle.specialLocalizedStringForKey(_:value:table:)))

            //Navigation Back Button Mirroring.
            MethodSwizzleGivenClassName(cls: UIApplication.self, originalSelector: #selector(getter: UIApplication.userInterfaceLayoutDirection), overrideSelector: #selector(getter: UIApplication.cstm_userInterfaceLayoutDirection))

            //        MethodSwizzleGivenClassName(cls: UITextField.self, originalSelector: #selector(UITextField.layoutSubviews), overrideSelector: #selector(UITextField.cstmlayoutSubviews))

            //        MethodSwizzleGivenClassName(cls: UILabel.self, originalSelector: #selector(UILabel.layoutSubviews), overrideSelector: #selector(UILabel.cstmlayoutSubviews))
//        }
    }
}

//MARK: Language Localization using Storyboard/Location String
extension Bundle {

    @objc func specialLocalizedStringForKey(_ key: String, value: String?, table tableName: String?) -> String {
        if self == Bundle.main {
            var bundle = Bundle()
            if let _path = Bundle.main.path(forResource: LLanguage.appleLanguage, ofType: "lproj") {
                bundle = Bundle(path: _path)!
            } else {
                if let _path = Bundle.main.path(forResource: LLanguage.appleLanguage, ofType: "lproj") {
                    bundle = Bundle(path: _path)!
                } else {
                    bundle = Bundle(path: Bundle.main.path(forResource: "Base", ofType: "lproj")!)!
                }
            }
            return (bundle.specialLocalizedStringForKey(key, value: value, table: tableName))
        } else {
            return (self.specialLocalizedStringForKey(key, value: value, table: tableName))
        }
    }
}

//MARK: Navigation Back Button Mirroring
extension UIApplication {
    @objc var cstm_userInterfaceLayoutDirection: UIUserInterfaceLayoutDirection {
        get {
            var direction = UIUserInterfaceLayoutDirection.leftToRight
            if LLanguage.appleLanguage == "ar" {
                direction = .rightToLeft
            }
            return direction
        }
    }
}

/// Exchange the implementation of two methods of the same Class
func MethodSwizzleGivenClassName(cls: AnyClass, originalSelector: Selector, overrideSelector: Selector) {
    let origMethod: Method = class_getInstanceMethod(cls, originalSelector)!
    let overrideMethod: Method = class_getInstanceMethod(cls, overrideSelector)!
    if (class_addMethod(cls, originalSelector, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod))) {
        class_replaceMethod(cls, overrideSelector, method_getImplementation(origMethod), method_getTypeEncoding(origMethod))
    } else {
        method_exchangeImplementations(origMethod, overrideMethod)
    }
}
