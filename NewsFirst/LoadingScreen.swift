//
//  LaunchScreenVC
//  MobifinElite_Swift
//
//  Created by Chirag on 12/19/18.
//  Copyright © 2018 Panamax IOS Team. All rights reserved.
//

import Foundation
import UIKit

class LoadingScreen: UIViewController
{

    @IBOutlet weak var loadingImageView: UIImageView!

    @IBOutlet weak var lblDate: UILabel!
    class func getInstance()-> LoadingScreen {
        return LoadingScreen.viewController(storyboard: Constants.Storyboard.Main)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()

        let jeremyGif = UIImage.gifImageWithName("splashgif")
        loadingImageView.image = jeremyGif
        
        lblDate.text = Date().dateString(format: AppConfigure.dateFormatWithTime)
        lblDate.font = AppFont.Footnote

        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.finishedLoading()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func finishedLoading() {
        AppDelegate.shared.window?.rootViewController = LoadingAdsScreen.getInstance()
//        AppDelegate.shared.setInitialViewController()
    }

}
