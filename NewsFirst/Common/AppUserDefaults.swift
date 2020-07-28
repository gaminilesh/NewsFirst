//
//  AppUserDefult.swift
//  MobifinElite
//
//  Created by Nilesh on 02/04/20.
//  Copyright © 2020 Panamax IOS Team. All rights reserved.
//

import UIKit

struct AppUserDefaults {

   //MARK: Userdefault
    private static let IsLogin = "IsLogin"
//    private static let LoginUserProfileDetails = "LoginUserProfileDetails"
//    private static let AuthToken = "AuthToken"
    private static let IsDarkMode = "IsDarkMode"
//    private static let SelectedTheme = "SelectedTheme"
//    private static let IsAppNotOpenFirstTime = "IsAppNotOpenFirstTime"
//    private static let UserIdentifier = "userIdentifier"
//    private static let LanguageList = "LanguageList"
//    private static let LastCoreDataVersion = "LastCoreDataVersion"
//    private static let MobileNumber = "phoneNumber" //"MobileNumber"

//    static var lastCoreDataVersion: Int {
//        get {return UserDefaults.standard.integer(forKey: LastCoreDataVersion)}
//        set(v) {UserDefaults.standard.set(v, forKey: LastCoreDataVersion)}
//    }
//    static var mobileNumber: String? {
//        get {return UserDefaults.standard.string(forKey: MobileNumber)}
//        set(v) {UserDefaults.standard.set(v, forKey: MobileNumber)}
//    }
//
//
    static var isLogin: Bool {
        get {return UserDefaults.standard.bool(forKey: IsLogin)}
        set(v) {UserDefaults.standard.set(v, forKey: IsLogin)}
    }
//    static var isLunchedWellComeScreen: Bool {
//        get {return UserDefaults.standard.bool(forKey: IsLunchScreenOpen)}
//        set(v) {UserDefaults.standard.set(v, forKey: IsLunchScreenOpen)}
//    }
//    static var userProfile: ProfileDetails {
//        get { return UserDefaults.standard.value(ProfileDetails.self, forKey: LoginUserProfileDetails) ?? ProfileDetails()}
//        set(v) { UserDefaults.standard.set(encodable: v, forKey: LoginUserProfileDetails)}
//    }
//
//    static var languageList: [LanguageModel]? {
//        get { return UserDefaults.standard.value([LanguageModel].self, forKey: LanguageList) ?? []}
//        set(v) { UserDefaults.standard.set(encodable: v, forKey: LanguageList)}
//    }
//
//    static var authToken: String? {
//        get {return UserDefaults.standard.string(forKey: AuthToken)}
//        set(v) {UserDefaults.standard.set(v, forKey: AuthToken)}
//    }
//    static var userIdentifier: String {
//        get {return UserDefaults.standard.string(forKey: UserIdentifier) ?? ""}
//        set(v) {UserDefaults.standard.set(v, forKey: UserIdentifier)}
//    }
    static var isDarkMode: Bool {
        get {return UserDefaults.standard.bool(forKey: IsDarkMode)}
        set(v) {UserDefaults.standard.set(v, forKey: IsDarkMode)}
    }
//    static var selectedTheme: Int {
//        get {return UserDefaults.standard.integer(forKey: SelectedTheme)}
//        set(v) {UserDefaults.standard.set(v, forKey: SelectedTheme)}
//    }
//    static var isAppNotOpenFirstTime: Bool {
//        get {return UserDefaults.standard.bool(forKey: IsAppNotOpenFirstTime)}
//        set(v) {UserDefaults.standard.set(v, forKey: IsAppNotOpenFirstTime)}
//    }
//

}

extension UserDefaults {
    func set<T: Encodable>(encodable: T, forKey key: String) {
        if let data = try? JSONEncoder().encode(encodable) {
            set(data, forKey: key)
        }
    }
    func value<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
        if let data = object(forKey: key) as? Data,
            let value = try? JSONDecoder().decode(type, from: data) {
            return value
        }
        return nil
    }
}
