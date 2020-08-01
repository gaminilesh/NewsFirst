//
//  LaunchScreenVC
//  MobifinElite_Swift
//
//  Created by Chirag on 12/19/18.
//  Copyright © 2018 Panamax IOS Team. All rights reserved.
//

import Foundation
import UIKit

class LoadingAdsScreen: UIViewController
{

    @IBOutlet weak var loadingImageView: UIImageView!

    class func getInstance()-> LoadingAdsScreen {
        return LoadingAdsScreen.viewController(storyboard: Constants.Storyboard.Main)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()

        loadingImageView.image = #imageLiteral(resourceName: "adsImage")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.finishedLoading()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func finishedLoading() {
        AppDelegate.shared.setInitialViewController()
    }

}
