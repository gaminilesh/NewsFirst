//
//  AppConfigure.swift
//  MobifinX1_Swift
//
//  Created by ravi's imac on 5/18/17.
//  Copyright © 2017 ravi's imac. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

struct AppConfigure {
    
}

extension AppConfigure {
    
    static let isSimulator: Bool = {
        var isSim = false//Device
        #if arch(i386) || arch(x86_64) || DEBUG
            isSim = true
        #endif
        return isSim
    }()

    static let isHsm: Bool = true
    static let isManulLocalize: Bool = true
    
    static func jailbroken(application: UIApplication) -> Bool {
        guard let cydiaUrlScheme = URL(string: "cydia://package/com.example.package") else { return isJailbroken() }
        return application.canOpenURL(cydiaUrlScheme) || isJailbroken()
    }
    static func isJailbroken() -> Bool {
        
        if isSimulator {
            return false
        }
        
        let fileManager = FileManager.default
        // # kiuwan Update
        if fileManager.fileExists(atPath: AppConfigure.pathCydia) ||
            fileManager.fileExists(atPath: AppConfigure.pathMobileSubstrate) ||
            fileManager.fileExists(atPath: AppConfigure.pathBinBash) ||
            fileManager.fileExists(atPath: AppConfigure.pathSbinSshd) ||
            fileManager.fileExists(atPath: AppConfigure.pathEtcApt) ||
            fileManager.fileExists(atPath: AppConfigure.pathBinSSH) {
            return true
        }

        if canOpen(path: AppConfigure.pathCydia) ||
            canOpen(path: AppConfigure.pathMobileSubstrate) ||
            canOpen(path: AppConfigure.pathBinBash) ||
            canOpen(path: AppConfigure.pathSbinSshd) ||
            canOpen(path: AppConfigure.pathEtcApt) ||
            canOpen(path: AppConfigure.pathBinSSH) {
            return true
        }
        
          // # kiuwan Update
          let path = "/\(AppConfigure.pathPrivate)/" + NSUUID().uuidString
//        let path = "/"private"/" + NSUUID().uuidString
        do {
            try "anyString".write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
            try fileManager.removeItem(atPath: path)
            return true
        } catch {
            return false
        }
    }
    static func canOpen(path: String) -> Bool {
        let file = fopen(path, "r")//TODO: not to use due to security reason
        guard file != nil else { return false }
        fclose(file)
        return true
    }


}

//SET PATH
extension AppConfigure{
             
    // # kiuwan Update FOR jailBreak Path
    static var pathCydia = "/Applications/Cydia.app"
    static var pathMobileSubstrate = "/Library/MobileSubstrate/MobileSubstrate.dylib"
    static var pathBinBash = "/bin/bash"
    static var pathSbinSshd = "/usr/sbin/sshd"
    static var pathEtcApt = "/etc/apt"
    static var pathBinSSH = "/usr/bin/ssh"
    static var pathPrivate = "private"
}

