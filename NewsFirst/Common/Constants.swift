//
//  Constants.swift
//  MobifinElite
//
//  Created by Chirag on 1/7/19.
//  Copyright © 2019 Panamax IOS Team. All rights reserved.
//

import Foundation
import AVFoundation
import Photos
import UIKit

struct Constants
{
    struct Storyboard {
        static let Main = "Main"
        static let Dashboard = "Dashboard"

    }
    struct Navigation {
        static let NavDashboard = "NavDashboard"
        static let NavSideMenu = "NavSideMenu"
    }
    struct ViewController {
        
    }


}
extension Notification.Name {
    static let changeTheme = Notification.Name("ChangeTheme")
}

